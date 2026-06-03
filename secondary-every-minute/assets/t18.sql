/* @bruin

name: public.t18
type: pg.sql
connection: neon

depends:
  - public.t08
  - public.t11

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't18' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
