CREATE TABLE dbo.DimSchool
(
    SchoolKey INT IDENTITY(1,1) PRIMARY KEY,
    SchoolCode INT,
    SchoolName NVARCHAR(255),
    Street NVARCHAR(500),
    Suburb NVARCHAR(255),
    Postcode INT,
    StudentNumber INT,
    ICSEAValue INT,
    LevelOfSchooling NVARCHAR(100),
    SchoolGender NVARCHAR(50),
    Latitude FLOAT,
    Longitude FLOAT
);

ALTER TABLE dbo.DimSchool
ALTER COLUMN LevelOfSchooling NVARCHAR(500);



SELECT COUNT(*) AS DimSchoolRows
FROM dbo.DimSchool;


SELECT
    school_code,
    school_name,
    latitude,
    longitude
FROM dbo.load_School
WHERE TRY_CAST(latitude AS FLOAT) IS NULL
   OR TRY_CAST(longitude AS FLOAT) IS NULL;

   SELECT
    SUM(CASE WHEN TRY_CAST(latitude AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS BadLatitude,
    SUM(CASE WHEN TRY_CAST(longitude AS FLOAT) IS NULL THEN 1 ELSE 0 END) AS BadLongitude
FROM dbo.load_School;

