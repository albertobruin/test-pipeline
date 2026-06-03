/* @bruin

name: public.t31
type: pg.sql
connection: neon

depends:
  - public.t16
  - public.t20

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't31' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
