""" @bruin

name: public.t28
type: python

depends:
  - public.t18
  - public.t22

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t28 ok for run {run_id}")
