/* @bruin

name: public.t36
type: pg.sql
connection: neon

depends:
  - public.t21
  - public.t25

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't36' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
