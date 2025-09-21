# SQL_RenewableGrid_Project 🌱
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
<img width="421" height="255" alt="image" src="https://github.com/user-attachments/assets/e9f16ad1-0a1f-491c-809e-dc9555f02e16" />


✅ KPI 2: Forecast Accuracy
<pre><code class="language-sql">
SELECT 
p.PlantName,
AVG(ABS(fd.Actual_MWh - fd.Forecast_MWh)) AS Avg_Forecast_Error
FROM Plants p
JOIN Forecast_Demand fd ON p.PlantID = fd.PlantID
GROUP BY p.PlantName;
</code></pre>
<img width="258" height="231" alt="image" src="https://github.com/user-attachments/assets/48f7d96d-3e28-4d0f-9c1f-426555310207" />

✅ KPI 3: Supply Efficiency
<pre><code class="language-sql">
SELECT 
    p.PlantName,
    SUM(gu.Energy_Supplied_MWh) AS Total_Supplied,
    SUM(ep.Energy_Generated_MWh) AS Total_Generated,
    (SUM(gu.Energy_Supplied_MWh) / SUM(ep.Energy_Generated_MWh)) * 100 AS SupplyEfficiency
FROM Plants p
JOIN Energy_Production ep ON p.PlantID = ep.PlantID
JOIN Grid_Usage gu ON p.PlantID = gu.PlantID
GROUP BY p.PlantName;
  </code></pre>
  <img width="442" height="248" alt="image" src="https://github.com/user-attachments/assets/c2bbba23-a33d-456d-a627-78869875a704" />

✅ KPI 4: Downtime Hours
<pre><code class="language-sql">
SELECT 
    p.PlantName,
    SUM(DATEDIFF(HOUR, dl.StartTime, dl.EndTime)) AS Total_Downtime_Hours
FROM Plants p
JOIN Downtime_Log dl ON p.PlantID = dl.PlantID
GROUP BY p.PlantName;
  </code></pre>
  <img width="283" height="451" alt="image" src="https://github.com/user-attachments/assets/69190daf-42a2-4b2c-87ca-d92f9922f680" />

----------------------------------------------------------------------------------------------------

🚀 Overall Takeaway

💡Hydro & wind: High performance, reliable, efficient.

💡Solar: Variable but can reach high efficiency under good conditions.

💡Tracking utilization, forecast, supply, and downtime gives a full picture of grid health.

💡Provides a foundation for predictive maintenance, dashboards, and smarter grid management.
