/* @bruin

name: test_data_set_us.products
type: bq.sql
description: Product catalog with inventory checks
materialization:
    type: table

columns:
  - name: product_id
    type: INTEGER
    description: Unique product identifier
    checks:
      - name: not_null
      - name: unique
  - name: product_name
    type: STRING
    description: Name of the product
    checks:
      - name: not_null
  - name: category
    type: STRING
    description: Product category
    checks:
      - name: accepted_values
        value:
          - Electronics
          - Clothing
          - Books
          - Home
  - name: price
    type: FLOAT
    description: Product price
    checks:
      - name: positive
  - name: stock_quantity
    type: INTEGER
    description: Available stock
    checks:
      - name: non_negative

custom_checks:
  - name: products_exist
    description: Ensure product catalog is not empty
    value: 1
    query: select case when count(*) > 0 then 1 else 0 end from test_data_set_us.products
  - name: average_price_check
    description: Average price should be greater than 10
    value: 1
    query: select case when avg(price) > 10 then 1 else 0 end from test_data_set_us.products
  - name: no_negative_stock
    description: No products should have negative stock
    value: 0
    query: select count(*) from test_data_set_us.products where stock_quantity < 0

@bruin */

select 
    101 as product_id,
    'Wireless Headphones' as product_name,
    'Electronics' as category,
    79.99 as price,
    50 as stock_quantity
union all
select 102, 'Cotton T-Shirt', 'Clothing', 24.99, 200
union all
select 103, 'Python Programming Book', 'Books', 45.00, 30
union all
select 104, 'Smart Watch', 'Electronics', 199.99, 25

