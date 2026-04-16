""" @bruin

name: asset_a
secrets:
    - key: neon
      inject_as: test_conn

depends:
    - uri: albertotest://primary-every-minute/assets/public.asset_a

@bruin """

import time

print("Going to sleep")
time.sleep(10)
print("Yawn ... Woke up")