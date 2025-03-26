"""@bruin
name: test_asset
type: python

@bruin"""

from time import sleep
import os

print('hello world')
sleep(600)
print('bye world')




print('BRUIN_START_DATETIME:', os.environ.get('BRUIN_START_DATETIME'))
print('BRUIN_END_DATETIME:', os.environ.get('BRUIN_END_DATETIME'))
