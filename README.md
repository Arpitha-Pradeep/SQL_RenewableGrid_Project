# SQL_RenewableGrid_Project
Energy providers need to monitor renewable energy sources (solar, wind, hydro) in real time to understand production, efficiency, downtime, and grid load. This project will simulate how to manage this data with SQL Server and provide insights into performance and reliability.
**Core idea:**
Build a SQL-based data system that tracks renewable energy generation, grid usage, downtime logs, and forecast demand.
**Database Schema**
1 Plants: List of renewable energy plants.
plant_id, plant_name, location, type (solar/wind/hydro), capacity_mw
2 Energy_Production: Hourly/daily energy generated.
production_id, plant_id, date_time, energy_generated_mwh
3.Grid_Usage: How much energy was supplied to the grid.
usage_id, plant_id, date_time, energy_supplied_mwh
4. Downtime_Log: Maintenance or failure records.
downtime_id, plant_id, start_time, end_time, reason
5 Forecast_Demand: Projected demand vs actual.
forecast_id, plant_id, date_time, forecast_mwh, actual_mwh
