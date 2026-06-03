/* @bruin

name: public.t49
type: pg.sql
connection: neon

depends:
  - public.t34
  - public.t39

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't49' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
