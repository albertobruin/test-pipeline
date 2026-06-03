""" @bruin

name: public.t51
type: python

depends:
  - public.t36
  - public.t41

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t51 ok for run {run_id}")
