-- 1. Check columns and sample data
SELECT TOP 5 *
FROM dbo.load_Property;

-- 2. Total rows
SELECT COUNT(*) AS TotalRows
FROM dbo.load_Property;

-- 3. Missing values
SELECT
    SUM(CASE WHEN Postcode IS NULL THEN 1 ELSE 0 END) AS MissingPostcode,
    SUM(CASE WHEN Suburb IS NULL THEN 1 ELSE 0 END) AS MissingSuburb,
    SUM(CASE WHEN Property_Median_Value IS NULL THEN 1 ELSE 0 END) AS MissingPropertyValue,
    SUM(CASE WHEN Updated_Year IS NULL THEN 1 ELSE 0 END) AS MissingYear,
    SUM(CASE WHEN Updated_Month IS NULL THEN 1 ELSE 0 END) AS MissingMonth
FROM dbo.load_Property;

-- 4. Unique counts
SELECT
    COUNT(DISTINCT Postcode) AS UniquePostcodes,
    COUNT(DISTINCT Suburb) AS UniqueSuburbs,
    COUNT(DISTINCT Updated_Year) AS UniqueYears,
    COUNT(DISTINCT Updated_Month) AS UniqueMonths
FROM dbo.load_Property;

-- 5. Property value range
SELECT
    MIN(Property_Median_Value) AS MinValue,
    MAX(Property_Median_Value) AS MaxValue,
    AVG(Property_Median_Value) AS AvgValue
FROM dbo.load_Property
WHERE Property_Median_Value IS NOT NULL;

-- 6. Check duplicate rows
SELECT
    Postcode,
    Suburb,
    Property_Median_Value,
    Updated_Year,
    Updated_Month,
    COUNT(*) AS DuplicateCount
FROM dbo.load_Property
GROUP BY
    Postcode,
    Suburb,
    Property_Median_Value,
    Updated_Year,
    Updated_Month
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;