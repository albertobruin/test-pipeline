""" @bruin

name: public.t23
type: python

depends:
  - public.t06
  - public.t13

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t23 ok for run {run_id}")
