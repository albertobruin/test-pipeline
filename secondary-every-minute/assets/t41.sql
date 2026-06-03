/* @bruin

name: public.t41
type: pg.sql
connection: neon

depends:
  - public.t26
  - public.t30

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't41' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
