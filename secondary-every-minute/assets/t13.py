""" @bruin

name: public.t13
type: python

depends:
  - public.t03

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t13 ok for run {run_id}")
