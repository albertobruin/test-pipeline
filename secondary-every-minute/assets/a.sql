/* @bruin

name: public.asset_a
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append

custom_checks:
  - name: silly check always passes
    value: 1
    query: select 1
  - name: table row count is not null
    value: 1
    query: select case when count(*) is not null then 1 else 0 end from public.asset_a
  - name: this check always fails
    query: select 0
    value: 1
    notifications:
      slack:
        - channel: "#slack-test-checks"

notifications:
  slack:
    - channel: "#slack-test"

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'asset_a' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
