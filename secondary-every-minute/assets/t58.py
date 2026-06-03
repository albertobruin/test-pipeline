""" @bruin

name: public.t58
type: python

depends:
  - public.t48
  - public.t51
  - public.t54

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t58 ok for run {run_id}")
