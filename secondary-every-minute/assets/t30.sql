/* @bruin

name: public.t30
type: pg.sql
connection: neon

depends:
  - public.t10
  - public.t13

custom_checks:
  - name: always-failing blocking check (tier 3 tail)
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT 1
