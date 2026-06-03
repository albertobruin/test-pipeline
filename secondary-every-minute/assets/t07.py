""" @bruin

name: public.t07
type: python

depends:
  - public.t02
  - public.t03

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t07 ok for run {run_id}")
