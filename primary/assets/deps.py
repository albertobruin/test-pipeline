""" @bruin

name: python.test  
secrets:
    - key: neon
      inject_as: test_conn

@bruin """

import os 
import time
import logging
import random

print("Bruin says hello!!!!")
print("Here are some global variables: ")
print("  - BRUIN_START_TIMESTAMP: ", os.getenv('BRUIN_START_TIMESTAMP'))
print("  - BRUIN_END_TIMESTAMP: ", os.getenv('BRUIN_END_TIMESTAMP'))
print("  - BRUIN_RUN_ID: ", os.getenv('BRUIN_RUN_ID'))


logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

print("Logging a test info message from deps.py")
logger.info("This is an info log from deps.py")
print("Logging a test error message from deps.py")
logger.error("This is a warning log from deps.py")
  
# import random
time.sleep(300)
if random.random() < 0.5:
    raise Exception("Heads! You lose!")
else:
    print("Tails! You win!")


print("We are done here.")
