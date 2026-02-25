""" @bruin

name: asset_d
type: python

depends:
  - public.asset_c

secrets:
    - key: neon
      inject_as: NEON_CONN

@bruin """

import os
import json

print(f"Asset D running downstream of C")
print(f"Run ID: {os.environ.get('BRUIN_RUN_ID', 'unknown')}")
print(f"Pipeline: {os.environ.get('BRUIN_PIPELINE', 'unknown')}")
print("Asset D completed successfully")
