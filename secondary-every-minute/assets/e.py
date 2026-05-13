""" @bruin

name: public.asset_e
type: python

secrets:
    - key: neon
      inject_as: NEON_CONN

custom_checks:
  - name: non blocking check that always fails
    value: 0
    query: select 1
    blocking: false

@bruin """

import os
import json
import random
import psycopg2

run_id = os.environ.get('BRUIN_END_DATETIME', 'unknown')
inserted_at = os.environ.get('BRUIN_EXECUTION_TIMESTAMP', 'unknown')
neon = json.loads(os.environ.get('NEON_CONN', '{}'))

conn = psycopg2.connect(
    host=neon.get("host"),
    port=neon.get("port", 5432),
    dbname=neon.get("database"),
    user=neon.get("username"),
    password=neon.get("password"),
)
cur = conn.cursor()

cur.execute("""
    CREATE TABLE IF NOT EXISTS public.asset_e (
        run_id TEXT,
        asset_name TEXT,
        inserted_at TEXT
    )
""")

cur.execute(
    "INSERT INTO public.asset_e (run_id, asset_name, inserted_at) VALUES (%s, %s, %s)",
    (run_id, 'asset_e', inserted_at)
)

conn.commit()
cur.close()
conn.close()
