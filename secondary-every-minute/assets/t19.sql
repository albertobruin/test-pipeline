/* @bruin

name: public.t19
type: pg.sql
connection: neon

depends:
  - public.t09
  - public.t12

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't19' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
