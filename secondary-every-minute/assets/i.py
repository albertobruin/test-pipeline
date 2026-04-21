""" @bruin

name: asset_i
type: python

depends:
  - public.asset_h
  - public.asset_g

secrets:
    - key: neon
      inject_as: NEON_CONN

@bruin """

import os
import json
import psycopg2

run_id = os.environ.get('BRUIN_END_DATETIME', 'unknown')
neon = json.loads(os.environ.get('NEON_CONN', '{}'))

print(f"Asset I: running for {run_id}")
print("Asset I: completed successfully")
