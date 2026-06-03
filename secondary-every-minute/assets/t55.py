""" @bruin

name: public.t55
type: python

depends:
  - public.t40
  - public.t45

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t55 ok for run {run_id}")
