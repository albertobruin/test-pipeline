/* @bruin
name: linear_silver.issue_metrics
type: bq.sql
description: Silver layer metrics and aggregations for Linear issues
materialization:
    type: table

depends:
  - linear_silver.issues

columns:
  - name: metric_date
    type: DATE
    description: Date for the metrics calculation
    primary_key: true
  - name: total_issues
    type: INTEGER
    description: Total number of issues
  - name: issues_created_today
    type: INTEGER
    description: Number of issues created on this date
  - name: issues_updated_today
    type: INTEGER
    description: Number of issues updated on this date
  - name: open_issues
    type: INTEGER
    description: Number of open/active issues
  - name: closed_issues
    type: INTEGER
    description: Number of closed issues
  - name: urgent_issues
    type: INTEGER
    description: Number of urgent priority issues
  - name: high_priority_issues
    type: INTEGER
    description: Number of high priority issues
  - name: stale_issues
    type: INTEGER
    description: Number of stale issues (not updated in 30+ days)
  - name: unassigned_issues
    type: INTEGER
    description: Number of issues without assignees
  - name: avg_days_since_created
    type: FLOAT
    description: Average days since issues were created
  - name: avg_days_since_updated
    type: FLOAT
    description: Average days since issues were updated
  - name: avg_title_length
    type: FLOAT
    description: Average length of issue titles

tags:
  - linear
  - silver
  - metrics
  - aggregated
@bruin */

WITH daily_metrics AS (
  SELECT 
    CURRENT_DATE() as metric_date,
    
    -- Counts
    COUNT(*) as total_issues,
    COUNT(CASE WHEN created_date = CURRENT_DATE() THEN 1 END) as issues_created_today,
    COUNT(CASE WHEN updated_date = CURRENT_DATE() THEN 1 END) as issues_updated_today,
    
    -- Status counts
    COUNT(CASE WHEN state_name NOT IN ('Done', 'Closed', 'Canceled') THEN 1 END) as open_issues,
    COUNT(CASE WHEN state_name IN ('Done', 'Closed', 'Canceled') THEN 1 END) as closed_issues,
    
    -- Priority counts
    COUNT(CASE WHEN priority_level = 1 THEN 1 END) as urgent_issues,
    COUNT(CASE WHEN priority_level = 2 THEN 1 END) as high_priority_issues,
    
    -- Special conditions
    COUNT(CASE WHEN is_stale THEN 1 END) as stale_issues,
    COUNT(CASE WHEN NOT has_assignee THEN 1 END) as unassigned_issues,
    
    -- Averages
    AVG(days_since_created) as avg_days_since_created,
    AVG(days_since_updated) as avg_days_since_updated,
    AVG(title_length) as avg_title_length
    
  FROM `linear_silver.issues`
)

SELECT 
  metric_date,
  total_issues,
  issues_created_today,
  issues_updated_today,
  open_issues,
  closed_issues,
  urgent_issues,
  high_priority_issues,
  stale_issues,
  unassigned_issues,
  ROUND(avg_days_since_created, 2) as avg_days_since_created,
  ROUND(avg_days_since_updated, 2) as avg_days_since_updated,
  ROUND(avg_title_length, 2) as avg_title_length
FROM daily_metrics