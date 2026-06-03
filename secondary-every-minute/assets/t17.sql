/* @bruin

name: public.t17
type: pg.sql
connection: neon

depends:
  - public.t07
  - public.t10

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't17' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
