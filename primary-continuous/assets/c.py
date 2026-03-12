""" @bruin

name: asset_c
secrets:
    - key: neon
      inject_as: test_conn

depends:
    -  asset_a
    -  asset_b

@bruin """

import time
import random

print("Going to sleep")
time.sleep(300)
print("Yawn ... Woke up")
if random.random() < 1/3:
    raise Exception("Random exception occurred")