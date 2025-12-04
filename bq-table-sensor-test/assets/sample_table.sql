/* @bruin
name: test_data_set_us.sample_table
type: bq.sql
materialization:
    type: table
@bruin */

select 
    1 as id,
    'Sample Data' as name,
    current_timestamp() as created_at,
    100 as value

