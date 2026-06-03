/* @bruin

name: public.t34
type: pg.sql
connection: neon

depends:
  - public.t19
  - public.t23

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't34' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
