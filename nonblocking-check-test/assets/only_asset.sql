/* @bruin

name: public.nonblocking_test
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: create+replace

custom_checks:
  - name: non blocking check that always fails
    value: 0
    query: select 1
    blocking: false

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'nonblocking_test' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
