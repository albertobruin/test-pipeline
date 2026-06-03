/* @bruin

name: public.t35
type: pg.sql
connection: neon

depends:
  - public.t20
  - public.t24

materialization:
    type: table
    strategy: append

custom_checks:
  - name: always-failing non-blocking check (downstream still runs)
    value: 1
    query: select 0

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't35' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
