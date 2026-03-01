/* @bruin

name: public.asset_c
type: pg.sql
connection: neon

depends:
  - public.asset_a
  - public.asset_b

materialization:
    type: table
    strategy: create+replace

custom_checks:
  - name: silly check always passes
    value: 1
    query: select 1
  - name: table row count is not null
    value: 1
    query: select case when count(*) is not null then 1 else 0 end from public.asset_c

@bruin */

SELECT
    '{{ var.run_id }}' AS run_id,
    'asset_c' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
