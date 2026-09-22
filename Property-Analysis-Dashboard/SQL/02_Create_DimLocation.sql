CREATE TABLE dbo.DimLocation
(
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    Postcode INT,
    Suburb NVARCHAR(255),
    City NVARCHAR(255),
    State NVARCHAR(255),
    StateCode NVARCHAR(255),
    Latitude FLOAT,
    Longitude FLOAT
);

