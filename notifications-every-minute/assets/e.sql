/* @bruin

name: public.asset_c
type: pg.sql
connection: neon

depends:
  - asset_d

materialization:
    type: table
    strategy: append



@bruin */

SELECT 1
