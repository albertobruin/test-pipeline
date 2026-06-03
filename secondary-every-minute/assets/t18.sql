/* @bruin

name: public.t18
type: pg.sql
connection: neon

depends:
  - public.t08
  - public.t11

materialization:
    type: table
    strategy: append

@bruin */

SELECT * FROM public.this_table_does_not_exist_intentionally
