/*=========================================================
  LOAD_LOCATION - DATA PROFILING & DATA QUALITY CHECKS
=========================================================*/

-----------------------------------------------------------
-- 1. View Sample Data
-----------------------------------------------------------
SELECT TOP 5 *
FROM dbo.load_Location;


-----------------------------------------------------------
-- 2. Check Table Structure
-----------------------------------------------------------
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'load_Location'
ORDER BY ORDINAL_POSITION;


-----------------------------------------------------------
-- 3. Total Number of Rows
-----------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM dbo.load_Location;


-----------------------------------------------------------
-- 4. Count Unique Location Combinations
-- (Postcode + Suburb + State)
-----------------------------------------------------------
SELECT COUNT(*) AS UniqueLocations
FROM
(
    SELECT DISTINCT
        postcode,
        suburb,
        state_code
    FROM dbo.load_Location
) x;
-- Expected: 16,078


-----------------------------------------------------------
-- 5. Check Exact Duplicate Rows
-- (All Columns Identical)
-----------------------------------------------------------
SELECT
    postcode,
    suburb,
    city,
    state,
    state_code,
    lat,
    lon,
    Distric,
    COUNT(*) AS DuplicateCount
FROM dbo.load_Location
GROUP BY
    postcode,
    suburb,
    city,
    state,
    state_code,
    lat,
    lon,
    Distric
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;


-----------------------------------------------------------
-- 6. Check Duplicate Location Records
-- (Same Postcode + Suburb + State)
-----------------------------------------------------------
SELECT
    postcode,
    suburb,
    state_code,
    COUNT(*) AS DuplicateCount
FROM dbo.load_Location
GROUP BY
    postcode,
    suburb,
    state_code
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;


-----------------------------------------------------------
-- 7. Top 10 Most Repeated Locations
-----------------------------------------------------------
SELECT TOP 10
    postcode,
    suburb,
    state_code,
    COUNT(*) AS DuplicateCount
FROM dbo.load_Location
GROUP BY
    postcode,
    suburb,
    state_code
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;


-----------------------------------------------------------
-- 8. Check Missing Values
-----------------------------------------------------------
SELECT
    SUM(CASE WHEN postcode IS NULL THEN 1 ELSE 0 END) AS MissingPostcode,
    SUM(CASE WHEN suburb IS NULL THEN 1 ELSE 0 END) AS MissingSuburb,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS MissingCity,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS MissingState,
    SUM(CASE WHEN state_code IS NULL THEN 1 ELSE 0 END) AS MissingStateCode,
    SUM(CASE WHEN lat IS NULL THEN 1 ELSE 0 END) AS MissingLatitude,
    SUM(CASE WHEN lon IS NULL THEN 1 ELSE 0 END) AS MissingLongitude,
    SUM(CASE WHEN Distric IS NULL THEN 1 ELSE 0 END) AS MissingDistrict
FROM dbo.load_Location;


-----------------------------------------------------------
-- 9. Count Records by State
-----------------------------------------------------------
SELECT
    state_code,
    COUNT(*) AS TotalRows
FROM dbo.load_Location
GROUP BY state_code
ORDER BY TotalRows DESC;


-----------------------------------------------------------
-- 10. Count Distinct Values
-----------------------------------------------------------
SELECT
    COUNT(DISTINCT postcode) AS UniquePostcodes,
    COUNT(DISTINCT suburb) AS UniqueSuburbs,
    COUNT(DISTINCT city) AS UniqueCities,
    COUNT(DISTINCT state_code) AS UniqueStates
FROM dbo.load_Location;


-----------------------------------------------------------
-- 11. Check Invalid Coordinates
-----------------------------------------------------------
SELECT *
FROM dbo.load_Location
WHERE lat NOT BETWEEN -90 AND 90
   OR lon NOT BETWEEN -180 AND 180;


-----------------------------------------------------------
-- 13. Summary Statistics for Documentation
-----------------------------------------------------------
SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT postcode) AS UniquePostcodes,
    COUNT(DISTINCT suburb) AS UniqueSuburbs,
    COUNT(DISTINCT city) AS UniqueCities,
    COUNT(DISTINCT state_code) AS UniqueStates
FROM dbo.load_Location;


SELECT COUNT(*) AS DimLocationRows
FROM dbo.DimLocation;


SELECT
    Postcode,
    Suburb,
    StateCode,
    COUNT(*) AS DuplicateCount
FROM dbo.DimLocation
GROUP BY
    Postcode,
    Suburb,
    StateCode
HAVING COUNT(*) > 1;




