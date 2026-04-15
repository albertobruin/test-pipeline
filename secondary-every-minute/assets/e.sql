/* @bruin

name: public.asset_e
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append

notifications:
  slack:
    - channel: "#slack-test"
      success: true

@bruin */

SELECT
    CASE WHEN random() < 0.2 THEN 1/0 END,
    '{{ end_datetime }}' AS run_id,
    'asset_e' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
