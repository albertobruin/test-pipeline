/* @bruin

name: public.asset_a
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append

custom_checks:
  - name: non blocking check that always fails
    value: 0
    query: select 1
    blocking: false

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'asset_a' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
