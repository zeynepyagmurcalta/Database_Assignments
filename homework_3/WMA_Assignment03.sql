USE WMA;
GO


IF OBJECT_ID('dbo.Orchestra','U') IS NULL
BEGIN
    CREATE TABLE Orchestra (
        OrchestraID INT IDENTITY(1,1) PRIMARY KEY,
        OrchestraName NVARCHAR(200) NOT NULL,
        City NVARCHAR(100),
        Country NVARCHAR(100),
        MusicDirector NVARCHAR(200)
    );
END
GO

IF OBJECT_ID('dbo.Composer','U') IS NULL
BEGIN
    CREATE TABLE Composer (
        ComposerID INT IDENTITY(1,1) PRIMARY KEY,
        ComposerName NVARCHAR(200) NOT NULL,
        Country NVARCHAR(100),
        DateOfBirth DATE
    );
END
GO

IF OBJECT_ID('dbo.Composition','U') IS NULL
BEGIN
    CREATE TABLE Composition (
        CompositionID INT IDENTITY(1,1) PRIMARY KEY,
        CompositionName NVARCHAR(200) NOT NULL,
        ComposerID INT NOT NULL,
        YearCreated INT,
        CONSTRAINT FK_Composition_Composer FOREIGN KEY (ComposerID) REFERENCES Composer(ComposerID)
    );
END
GO

IF OBJECT_ID('dbo.Musician','U') IS NULL
BEGIN
    CREATE TABLE Musician (
        MusicianNumber INT IDENTITY(1,1) PRIMARY KEY,
        MusicianName NVARCHAR(200) NOT NULL,
        Instrument NVARCHAR(100),
        AnnualSalary DECIMAL(12,2),
        OrchestraID INT NOT NULL,
        CONSTRAINT FK_Musician_Orchestra FOREIGN KEY (OrchestraID) REFERENCES Orchestra(OrchestraID)
    );
END
GO

IF OBJECT_ID('dbo.Degree','U') IS NULL
BEGIN
    CREATE TABLE Degree (
        DegreeID INT IDENTITY(1,1) PRIMARY KEY,
        MusicianNumber INT NOT NULL,
        DegreeName NVARCHAR(200),
        University NVARCHAR(300),
        DegreeYear INT,
        CONSTRAINT FK_Degree_Musician FOREIGN KEY (MusicianNumber) REFERENCES Musician(MusicianNumber)
    );
END
GO

IF OBJECT_ID('dbo.Recording','U') IS NULL
BEGIN
    CREATE TABLE Recording (
        RecordingID INT IDENTITY(1,1) PRIMARY KEY,
        OrchestraID INT NOT NULL,
        CompositionID INT NOT NULL,
        RecordingYear INT,
        Price DECIMAL(12,2),
        CONSTRAINT FK_Recording_Orchestra FOREIGN KEY (OrchestraID) REFERENCES Orchestra(OrchestraID),
        CONSTRAINT FK_Recording_Composition FOREIGN KEY (CompositionID) REFERENCES Composition(CompositionID)
    );


END
IF NOT EXISTS (SELECT 1 FROM Orchestra WHERE OrchestraName = 'Istanbul Philharmonic')
BEGIN
  INSERT INTO Orchestra (OrchestraName, City, Country, MusicDirector)
  VALUES ('Istanbul Philharmonic', 'Istanbul', 'Turkey', 'Ahmet Yilmaz');
END
GO


SELECT * FROM Orchestra;
GO