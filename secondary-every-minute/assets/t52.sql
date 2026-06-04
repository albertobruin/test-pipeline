/* @bruin

name: public.t52
type: pg.sql
connection: neon

depends:
  - public.t37
  - public.t42

custom_checks:
  - name: always-failing blocking check (tier 5)
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT 1
