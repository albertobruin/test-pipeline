/* @bruin

name: public.something
type: pg.sql
connection: NEON
materialization:
    type: table

columns:
  - name: one
    type: INTEGER
    description: one as a test column for the asset
    checks:
      - name: not_null
      - name: accepted_values
        value:
          - 1

custom_checks:
  - name: another custom check
    value: 1
    query: select count(*) from public.something

@bruin */

select 1 as one, 2 as two
