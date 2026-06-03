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

custom_checks:
  - name: always-failing blocking check (tier 2)
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't09' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
