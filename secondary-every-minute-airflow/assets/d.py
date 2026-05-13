""" @bruin

name: asset_d
type: python

depends:
  - public.asset_c

secrets:
    - key: neon
      inject_as: NEON_CONN

custom_checks:
  - name: check always passes
    query: select 1
    value: 1

@bruin """

import os
import json
import psycopg2

run_id = os.environ.get('BRUIN_END_DATETIME', 'unknown')
neon = json.loads(os.environ.get('NEON_CONN', '{}'))

print(f"Asset D: verifying execution order for run {run_id}")

conn = psycopg2.connect(
    host=neon.get("host"),
    port=neon.get("port", 5432),
    dbname=neon.get("database"),
    user=neon.get("username"),
    password=neon.get("password"),
)
cur = conn.cursor()

timestamps = {}
for table in ['public.asset_a', 'public.asset_b', 'public.asset_c']:
    cur.execute("SELECT asset_name, inserted_at FROM {} WHERE run_id = %s".format(table), (run_id,))
    row = cur.fetchone()
    if row:
        asset_name, inserted_at = row
        timestamps[asset_name] = inserted_at
        print(f"  {asset_name}: inserted_at = {inserted_at}")
    else:
        raise Exception(f"No row found in {table} for run_id {run_id}")

cur.close()
conn.close()

# Verify ordering: a and b must run before or at the same time as c
assert timestamps['asset_a'] <= timestamps['asset_c'], \
    f"Order violation: asset_a ({timestamps['asset_a']}) ran after asset_c ({timestamps['asset_c']})"
assert timestamps['asset_b'] <= timestamps['asset_c'], \
    f"Order violation: asset_b ({timestamps['asset_b']}) ran after asset_c ({timestamps['asset_c']})"

print("Asset D: execution order verified successfully")
