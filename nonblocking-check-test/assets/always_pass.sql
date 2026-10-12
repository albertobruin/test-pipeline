/* @bruin

name: public.always_pass
type: pg.sql
connection: neon

custom_checks:
  - name: non-blocking check that always fails
    query: select 0
    value: 1
    blocking: false

@bruin */

SELECT 1
