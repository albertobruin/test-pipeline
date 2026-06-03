/* @bruin

name: public.t14
type: pg.sql
connection: neon

depends:
  - public.t04

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't14' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
