CREATE TABLE dbo.BridgeLocationSchool
(
    LocationKey INT NOT NULL,
    SchoolKey INT NOT NULL,

    CONSTRAINT PK_BridgeLocationSchool
        PRIMARY KEY (LocationKey, SchoolKey)
);