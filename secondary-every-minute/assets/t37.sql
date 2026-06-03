/* @bruin

name: public.t37
type: pg.sql
connection: neon

depends:
  - public.t22
  - public.t26

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't37' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
