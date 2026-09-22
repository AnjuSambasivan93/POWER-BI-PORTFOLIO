-- 1. Drop old Dim/Fact tables
DROP TABLE IF EXISTS dbo.FactProperty;
--DROP TABLE IF EXISTS dbo.BridgeLocationSchool;
DROP TABLE IF EXISTS dbo.DimCategory;

-- 2. Create Dimension tables
CREATE TABLE dbo.DimLocation
(
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    Postcode VARCHAR(20),
    Suburb NVARCHAR(255),
    City NVARCHAR(255),
    State NVARCHAR(255),
    StateCode NVARCHAR(255),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    District NVARCHAR(255)
);


CREATE TABLE dbo.DimCategory
(
    CategoryKey INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- 3. Create Fact table
CREATE TABLE dbo.FactProperty
(
    PropertyFactKey INT IDENTITY(1,1) PRIMARY KEY,
    LocationKey INT,
    CategoryKey INT,
    PropertyMedianValue DECIMAL(18,2),
    UpdatedYear INT,
    UpdatedMonth INT,

    FOREIGN KEY (LocationKey) REFERENCES dbo.DimLocation(LocationKey),
    FOREIGN KEY (CategoryKey) REFERENCES dbo.DimCategory(CategoryKey)
);

-- 5. Insert categories
INSERT INTO dbo.DimCategory (CategoryName)
VALUES
('0-750K'),
('750K-1.5M'),
('1.5M-2.5M'),
('2.5M+');




SELECT 'load_Property' AS TableName, COUNT(*) AS TotalRows FROM dbo.load_Property
UNION ALL
SELECT 'load_Location', COUNT(*) FROM dbo.load_Location
UNION ALL
SELECT 'DimLocation', COUNT(*) FROM dbo.DimLocation
UNION ALL
SELECT 'DimCategory', COUNT(*) FROM dbo.DimCategory
UNION ALL
SELECT 'FactProperty', COUNT(*) FROM dbo.FactProperty


SELECT P.*
FROM dbo.load_Property P
LEFT JOIN dbo.DimLocation L
    ON P.Postcode = L.Postcode
   AND P.Suburb = L.Suburb
WHERE L.LocationKey IS NULL;

SELECT DISTINCT
    L.State
FROM dbo.FactProperty F
INNER JOIN dbo.DimLocation L
    ON F.LocationKey = L.LocationKey
ORDER BY L.State;