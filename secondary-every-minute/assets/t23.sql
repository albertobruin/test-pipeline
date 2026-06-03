/* @bruin

name: public.t23
type: pg.sql
connection: neon

depends:
  - public.t06
  - public.t13

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't23' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
