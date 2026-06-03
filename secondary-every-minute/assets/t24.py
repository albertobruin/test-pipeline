""" @bruin

name: public.t24
type: python

depends:
  - public.t07
  - public.t14

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t24 ok for run {run_id}")
