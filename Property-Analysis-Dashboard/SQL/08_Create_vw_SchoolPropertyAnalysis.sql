CREATE VIEW dbo.vw_SchoolPropertyAnalysis
AS
SELECT
    dl.State,
    dl.City,
    dl.Suburb,
    ds.SchoolName,
    ds.LevelOfSchooling,
    ds.StudentNumber,
    fp.PropertyMedianValue
FROM dbo.FactProperty fp
JOIN dbo.DimLocation dl
    ON fp.LocationKey = dl.LocationKey
JOIN dbo.BridgeLocationSchool bls
    ON dl.LocationKey = bls.LocationKey
JOIN dbo.DimSchool ds
    ON bls.SchoolKey = ds.SchoolKey;