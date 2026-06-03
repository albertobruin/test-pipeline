""" @bruin

name: public.t44
type: python

depends:
  - public.t18
  - public.t29

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t44 ok for run {run_id}")
