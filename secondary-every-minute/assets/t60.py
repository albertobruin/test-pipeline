""" @bruin

name: public.t60
type: python

depends:
  - public.t46
  - public.t50
  - public.t53

@bruin """

raise RuntimeError("asset t60 fails on purpose for rerun/mark-as testing")
