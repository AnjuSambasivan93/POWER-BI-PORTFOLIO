CREATE TABLE DimCategory
(
    CategoryKey INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50)
);


INSERT INTO dbo.DimCategory (CategoryName)
VALUES
('0-750K'),
('750K-1.5M'),
('1.5M-2.5M'),
('2.5M+');