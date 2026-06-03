/* @bruin

name: public.t22
type: pg.sql
connection: neon

depends:
  - public.t12
  - public.t15

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't22' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
