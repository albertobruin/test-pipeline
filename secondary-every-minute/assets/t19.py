""" @bruin

name: public.t19
type: python

depends:
  - public.t09
  - public.t12

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t19 ok for run {run_id}")
