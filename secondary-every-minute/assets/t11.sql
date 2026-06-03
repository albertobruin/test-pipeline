/* @bruin

name: public.t11
type: pg.sql
connection: neon

depends:
  - public.t01

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't11' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
