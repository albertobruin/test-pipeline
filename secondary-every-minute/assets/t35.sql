/* @bruin

name: public.t35
type: pg.sql
connection: neon

depends:
  - public.t20
  - public.t24

custom_checks:
  - name: always-failing non-blocking check (downstream still runs)
    value: 1
    query: select 0

@bruin */

SELECT 1
