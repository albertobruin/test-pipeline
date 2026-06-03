/* @bruin

name: public.t09
type: pg.sql
connection: neon

depends:
  - public.t04
  - public.t05

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't09' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
