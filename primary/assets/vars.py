""" @bruin

name: vars.test 
secrets:
    - key: neon
      inject_as: test_conn

@bruin """


import os, json
vars = json.loads(os.environ["BRUIN_VARS"])
print(vars)