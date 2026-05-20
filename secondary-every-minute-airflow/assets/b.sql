/* @bruin

name: public.asset_b
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append

custom_checks:
  - name: silly check always passes
    value: 1
    query: select 1

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'asset_b' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
