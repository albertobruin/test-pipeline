/* @bruin

name: public.t02
type: pg.sql
connection: neon

custom_checks:
  - name: always-failing blocking check on source t02
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT 1
