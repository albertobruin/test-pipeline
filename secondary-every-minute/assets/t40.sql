/* @bruin

name: public.t40
type: pg.sql
connection: neon

depends:
  - public.t25
  - public.t29

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't40' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
