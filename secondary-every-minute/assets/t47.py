""" @bruin

name: public.t47
type: python

depends:
  - public.t32
  - public.t37

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t47 ok for run {run_id}")
