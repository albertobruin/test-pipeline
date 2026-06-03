/* @bruin

name: public.t25
type: pg.sql
connection: neon

depends:
  - public.t08
  - public.t15

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't25' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
