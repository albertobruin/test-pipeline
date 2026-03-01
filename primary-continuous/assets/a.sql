/* @bruin

name: public.asset_a
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: create+replace

custom_checks:
  - name: silly check always passes
    value: 1
    query: select 1
  - name: table row count is not null
    value: 1
    query: select case when count(*) is not null then 1 else 0 end from public.asset_a

@bruin */

SELECT
    '{{ run_id }}' AS run_id,
    'asset_a' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
