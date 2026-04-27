/* @bruin

name: public.asset_b
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append

notifications:
  slack:
    - channel: "#slack-test"
      success: false

custom_checks:
  - name: coin flip check fails 50 pct
    value: 1
    query: select case when random() < 0.5 then 1 else 0 end
    notifications:
      slack:
        - channel: "#slack-test"
          success: false
  - name: table row count is not null
    value: 1
    query: select case when count(*) is not null then 1 else 0 end from public.asset_b
    notifications:
      slack:
        - channel: "#slack-test"
          success: false

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'asset_b' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
