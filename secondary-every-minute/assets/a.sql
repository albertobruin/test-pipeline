/* @bruin

name: public.asset_a
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append


@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    'asset_a' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
