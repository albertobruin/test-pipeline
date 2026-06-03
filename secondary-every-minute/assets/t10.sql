/* @bruin

name: public.t10
type: pg.sql
connection: neon

depends:
  - public.t01
  - public.t05

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't10' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
