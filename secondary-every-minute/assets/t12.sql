/* @bruin

name: public.t12
type: pg.sql
connection: neon

depends:
  - public.t02

custom_checks:
  - name: always-failing non-blocking check (tier 2, downstream still runs)
    value: 1
    query: select 0

@bruin */

SELECT 1
