/* @bruin

name: public.asset_h
type: pg.sql
connection: neon

depends:
  - public.asset_g

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'asset_h' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
