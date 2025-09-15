/* @bruin

name: public.special_name
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

@bruin */

select 1 as helloworld
