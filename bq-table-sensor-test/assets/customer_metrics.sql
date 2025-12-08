/* @bruin

name: test_data_set_us.customer_metrics
type: bq.sql
description: Customer metrics and KPIs with comprehensive checks
materialization:
    type: table

columns:
  - name: customer_id
    type: INTEGER
    description: Unique customer identifier
    checks:
      - name: not_null
      - name: unique
  - name: email
    type: STRING
    description: Customer email address
    checks:
      - name: not_null
      - name: unique
  - name: total_orders
    type: INTEGER
    description: Total number of orders placed
    checks:
      - name: non_negative
  - name: total_spent
    type: FLOAT
    description: Total amount spent by customer
    checks:
      - name: non_negative
  - name: customer_tier
    type: STRING
    description: Customer loyalty tier
    checks:
      - name: accepted_values
        value:
          - Bronze
          - Silver
          - Gold
          - Platinum

custom_checks:
  - name: customer_count_check
    description: Should have at least one customer
    value: 1
    query: select case when count(*) >= 1 then 1 else 0 end from test_data_set_us.customer_metrics
  - name: valid_email_format
    description: All emails should contain @ symbol
    value: 0
    query: select count(*) from test_data_set_us.customer_metrics where email not like '%@%'
  - name: tier_distribution_check
    description: Gold and Platinum customers should exist
    value: 1
    query: |
      select case 
        when count(distinct customer_tier) >= 2 then 1 
        else 0 
      end 
      from test_data_set_us.customer_metrics
  - name: average_spent_reasonable
    description: Average total spent should be positive
    value: 1
    query: select case when avg(total_spent) > 0 then 1 else 0 end from test_data_set_us.customer_metrics

@bruin */

select 
    1001 as customer_id,
    'john.doe@email.com' as email,
    15 as total_orders,
    1250.75 as total_spent,
    'Gold' as customer_tier
union all
select 1002, 'jane.smith@email.com', 3, 150.00, 'Bronze'
union all
select 1003, 'bob.wilson@email.com', 8, 680.50, 'Silver'
union all
select 1004, 'alice.johnson@email.com', 25, 3500.00, 'Platinum'

