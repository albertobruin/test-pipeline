""" @bruin

name: flaky_asset

@bruin """

import random

print("Running flaky asset...")
if random.random() < 0.5:
    raise Exception("Random failure!")
print("Flaky asset succeeded!")
