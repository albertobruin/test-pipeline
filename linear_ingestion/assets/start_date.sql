/* @bruin
name: linear_silver.start_date
type: bq.sql
start_date: "2024-01-01"
materialization:
    type: table


@bruin */

SELECT {{start_date}} as start_date
