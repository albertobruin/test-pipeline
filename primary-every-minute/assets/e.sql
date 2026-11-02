/* @bruin

name: public.asset_e
type: pg.sql
connection: neon

depends:
  - asset_d

materialization:
    type: table
    strategy: append



@bruin */

SELECT 1
