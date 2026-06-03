/* @bruin

name: public.t45
type: pg.sql
connection: neon

depends:
  - public.t19
  - public.t30

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't45' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
