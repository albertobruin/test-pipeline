/* @bruin

name: test_data_set_us.users_summary
type: bq.sql
description: Kullanıcı özet tablosu - custom ve quality check örnekleri ile
connection: gcp-default

materialization:
  type: table

columns:
  - name: user_id
    type: STRING
    description: Kullanıcı benzersiz kimliği
    checks:
      - name: not_null
      - name: unique

  - name: total_orders
    type: INTEGER
    description: Toplam sipariş sayısı
    checks:
      - name: not_null
      - name: non_negative

  - name: status
    type: STRING
    description: Kullanıcı durumu
    checks:
      - name: not_null
      - name: accepted_values
        value:
          - "active"
          - "inactive"
          - "pending"

custom_checks:
  - name: "Tablo boş olmamalı"
    value: 1
    query: |
      SELECT SIGN(COUNT(*)) FROM test_data_set_us.users_summary

  - name: "Toplam sipariş negatif olmamalı"
    value: 0
    query: |
      SELECT COUNT(*) FROM test_data_set_us.users_summary WHERE total_orders < 0

  - name: "Aktif kullanıcı oranı %10'dan fazla olmalı"
    value: 1
    query: |
      SELECT CASE 
        WHEN (SELECT COUNT(*) FROM test_data_set_us.users_summary WHERE status = 'active') * 100.0 / 
             NULLIF((SELECT COUNT(*) FROM test_data_set_us.users_summary), 0) > 10 
        THEN 1 
        ELSE 0 
      END

@bruin */

SELECT 
  'user_001' as user_id,
  15 as total_orders,
  'active' as status

UNION ALL

SELECT 
  'user_002' as user_id,
  8 as total_orders,
  'inactive' as status

UNION ALL

SELECT 
  'user_003' as user_id,
  0 as total_orders,
  'pending' as status
