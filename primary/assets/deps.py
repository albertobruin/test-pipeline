""" @bruin

name: python.test  
secrets:
    - key: neon
      inject_as: test_conn

@bruin """

import os 
import time

print("Bruin says hello!")
print("Here are some global variables: ")
print("  - BRUIN_START_TIMESTAMP: ", os.getenv('BRUIN_START_TIMESTAMP'))
print("  - BRUIN_END_TIMESTAMP: ", os.getenv('BRUIN_END_TIMESTAMP'))
print("  - BRUIN_RUN_ID: ", os.getenv('BRUIN_RUN_ID'))

conn_name = "test_conn"
if conn_name in os.environ:
    print(f"Connection {conn_name} exists in environment variables")
else:
    print(f"Connection {conn_name} not found in environment variables")

print('brb, taking a quick nap')
time.sleep(30)


print("We are done here.")