/* @bruin

name: public.t10
type: pg.sql
connection: neon

depends:
  - public.t01
  - public.t05

@bruin */

SELECT * FROM public.this_table_does_not_exist_intentionally
