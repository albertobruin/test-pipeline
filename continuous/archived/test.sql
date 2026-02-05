/* @bruin

name: notion.some_table
type: bq.source
description: This is a test asset to check the bigquery integration
connection: alberto-test-playground



custom_checks:
  - name: "whatever"
    value: 0
    query: |-
      SELECT DATE_DIFF(MAX(the_date), MIN(the_date), DAY) + 1 -  COUNT(DISTINCT the_date)  FROM `bruin-alberto-playground.notion.some_table` 


@bruin */


