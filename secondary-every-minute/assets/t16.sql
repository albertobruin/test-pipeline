/* @bruin

name: public.t16
type: pg.sql
connection: neon

depends:
  - public.t06
  - public.t09

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't16' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
