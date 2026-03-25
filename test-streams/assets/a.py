""" @bruin

name: asset_a
type: python

@bruin """

from datetime import datetime

# Get current hour and minute
now = datetime.now()
minutes_in_day = now.hour * 60 + now.minute
sixth_duration = 240  # 1440 minutes / 6 = 240 minutes per sixth
current_sixth = minutes_in_day // sixth_duration

print(f"Time: {now}")
print(f"Current sixth: {current_sixth + 1}")
print(f"Time: {now}")

# Odd sixths are 1, 3, 5 (0-indexed)
if current_sixth in [1, 3, 5]:
    raise Exception(f"Task failed: currently in odd sixth {current_sixth + 1}")
