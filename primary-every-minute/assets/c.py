""" @bruin

name: asset_tdssdadsdfdsfsdfsds
    - key: neon
      inject_as: test_conn

depends:
    -  asset_a
    -  asset_b

@bruin """

import time

print("Going to sleep")
time.sleep(60)
print("Yawn ... Woke up")