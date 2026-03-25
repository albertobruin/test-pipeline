""" @bruin

name: asset_b
type: python


@bruin """

from datetime import datetime
import time

# Get current minute and determine which sixth of the hour we're in
now = datetime.now()
current_sixth = now.minute // 10  # 60 minutes / 6 = 10 minutes per sixth

print(f"Time: {now}")
print(f"Current sixth: {current_sixth}")
print("sleeping for 30 seconds to simulate work...")
time.sleep(30)

# Odd sixths are 1, 3, 5
if current_sixth in [1, 3, 5]:
    raise Exception(f"Task failed: currently in odd sixth {current_sixth}")
