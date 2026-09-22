
-- DROP VIEW IF EXISTS dbo.vw_PropertyAnalysis;

CREATE VIEW dbo.vw_PropertyAnalysis
AS
SELECT
    fp.PropertyFactKey,
    dl.State,
    dl.City,
    dl.Suburb,
    dl.Postcode,
    dl.Latitude,
    dl.Longitude,
    dc.CategoryName,
    fp.PropertyMedianValue,
    fp.UpdatedYear,
    fp.UpdatedMonth
FROM dbo.FactProperty fp
JOIN dbo.DimLocation dl
    ON fp.LocationKey = dl.LocationKey
JOIN dbo.DimCategory dc
    ON fp.CategoryKey = dc.CategoryKey;




--    1. Check total rows
SELECT COUNT(*) AS TotalRows
FROM dbo.vw_PropertyAnalysis;

-- Expected: 3914



-- 2. Check sample data
SELECT TOP 20 *
FROM dbo.vw_PropertyAnalysis;


-- 3. Check states
SELECT DISTINCT State
FROM dbo.vw_PropertyAnalysis
ORDER BY State;


-- 4. Check categories
SELECT DISTINCT CategoryName
FROM dbo.vw_PropertyAnalysis
ORDER BY CategoryName;


-- 5. Check nulls
SELECT *
FROM dbo.vw_PropertyAnalysis
WHERE Latitude IS NULL
   OR Longitude IS NULL;


-- 6. Check duplicates
SELECT
    PropertyFactKey,
    COUNT(*) AS Cnt
FROM dbo.vw_PropertyAnalysis
GROUP BY PropertyFactKey
HAVING COUNT(*) > 1;


-- 7. Check value range
SELECT
    MIN(PropertyMedianValue) AS MinValue,
    MAX(PropertyMedianValue) AS MaxValue,
    AVG(PropertyMedianValue) AS AvgValue
FROM dbo.vw_PropertyAnalysis;