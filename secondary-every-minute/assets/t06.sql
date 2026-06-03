/* @bruin

name: public.t06
type: pg.sql
connection: neon

depends:
  - public.t01
  - public.t02

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't06' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
