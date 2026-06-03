/* @bruin

name: public.t30
type: pg.sql
connection: neon

depends:
  - public.t10
  - public.t13

materialization:
    type: table
    strategy: append

custom_checks:
  - name: always-failing blocking check (tier 3 tail)
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't30' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
