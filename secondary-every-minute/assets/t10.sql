/* @bruin

name: public.t10
type: pg.sql
connection: neon

depends:
  - public.t01
  - public.t05

custom_checks:
  - name: always-failing blocking check (mid-retry mark test)
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT 1
