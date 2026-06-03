""" @bruin

name: public.t60
type: python

depends:
  - public.t46
  - public.t50
  - public.t53

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t60 ok for run {run_id}")
