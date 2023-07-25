CREATE TABLE UserTable(
    UserID INT PRIMARY KEY,
    UserName VARCHAR NOT NULL,
    UserPassword VARCHAR NOT NULL,
    DateofBirth VARCHAR NOT NULL,
)

CREATE TABLE ArtistsTable(
    ArtistID VARCHAR PRIMARY KEY,
    ArtistName VARCHAR NOT NULL,
    Genre VARCHAR NOT NULL,
)

CREATE TABLE AlbumTable(
    AlbumID VARCHAR PRIMARY KEY,
    AlbumName VARCHAR NOT NULL,
    ReleaseDate VARCHAR NOT NULL,
    ArtistID VARCHAR FOREIGN KEY REFERENCES ArtistsTable (ArtistID)
)

CREATE TABLE TrackTable(
    TrackID VARCHAR PRIMARY KEY,
    TrackName VARCHAR NOT NULL,
    Duration VARCHAR NOT NULL,
    FilePath VARCHAR, 
    AlbumID VARCHAR FOREIGN KEY REFERENCES AlbumTable (AlbumID)
)

CREATE TABLE PlaylistTable(
    PlaylistID VARCHAR PRIMARY KEY,
    PlaylistName VARCHAR NOT NULL,
    UserID INT FOREIGN KEY REFERENCES UserTable (UserID)
)

CREATE TABLE PlaylistTracksTable(
    PlaylistID VARCHAR FOREIGN KEY REFERENCES PlaylistTable (PlaylistID),
    TrackID VARCHAR FOREIGN KEY REFERENCES TrackTable (TrackID)
)

CREATE TABLE FollowersTable(
    UserID INT FOREIGN KEY REFERENCES UserTable (UserID),
    ArtistID VARCHAR FOREIGN KEY REFERENCES ArtistsTable (ArtistID)
)

CREATE TABLE LikesTable(
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    UserID INT FOREIGN KEY REFERENCES UserTable (UserID),
    TrackID VARCHAR FOREIGN KEY REFERENCES TrackTable (TrackID)
)