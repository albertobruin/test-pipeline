""" @bruin

name: stress.test_1
secrets:
    - key: neon
      inject_as: test_conn

@bruin """
from streamer import main
import os
import json
import psycopg2

if __name__ == "__main__":
    conn_info = json.loads(os.getenv("test_conn"))
    conn = psycopg2.connect(
      dbname=conn_info["database"],
      user=conn_info["username"],
      password=conn_info["password"],
      host=conn_info["host"],
      port=conn_info["port"]
    )
    print("Connected to Postgres:", conn_info["host"])
    cur = conn.cursor()
    cur.execute("UPDATE public.counter SET counter = 1 ")
    conn.commit()

    cur.close()
    conn.close()
    main()
