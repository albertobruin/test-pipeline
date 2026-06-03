/* @bruin

name: public.t46
type: pg.sql
connection: neon

depends:
  - public.t31
  - public.t36

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't46' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
