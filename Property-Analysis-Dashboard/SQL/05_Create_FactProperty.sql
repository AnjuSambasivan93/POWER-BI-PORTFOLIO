CREATE TABLE dbo.FactProperty
(
    PropertyFactKey INT IDENTITY(1,1) PRIMARY KEY,

    -- Foreign Keys
    LocationKey INT NOT NULL,
    CategoryKey INT NOT NULL,

    -- Measures
    PropertyMedianValue MONEY NOT NULL,

    -- Time Attributes
    UpdatedYear INT,
    UpdatedMonth INT,

    -- Relationships
    CONSTRAINT FK_FactProperty_Location
        FOREIGN KEY (LocationKey)
        REFERENCES DimLocation(LocationKey),

    CONSTRAINT FK_FactProperty_Category
        FOREIGN KEY (CategoryKey)
        REFERENCES DimCategory(CategoryKey)
);





SELECT
    LocationKey,
    CategoryKey,
    PropertyMedianValue,
    UpdatedYear,
    UpdatedMonth,
    COUNT(*) AS DuplicateCount
FROM dbo.FactProperty
GROUP BY
    LocationKey,
    CategoryKey,
    PropertyMedianValue,
    UpdatedYear,
    UpdatedMonth
HAVING COUNT(*) > 1;


SELECT COUNT(*) AS FactRows
FROM dbo.FactProperty;

SELECT COUNT(*) AS UniqueRows
FROM
(
    SELECT DISTINCT
        LocationKey,
        CategoryKey,
        PropertyMedianValue,
        UpdatedYear,
        UpdatedMonth
    FROM dbo.FactProperty
) x;