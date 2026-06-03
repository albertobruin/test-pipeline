""" @bruin

name: public.t03
type: python

@bruin """

import os

run_id = os.environ.get("BRUIN_END_DATETIME", "unknown")
print(f"asset t03 ok for run {run_id}")
