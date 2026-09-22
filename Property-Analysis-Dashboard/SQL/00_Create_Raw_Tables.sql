

-- DROP TABLE IF EXISTS dbo.load_School;
DROP TABLE IF EXISTS dbo.load_Property;
DROP TABLE IF EXISTS dbo.load_Location;


CREATE TABLE dbo.load_Property
(
    [State] NVARCHAR(255),
    [City/Town] NVARCHAR(255),
    [Suburb] NVARCHAR(255),
    [Postcode] VARCHAR(20),
    [District] NVARCHAR(255),
    [Location] NVARCHAR(255),
    [Property_Median_Value] VARCHAR(50),
    [Category] VARCHAR(50),
    [Updated_Year] VARCHAR(50),
    [Updated_Month] VARCHAR(50)
);
CREATE TABLE dbo.load_Location
(
    postcode VARCHAR(20),
    suburb NVARCHAR(255),
    city NVARCHAR(255),
    state NVARCHAR(255),
    state_code NVARCHAR(255),
    lat VARCHAR(50),
    lon VARCHAR(50),
    Distric NVARCHAR(255)
);



SELECT COUNT(*) FROM dbo.load_Property;
SELECT COUNT(*) FROM dbo.load_Location;



UPDATE dbo.load_Property
SET Category =
CASE
    WHEN TRY_CAST(REPLACE(REPLACE(Property_Median_Value,'$',''),',','') AS DECIMAL(18,2)) IS NULL
        THEN 'Unknown'
    WHEN TRY_CAST(REPLACE(REPLACE(Property_Median_Value,'$',''),',','') AS DECIMAL(18,2)) < 750000
        THEN '0-750K'
    WHEN TRY_CAST(REPLACE(REPLACE(Property_Median_Value,'$',''),',','') AS DECIMAL(18,2)) < 1500000
        THEN '750K-1.5M'
    WHEN TRY_CAST(REPLACE(REPLACE(Property_Median_Value,'$',''),',','') AS DECIMAL(18,2)) < 2500000
        THEN '1.5M-2.5M'
    ELSE '2.5M+'
END;