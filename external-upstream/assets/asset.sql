/* @bruin

name: public.upstream
uri: public.upstream
type: pg.sql
connection: neon
materialization:
    type: table

columns:
  - name: helloworld
    type: INTEGER
    description: helloworld as a test column for the asset, force update
    checks:
      - name: not_null
      - name: accepted_values
        value:
          - 1

custom_checks:
  - name: another custom check
    value: 1
    query: select count(*) from public.upstream

@bruin */

select 1 as helloworld
