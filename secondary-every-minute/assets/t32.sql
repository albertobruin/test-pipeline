/* @bruin

name: public.t32
type: pg.sql
connection: neon

depends:
  - public.t17
  - public.t21

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't32' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
