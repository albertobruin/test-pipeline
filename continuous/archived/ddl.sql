/* @bruin
name: source_external.wep_farms_historic
type: bq.sql
description: Historical (dumps) wind farms' observations data
owner: data-engineering
tags:
  - energy
  - wep

materialization:
  type: table 
  strategy: ddl

columns:
  - name: inserted_at
    description: The date and time that the row was last updated or inserted
    type: TIMESTAMP
  - name: energy_company
    description: Name of the energy company
    type: STRING
  - name: wind_farm
    description: Name of the wind farm
    type: STRING
  - name: measured_at
    description: Timestamp (1-hour interval) of the measurement in UTC
    type: TIMESTAMP
  - name: measured_at_day
    description: Date of the measurement in UTC
    type: TIMESTAMP
  - name: power_output
    description: Power output of the farm in MWh
    type: FLOAT64
  - name: wind_speed
    description: Wind speed at the turbine (m/s)
    type: FLOAT64
  - name: wind_direction
    description: Wind direction at the turbine (degrees, 0-360)
    type: FLOAT64
  - name: temperature
    description: Temperature at the turbine (°C)
    type: FLOAT64
  - name: availability_status
    description: Availability status of the turbine (between 0 and 1)
    type: FLOAT64
  - name: expected_power
    description: Combined expected power of the all turbines in MWh
    type: FLOAT64
@bruin */