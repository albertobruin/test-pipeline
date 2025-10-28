/* @bruin

name: test_data_set_us.test_table
type: bq.source
description: This is a test asset to check the bigquery integration
connection: gcp-default



custom_checks:
  - name: "whatever"
    value: 0
    query: |-
      SELECT DATE_DIFF(MAX(the_date), MIN(the_date), DAY) + 1 -  COUNT(DISTINCT the_date)  FROM `bruin-common-health-check.test_data_set_us.some_table` 


@bruin */


