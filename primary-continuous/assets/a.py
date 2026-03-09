""" @bruin

name: asset_a
secrets:
    - key: neon
      inject_as: test_conn

@bruin """

import time
import random

print("Going to sleep")
time.sleep(10)
print("Yawn ... Woke up")
if random.random() < 0.5:
  raise Exception("Random exception occurred")