/* @bruin

name: public.downstream
type: pg.sql
connection: neon
materialization:
    type: table

depends:
  - uri: public.upstream
@bruin */

select 1 as helloworld
