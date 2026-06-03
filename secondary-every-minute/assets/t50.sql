/* @bruin

name: public.t50
type: pg.sql
connection: neon

depends:
  - public.t35
  - public.t40

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't50' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
