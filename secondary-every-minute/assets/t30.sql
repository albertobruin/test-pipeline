/* @bruin

name: public.t30
type: pg.sql
connection: neon

depends:
  - public.t20
  - public.t24

custom_checks:
  - name: always-failing blocking check on a leaf
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT 1
