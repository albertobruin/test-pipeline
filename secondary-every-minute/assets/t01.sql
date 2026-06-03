/* @bruin

name: public.t01
type: pg.sql
connection: neon

materialization:
    type: table
    strategy: append

@bruin */

SELECT
    '{{ end_datetime }}' AS run_id,
    't01' AS asset_name,
    '{{ execution_timestamp }}' AS inserted_at
