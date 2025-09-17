/* @bruin
name: linear_silver.issues
type: bq.sql
description: Silver layer for Linear issues with cleaned and enriched data
materialization:
    type: table

depends:
  - linear.issues

custom_checks:
  - name: row count is greater than zero
    query: SELECT count(*) > 0 FROM linear_silver.issues
    value: 1

columns:
  - name: issue_id
    type: STRING
    checks:
      - name: not_null
  - name: title
    type: STRING
    checks:
      - name: pattern
        value: "^[A-Z][a-z]*$"



tags:
  - linear
  - silver
  - issues
  - transformed
@bruin */

WITH base_issues AS (
  SELECT 
    ID as issue_id,
    TITLE as title,
    DESCRIPTION as description,
    STATE_ID as state_name,
    PRIORITY as priority_level,
    ASSIGNEE_ID as assignee_id,
    -- Note: using NULL as teamId since it's not in the schema we saw
    NULL as team_id,
    -- Note: using NULL as projectId since it's not in the schema we saw  
    NULL as project_id,
    CAST(CREATED_AT AS TIMESTAMP) as created_at,
    CAST(UPDATED_AT AS TIMESTAMP) as updated_at
  FROM `linear.issues`
),

enriched_issues AS (
  SELECT 
    *,
    -- Priority label mapping
    CASE 
      WHEN priority_level = 1 THEN 'Urgent'
      WHEN priority_level = 2 THEN 'High'
      WHEN priority_level = 3 THEN 'Medium'
      WHEN priority_level = 4 THEN 'Low'
      ELSE 'Unknown'
    END as priority_label,
    
    -- Date calculations
    DATE_DIFF(CURRENT_DATE(), DATE(created_at), DAY) as days_since_created,
    DATE_DIFF(CURRENT_DATE(), DATE(updated_at), DAY) as days_since_updated,
    
    -- Boolean flags
    DATE_DIFF(CURRENT_DATE(), DATE(updated_at), DAY) > 30 as is_stale,
    assignee_id IS NOT NULL as has_assignee,
    description IS NOT NULL AND TRIM(description) != '' as has_description,
    
    -- Text analysis
    LENGTH(TRIM(title)) as title_length,
    
    -- Date only fields
    DATE(created_at) as created_date,
    DATE(updated_at) as updated_date
    
  FROM base_issues
)

SELECT 
  issue_id,
  TRIM(title) as title,
  TRIM(description) as description,
  state_name,
  priority_level,
  priority_label,
  assignee_id,
  team_id,
  project_id,
  created_at,
  updated_at,
  days_since_created,
  days_since_updated,
  is_stale,
  has_assignee,
  title_length,
  has_description,
  created_date,
  updated_date
FROM enriched_issues
WHERE issue_id IS NOT NULL  -- Data quality filter
ORDER BY updated_at DESC