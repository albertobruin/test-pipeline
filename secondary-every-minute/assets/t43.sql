/* @bruin

name: public.t43
type: pg.sql
connection: neon

depends:
  - public.t17
  - public.t28

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't43' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
