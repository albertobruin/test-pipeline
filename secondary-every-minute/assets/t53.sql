/* @bruin

name: public.t53
type: pg.sql
connection: neon

depends:
  - public.t38
  - public.t43

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't53' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
