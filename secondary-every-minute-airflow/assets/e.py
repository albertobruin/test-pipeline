""" @bruin

name: asset_e
type: python

custom_checks:
  - name: check that always fails
    value: 0
    query: select 1

@bruin """

print("Asset E: completed successfully")
