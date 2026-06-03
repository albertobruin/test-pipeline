/* @bruin

name: public.t15
type: pg.sql
connection: neon

depends:
  - public.t05

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't15' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
