-- 1. Total Rows
SELECT COUNT(*) AS TotalRows
FROM dbo.load_School;

-- 2. Check Columns / Sample Data
SELECT TOP 5 *
FROM dbo.load_School;

-- 3. Missing Values
SELECT
    SUM(CASE WHEN school_code IS NULL THEN 1 ELSE 0 END) AS MissingSchoolCode,
    SUM(CASE WHEN school_name IS NULL THEN 1 ELSE 0 END) AS MissingSchoolName,
    SUM(CASE WHEN town_suburb IS NULL THEN 1 ELSE 0 END) AS MissingSuburb,
    SUM(CASE WHEN postcode IS NULL THEN 1 ELSE 0 END) AS MissingPostcode,
    SUM(CASE WHEN student_number IS NULL THEN 1 ELSE 0 END) AS MissingStudentNumber,
    SUM(CASE WHEN latitude IS NULL THEN 1 ELSE 0 END) AS MissingLatitude,
    SUM(CASE WHEN longitude IS NULL THEN 1 ELSE 0 END) AS MissingLongitude
FROM dbo.load_School;

-- 4. Unique Schools
SELECT
    COUNT(DISTINCT school_code) AS UniqueSchoolCodes,
    COUNT(DISTINCT school_name) AS UniqueSchools,
    COUNT(DISTINCT town_suburb) AS UniqueSuburbs
FROM dbo.load_School;

-- 5. School Gender Distribution
SELECT
    school_gender,
    COUNT(*) AS TotalSchools
FROM dbo.load_School
GROUP BY school_gender
ORDER BY TotalSchools DESC;

-- 6. Level of Schooling Distribution
SELECT
    level_of_schooling,
    COUNT(*) AS TotalSchools
FROM dbo.load_School
GROUP BY level_of_schooling
ORDER BY TotalSchools DESC;


-- 7. Duplicate Schools
SELECT
    school_code,
    school_name,
    COUNT(*) AS DuplicateCount
FROM dbo.load_School
GROUP BY
    school_code,
    school_name
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;

-- 8. Duplicate rows

SELECT
    school_code,
    school_name,
    town_suburb,
    postcode,
    COUNT(*) AS DuplicateCount
FROM dbo.load_School
GROUP BY
    school_code,
    school_name,
    town_suburb,
    postcode
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;


SELECT
    school_code,
    school_name,
    street,
    town_suburb,
    postcode,
    student_number,
    latitude,
    longitude,
    COUNT(*) AS DuplicateCount
FROM dbo.load_School
GROUP BY
    school_code,
    school_name,
    street,
    town_suburb,
    postcode,
    student_number,
    latitude,
    longitude
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;


SELECT COUNT(*) AS TotalRows
FROM dbo.load_School;


SELECT COUNT(*) AS UniqueSchools
FROM
(
    SELECT DISTINCT
        school_code,
        school_name,
        street,
        town_suburb,
        postcode,
        student_number,
        latitude,
        longitude
    FROM dbo.load_School
) x;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'load_School'
ORDER BY ORDINAL_POSITION;