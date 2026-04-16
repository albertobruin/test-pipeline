""" @bruin

name: asset_e
type: python

@bruin """

import random

if random.random() < 0.8:
    raise Exception("Intentional random failure (80% chance)")

print("Asset E: completed successfully")
