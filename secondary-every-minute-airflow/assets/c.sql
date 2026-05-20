/* @bruin

name: public.asset_c
type: pg.sql
connection: neon

depends:
  - public.asset_a
  - public.asset_b

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
    'asset_c' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
