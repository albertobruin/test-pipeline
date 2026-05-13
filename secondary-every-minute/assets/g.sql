/* @bruin

name: public.asset_g
type: pg.sql
connection: neon

depends:
  - public.asset_f

materialization:
    type: table
    strategy: create+replace

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'asset_g' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
