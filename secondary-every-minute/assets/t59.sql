/* @bruin

name: public.t59
type: pg.sql
connection: neon

depends:
  - public.t49
  - public.t52
  - public.t55

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't59' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
