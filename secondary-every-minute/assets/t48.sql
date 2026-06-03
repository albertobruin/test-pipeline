/* @bruin

name: public.t48
type: pg.sql
connection: neon

depends:
  - public.t33
  - public.t38

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't48' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
