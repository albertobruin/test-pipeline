/* @bruin

name: test_data_set_us.orders
type: bq.sql
description: Sample orders table with quality checks
materialization:
    type: table

columns:
  - name: order_id
    type: INTEGER
    description: Unique order identifier
    checks:
      - name: not_null
      - name: unique
  - name: customer_name
    type: STRING
    description: Name of the customer
    checks:
      - name: not_null
  - name: amount
    type: FLOAT
    description: Order amount in USD
    checks:
      - name: not_null
      - name: positive

custom_checks:
  - name: total_orders_positive
    description: Ensure we have at least one order
    value: 1
    query: select case when count(*) >= 1 then 1 else 0 end from test_data_set_us.orders
  - name: max_amount_reasonable
    description: Check that max order amount is under 10000
    value: 1
    query: select case when max(amount) < 10000 then 1 else 0 end from test_data_set_us.orders

@bruin */

select 
    1 as order_id,
    'John Doe' as customer_name,
    150.50 as amount,
    current_timestamp() as order_date
union all
select 2, 'Jane Smith', 275.00, current_timestamp()
union all
select 3, 'Bob Wilson', 89.99, current_timestamp()

