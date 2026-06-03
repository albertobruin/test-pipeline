/* @bruin

name: public.t57
type: pg.sql
connection: neon

depends:
  - public.t47
  - public.t50
  - public.t53

materialization:
    type: table
    strategy: append

@bruin */

SELECT * FROM public.this_table_does_not_exist_intentionally
