/* @bruin

name: public.t42
type: pg.sql
connection: neon

depends:
  - public.t16
  - public.t27

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't42' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
