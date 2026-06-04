/* @bruin

name: public.t01
type: pg.sql
connection: neon

custom_checks:
  - name: always-failing blocking check on a source
    value: 1
    query: select 0
    blocking: true

@bruin */

SELECT 1
