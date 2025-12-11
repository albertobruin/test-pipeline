/* @bruin
name: test_data_set_us.fake_revenue
type: bq.sql
materialization:
  type: table
columns:
  - name: date
    type: DATE
    description: Transaction date
    checks:
        - name: not_null
  - name: revenue
    type: FLOAT64
    description: Daily revenue amount
  - name: orders
    type: INT64
    description: Number of daily orders
@bruin */

WITH dates AS (
  SELECT date
  FROM UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY), CURRENT_DATE())) AS date
)

SELECT
  date,
  ROUND(1000 + RAND() * 5000, 2) AS revenue,
  CAST(FLOOR(50 + RAND() * 100) AS INT64) AS orders,
  CASE CAST(FLOOR(RAND() * 3) AS INT64)
    WHEN 0 THEN 'Electronics'
    WHEN 1 THEN 'Fashion'
    ELSE 'Home & Garden'
  END as category
FROM dates
