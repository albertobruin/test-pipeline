""" @bruin

name: asset_a
type: python

@bruin """

from datetime import datetime

# Get current minute and determine which sixth of the hour we're in
now = datetime.now()
current_sixth = now.minute // 10  # 60 minutes / 6 = 10 minutes per sixth

print(f"Time: {now}")
print(f"Current sixth: {current_sixth}")

# Odd sixths are 1, 3, 5
if current_sixth in [1, 3, 5]:
    raise Exception(f"Task failed: currently in odd sixth {current_sixth}")
