/* @bruin

name: public.t57
type: pg.sql
connection: neon

depends:
  - public.t47
  - public.t50
  - public.t53

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't57' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
