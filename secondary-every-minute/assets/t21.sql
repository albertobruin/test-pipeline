/* @bruin

name: public.t21
type: pg.sql
connection: neon

depends:
  - public.t11
  - public.t14

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't21' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
