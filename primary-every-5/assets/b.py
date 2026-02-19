""" @bruin

name: asset_b
secrets:
    - key: neon
      inject_as: test_conn

@bruin """

import time

print("Going to sleep")
time.sleep(60)
print("Yawn ... Woke up")