CREATE DATABASE Spotify_dwh;

CREATE TABLE `dim_song`(
	`Song_SID` int(11) AUTO_INCREMENT NOT NULL,
	`SongID` int(11) NOT NULL,
	`SongName` varchar(255) NOT NULL,
    `SongReleaseDate` date NOT NULL,
    `ArtistName` varchar(255) NOT NULL,
    `RecordingName` varchar(255) NOT NULL,
    `Genre` varchar(255) NOT NULL,
    `AlbumName` varchar(255) NOT NULL,
    `Label` varchar(255) NOT NULL,
    PRIMARY KEY (`Song_SID`)
);

CREATE TABLE `dim_user`(
	`User_SID` int(11) AUTO_INCREMENT NOT NULL,
    `UserTypeID` int(11) NOT NULL,
	`UserID` int(11) NOT NULL,
	`Username` varchar(255) NOT NULL,
    `Country` varchar(255) NOT NULL,
    `StartDate` date NOT NULL,
    `EndDate` date NOT NULL,
    PRIMARY KEY (`User_SID`)
);

CREATE TABLE `dim_time_2` (
	`date_key` varchar(255) NOT NULL,
	`Date` date NOT NULL,
    `Day` int(11) NOT NULL,
    `Week` int(11) NOT NULL,
    `Month` int(11) NOT NULL,
    `Quarter` int(11) NOT NULL,
    `Year` int(11) NOT NULL,
	PRIMARY KEY (`date_key`)
);

CREATE TABLE `dim_subscriptionType`(
	`SubscriptionType_SID` int(11) AUTO_INCREMENT NOT NULL,
	`SubscriptionTypeID` int(11) NOT NULL,
	`SubscriptionTypeName` varchar(255) NOT NULL,
    `SubscriptionTypeDesc` varchar(255) NOT NULL,
    PRIMARY KEY (`SubscriptionType_SID`)
);

CREATE TABLE `dim_access` (
	`AccessID` varchar(255) NOT NULL,
	`Date` date NOT NULL,
    `Day` int(11) NOT NULL,
    `Week` int(11) NOT NULL,
    `Month` int(11) NOT NULL,
    `Quarter` int(11) NOT NULL,
    `Year` int(11) NOT NULL,
    PRIMARY KEY (`AccessID`)
);

CREATE TABLE `fact_subscriptionOrder`(
	`User_SID` int(11) NOT NULL,
    `date_key`  varchar(255) NOT NULL,
	`SubscriptionType_SID` int(11) NOT NULL,
    `Price` int(11) NOT NULL,
	KEY `User_SID` (`User_SID`),
	KEY `date_key` (`date_key`),
    KEY `SubscriptionType_SID` (`SubscriptionType_SID`),
    FOREIGN KEY (User_SID) REFERENCES dim_user(User_SID),
    FOREIGN KEY (date_key) REFERENCES dim_time_2(date_key),
    FOREIGN KEY (SubscriptionType_SID) REFERENCES dim_subscriptiontype(SubscriptionType_SID)
);

CREATE TABLE `fact_playedsong`(
	`AccessID` varchar(255) NOT NULL,
	`User_SID` int(11) NOT NULL,
	`Song_SID` int(11) NOT NULL,
	`songDuration` int(11) NOT NULL,
    KEY `AccessID` (`AccessID`),
    KEY `User_SID` (`User_SID`),
	KEY `Song_SID` (`Song_SID`),
    FOREIGN KEY (AccessID) REFERENCES dim_access(AccessID),
    FOREIGN KEY (User_SID) REFERENCES dim_user(User_SID),
    FOREIGN KEY (Song_SID) REFERENCES dim_song(Song_SID)
);

Use spotify_dwh











