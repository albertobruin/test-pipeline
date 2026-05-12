/* @bruin

name: public.asset_g
type: pg.sql
connection: neon

depends:
  - public.asset_f

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
    'asset_g' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
