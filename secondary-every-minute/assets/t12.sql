/* @bruin

name: public.t12
type: pg.sql
connection: neon

depends:
  - public.t02

materialization:
    type: table
    strategy: append

custom_checks:
  - name: always-failing non-blocking check (tier 2, downstream still runs)
    value: 1
    query: select 0

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't12' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
