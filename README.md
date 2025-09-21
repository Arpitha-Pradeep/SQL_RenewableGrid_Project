# SQL_RenewableGrid_Project
Energy providers need to monitor renewable energy sources (solar, wind, hydro) in real time to understand production, efficiency, downtime, and grid load. This project will simulate how to manage this data with SQL Server and provide insights into performance and reliability.

**Core idea:**
----------------------------------------------------------------------------------------------------------------------
Build a SQL-based data system that tracks renewable energy generation, grid usage, downtime logs, and forecast demand.

-----------------------------------------------------------------------------------------------------------------
**Database Schema**
<img width="1418" height="770" alt="Database Diagram" src="https://github.com/user-attachments/assets/95f2898a-47cb-45c3-96b2-16990e68c96e" />

✅ KPI 1: Plant Utilization Rate
<pre><code class="language-sql">
SELECT 
p.PlantName,
ROUND(AVG(ep.Energy_Generated_MWh) / p.Capacity_MW * 100, 2) AS UtilizationRate_Percent
FROM dbo.Plants p
JOIN dbo.Energy_Production ep ON p.PlantID = ep.PlantID
GROUP BY p.PlantName, p.Capacity_MW;
</code></pre>
✅ KPI 2: Forecast Accuracy
<pre><code class="language-sql">
SELECT 
p.PlantName,
AVG(ABS(fd.Actual_MWh - fd.Forecast_MWh)) AS Avg_Forecast_Error
FROM Plants p
JOIN Forecast_Demand fd ON p.PlantID = fd.PlantID
GROUP BY p.PlantName;
</code></pre>
✅ KPI 3: Supply Efficiency
<pre><code class="language-sql">
SELECT 
    p.PlantName,
    SUM(DATEDIFF(HOUR, dl.StartTime, dl.EndTime)) AS Total_Downtime_Hours
FROM Plants p
JOIN Downtime_Log dl ON p.PlantID = dl.PlantID
GROUP BY p.PlantName;
  </code></pre>
✅ KPI 4: Downtime Hours
<pre><code class="language-sql">
SELECT 
    p.PlantName,
    SUM(DATEDIFF(HOUR, dl.StartTime, dl.EndTime)) AS Total_Downtime_Hours
FROM Plants p
JOIN Downtime_Log dl ON p.PlantID = dl.PlantID
GROUP BY p.PlantName;
  </code></pre>
