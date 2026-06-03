/* @bruin

name: public.t52
type: pg.sql
connection: neon

depends:
  - public.t37
  - public.t42

materialization:
    type: table
    strategy: append

custom_checks:
  - name: always-failing blocking check (near sinks)
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't52' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
