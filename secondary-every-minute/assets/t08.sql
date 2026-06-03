/* @bruin

name: public.t08
type: pg.sql
connection: neon

depends:
  - public.t03
  - public.t04

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't08' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
