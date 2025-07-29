""" @bruin

name: asset_a
secrets:
    - key: aws
      inject_as: test_conn

@bruin """

import os 
import time


print('brb, taking a quick nap')
print(os.environ['test_conn'])
# time.sleep(1)
import random

# if random.random() > 10.5:
#     raise Exception("Heads! You lose!")
# else:
#     print("Tails! You win!")




print("We are done here.")