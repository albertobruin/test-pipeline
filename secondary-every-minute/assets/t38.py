""" @bruin

name: public.t38
type: python

depends:
  - public.t23
  - public.t27

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t38 ok for run {run_id}")
