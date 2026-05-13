""" @bruin

name: asset_e
type: python

custom_checks:
  - name: non blocking check that always fails
    value: 0
    query: select 1
    blocking: false

@bruin """

print("Asset E: completed successfully")
