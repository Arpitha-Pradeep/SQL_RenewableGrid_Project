-- 1_create_db.sql
CREATE DATABASE RenewableGrid;
GO
USE RenewableGrid;
GO

-- 2_schema.sql
USE RenewableGrid;
GO

CREATE TABLE Plants (
    PlantID INT IDENTITY(1,1) PRIMARY KEY,
    PlantName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100),
    Type NVARCHAR(20) NOT NULL, -- 'Solar','Wind','Hydro'
    Capacity_MW DECIMAL(10,3) NOT NULL,
    CreatedAt DATETIME2 DEFAULT SYSUTCDATETIME()
);

CREATE TABLE Energy_Production (
    ProductionID INT IDENTITY(1,1) PRIMARY KEY,
    PlantID INT NOT NULL REFERENCES Plants(PlantID),
    DateTime DATETIME2 NOT NULL,  -- hourly timestamp
    Energy_Generated_MWh DECIMAL(12,4) NOT NULL,
    CreatedAt DATETIME2 DEFAULT SYSUTCDATETIME(),
    CONSTRAINT UQ_Energy_Production_Plant_Date UNIQUE (PlantID, DateTime)
);

CREATE TABLE Grid_Usage (
    UsageID INT IDENTITY(1,1) PRIMARY KEY,
    PlantID INT NOT NULL REFERENCES Plants(PlantID),
    DateTime DATETIME2 NOT NULL,
    Energy_Supplied_MWh DECIMAL(12,4) NOT NULL,
    CreatedAt DATETIME2 DEFAULT SYSUTCDATETIME(),
    CONSTRAINT UQ_Grid_Usage_Plant_Date UNIQUE (PlantID, DateTime)
);

CREATE TABLE Downtime_Log (
    DowntimeID INT IDENTITY(1,1) PRIMARY KEY,
    PlantID INT NOT NULL REFERENCES Plants(PlantID),
    StartTime DATETIME2 NOT NULL,
    EndTime DATETIME2 NULL,
    Reason NVARCHAR(200),
    CreatedAt DATETIME2 DEFAULT SYSUTCDATETIME()
);

CREATE TABLE Forecast_Demand (
    ForecastID INT IDENTITY(1,1) PRIMARY KEY,
    PlantID INT NOT NULL REFERENCES Plants(PlantID),
    DateTime DATETIME2 NOT NULL,
    Forecast_MWh DECIMAL(12,4) NULL,
    Actual_MWh DECIMAL(12,4) NULL,
    CreatedAt DATETIME2 DEFAULT SYSUTCDATETIME(),
    CONSTRAINT UQ_Forecast_Plant_Date UNIQUE (PlantID, DateTime)
);
GO
