/* @bruin

name: public.t56
type: pg.sql
connection: neon

depends:
  - public.t46
  - public.t49
  - public.t52

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't56' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
