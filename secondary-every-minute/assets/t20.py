""" @bruin

name: public.t20
type: python

depends:
  - public.t10
  - public.t13

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t20 ok for run {run_id}")
