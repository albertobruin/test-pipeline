/* @bruin

name: public.t10
type: pg.sql
connection: neon

depends:
  - public.t01
  - public.t05

custom_checks:
  - name: flaky blocking check (retry-then-success test)
    value: 1
    query: select case when random() > 0.4 then 1 else 0 end
    blocking: true

@bruin */

SELECT 1
