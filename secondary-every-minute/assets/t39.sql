/* @bruin

name: public.t39
type: pg.sql
connection: neon

depends:
  - public.t24
  - public.t28

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't39' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
