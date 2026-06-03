/* @bruin

name: public.t30
type: pg.sql
connection: neon

depends:
  - public.t10
  - public.t13

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't30' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
