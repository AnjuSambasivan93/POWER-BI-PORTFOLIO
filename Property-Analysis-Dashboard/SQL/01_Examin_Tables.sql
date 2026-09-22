SELECT 
	TABLE_NAME,
	COLUMN_NAME,
	DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS

WHERE TABLE_NAME IN
(
	'load_Property',
	'load_Location',
	'load_School'
)

ORDER BY TABLE_NAME, ORDINAL_POSITION;


SELECT TOP 10 * FROM load_Property;

SELECT TOP 10 * FROM load_Location;

SELECT TOP 10 * FROM load_School




SELECT TOP 20
    p.Postcode,
    p.Suburb,
    s.postcode,
    s.town_suburb
FROM load_Property p
JOIN load_School s
    ON CAST(p.Postcode AS VARCHAR(10)) = s.postcode
   AND p.Suburb = s.town_suburb;