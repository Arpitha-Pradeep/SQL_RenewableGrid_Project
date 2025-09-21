---KPI 1: Plant Utilization Rate

SELECT 
    p.PlantName,
    AVG(ep.Energy_Generated_MWh) AS Avg_Generation,
    p.Capacity_MW,
    (AVG(ep.Energy_Generated_MWh) / p.Capacity_MW) * 100 AS UtilizationRate
FROM Plants p
JOIN Energy_Production ep ON p.PlantID = ep.PlantID
GROUP BY p.PlantName, p.Capacity_MW;

---KPI 2: Forecast Accuracy
SELECT 
    p.PlantName,
    AVG(ABS(fd.Actual_MWh - fd.Forecast_MWh)) AS Avg_Forecast_Error
FROM Plants p
JOIN Forecast_Demand fd ON p.PlantID = fd.PlantID
GROUP BY p.PlantName;

---KPI 3: Supply Efficiency
SELECT 
    p.PlantName,
    SUM(gu.Energy_Supplied_MWh) AS Total_Supplied,
    SUM(ep.Energy_Generated_MWh) AS Total_Generated,
    (SUM(gu.Energy_Supplied_MWh) / SUM(ep.Energy_Generated_MWh)) * 100 AS SupplyEfficiency
FROM Plants p
JOIN Energy_Production ep ON p.PlantID = ep.PlantID
JOIN Grid_Usage gu ON p.PlantID = gu.PlantID
GROUP BY p.PlantName;

---KPI 4: Downtime Hours
SELECT 
    p.PlantName,
    SUM(DATEDIFF(HOUR, dl.StartTime, dl.EndTime)) AS Total_Downtime_Hours
FROM Plants p
JOIN Downtime_Log dl ON p.PlantID = dl.PlantID
GROUP BY p.PlantName;
