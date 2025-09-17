/* @bruin
name: linear_silver.issue_trends
type: bq.sql
description: Silver layer for Linear issue trends and time-series analysis
materialization:
    type: table

depends:
  - linear_silver.issues

columns:
  - name: trend_date
    type: DATE
    description: Date for trend analysis
    primary_key: true
  - name: team_id
    type: STRING
    description: Team identifier
    primary_key: true
  - name: issues_created
    type: INTEGER
    description: Number of issues created on this date by this team
  - name: issues_updated
    type: INTEGER
    description: Number of issues updated on this date by this team
  - name: avg_resolution_time_days
    type: FLOAT
    description: Average time to resolve issues (for closed issues)
  - name: backlog_size
    type: INTEGER
    description: Total open issues as of this date
  - name: priority_distribution_urgent
    type: INTEGER
    description: Number of urgent issues
  - name: priority_distribution_high
    type: INTEGER
    description: Number of high priority issues
  - name: priority_distribution_medium
    type: INTEGER
    description: Number of medium priority issues
  - name: priority_distribution_low
    type: INTEGER
    description: Number of low priority issues
  - name: assignment_rate
    type: FLOAT
    description: Percentage of issues with assignees

tags:
  - linear
  - silver
  - trends
  - time-series
@bruin */

WITH date_spine AS (
  SELECT 
    date_val as trend_date
  FROM 
    UNNEST(GENERATE_DATE_ARRAY(
      DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY), 
      CURRENT_DATE()
    )) AS date_val
),

team_spine AS (
  SELECT DISTINCT team_id
  FROM `linear_silver.issues`
  WHERE team_id IS NOT NULL
),

date_team_spine AS (
  SELECT 
    d.trend_date,
    t.team_id
  FROM date_spine d
  CROSS JOIN team_spine t
),

daily_team_metrics AS (
  SELECT 
    DATE(created_at) as trend_date,
    team_id,
    COUNT(*) as issues_created,
    0 as issues_updated,
    NULL as avg_resolution_time_days
  FROM `linear_silver.issues`
  WHERE team_id IS NOT NULL
    AND created_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
  GROUP BY 1, 2
  
  UNION ALL
  
  SELECT 
    DATE(updated_at) as trend_date,
    team_id,
    0 as issues_created,
    COUNT(*) as issues_updated,
    NULL as avg_resolution_time_days
  FROM `linear_silver.issues`
  WHERE team_id IS NOT NULL
    AND updated_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
    AND DATE(updated_at) != DATE(created_at)  -- Avoid double counting
  GROUP BY 1, 2
),

backlog_metrics AS (
  SELECT 
    dts.trend_date,
    dts.team_id,
    COUNT(CASE WHEN i.state_name NOT IN ('Done', 'Closed', 'Canceled') 
               AND i.created_date <= dts.trend_date THEN 1 END) as backlog_size,
    
    -- Priority distribution
    COUNT(CASE WHEN i.priority_level = 1 
               AND i.state_name NOT IN ('Done', 'Closed', 'Canceled')
               AND i.created_date <= dts.trend_date THEN 1 END) as priority_distribution_urgent,
    COUNT(CASE WHEN i.priority_level = 2 
               AND i.state_name NOT IN ('Done', 'Closed', 'Canceled')
               AND i.created_date <= dts.trend_date THEN 1 END) as priority_distribution_high,
    COUNT(CASE WHEN i.priority_level = 3 
               AND i.state_name NOT IN ('Done', 'Closed', 'Canceled')
               AND i.created_date <= dts.trend_date THEN 1 END) as priority_distribution_medium,
    COUNT(CASE WHEN i.priority_level = 4 
               AND i.state_name NOT IN ('Done', 'Closed', 'Canceled')
               AND i.created_date <= dts.trend_date THEN 1 END) as priority_distribution_low,
    
    -- Assignment rate
    SAFE_DIVIDE(
      COUNT(CASE WHEN i.has_assignee 
                 AND i.state_name NOT IN ('Done', 'Closed', 'Canceled')
                 AND i.created_date <= dts.trend_date THEN 1 END),
      COUNT(CASE WHEN i.state_name NOT IN ('Done', 'Closed', 'Canceled')
                 AND i.created_date <= dts.trend_date THEN 1 END)
    ) * 100 as assignment_rate
    
  FROM date_team_spine dts
  LEFT JOIN `linear_silver.issues` i 
    ON i.team_id = dts.team_id
  GROUP BY 1, 2
),

aggregated_metrics AS (
  SELECT 
    dts.trend_date,
    dts.team_id,
    COALESCE(SUM(dtm.issues_created), 0) as issues_created,
    COALESCE(SUM(dtm.issues_updated), 0) as issues_updated,
    AVG(dtm.avg_resolution_time_days) as avg_resolution_time_days
  FROM date_team_spine dts
  LEFT JOIN daily_team_metrics dtm 
    ON dts.trend_date = dtm.trend_date 
    AND dts.team_id = dtm.team_id
  GROUP BY 1, 2
)

SELECT 
  am.trend_date,
  am.team_id,
  am.issues_created,
  am.issues_updated,
  am.avg_resolution_time_days,
  COALESCE(bm.backlog_size, 0) as backlog_size,
  COALESCE(bm.priority_distribution_urgent, 0) as priority_distribution_urgent,
  COALESCE(bm.priority_distribution_high, 0) as priority_distribution_high,
  COALESCE(bm.priority_distribution_medium, 0) as priority_distribution_medium,
  COALESCE(bm.priority_distribution_low, 0) as priority_distribution_low,
  ROUND(COALESCE(bm.assignment_rate, 0), 2) as assignment_rate
FROM aggregated_metrics am
LEFT JOIN backlog_metrics bm 
  ON am.trend_date = bm.trend_date 
  AND am.team_id = bm.team_id
ORDER BY am.trend_date DESC, am.team_id