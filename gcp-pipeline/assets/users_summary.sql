/* @bruin

name: test_data_set_us.users_summary
type: bq.sql
description: User summary table - with custom and quality check examples
connection: gcp-default

materialization:
  type: table

columns:
  - name: user_id
    type: STRING
    description: Unique user identifier
    checks:
      - name: not_null
      - name: unique

  - name: total_orders
    type: INTEGER
    description: Total number of orders
    checks:
      - name: not_null
      - name: non_negative

  - name: status
    type: STRING
    description: User status
    checks:
      - name: not_null
      - name: accepted_values
        value:
          - "active"
          - "inactive"
          - "pending"

custom_checks:
  - name: "Table should not be empty"
    value: 1
    query: |
      SELECT SIGN(COUNT(*)) FROM test_data_set_us.users_summary

  - name: "Total orders should not be negative"
    value: 0
    query: |
      SELECT COUNT(*) FROM test_data_set_us.users_summary WHERE total_orders < 0

  - name: "Active user ratio should be greater than 10%"
    value: 1
    query: |
      SELECT CASE 
        WHEN (SELECT COUNT(*) FROM test_data_set_us.users_summary WHERE status = 'active') * 100.0 / 
             NULLIF((SELECT COUNT(*) FROM test_data_set_us.users_summary), 0) > 10 
        THEN 1 
        ELSE 0 
      END
      
  - name: "Table should have at least 100 rows"
    value: 1
    query: |
      SELECT CASE WHEN COUNT(*) >= 100 THEN 1 ELSE 0 END FROM test_data_set_us.users_summary
@bruin */

SELECT 
  'user_001' as user_id,
  15 as total_orders,
  'active' as status

UNION ALL

SELECT 
  'user_002' as user_id,
  8 as total_orders,
  'inactive' as status

UNION ALL

SELECT 
  'user_003' as user_id,
  0 as total_orders,
  'pending' as status
