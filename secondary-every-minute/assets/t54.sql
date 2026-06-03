/* @bruin

name: public.t54
type: pg.sql
connection: neon

depends:
  - public.t39
  - public.t44

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't54' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
