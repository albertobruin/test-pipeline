/* @bruin

name: public.asset_j
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append


@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'dotted_test.asset_j' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
