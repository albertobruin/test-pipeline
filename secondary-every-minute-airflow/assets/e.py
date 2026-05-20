""" @bruin

name: asset_e
type: python

custom_checks:
  - name: check that always fails
    value: 0
    query: select 1

@bruin """

raise Exception("Asset E: intentional failure")
