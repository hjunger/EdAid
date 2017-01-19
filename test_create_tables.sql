CREATE DATABASE TEST

USE TEST
GO

-- drop table [User]
CREATE TABLE [User](
	UserId int not null identity,
	Email nvarchar(100) not null,
	Registered datetime not null
	CONSTRAINT pk_User_ID PRIMARY KEY (UserId),
)
GO

-- drop table Languages
CREATE TABLE Languages(
	LanguageId int not null identity,
	Name nvarchar(100) not null,
	CONSTRAINT pk_Language_ID PRIMARY KEY (LanguageId),
)
GO

-- drop table UserLanguage
CREATE TABLE UserLanguage(
	UserLanguageId int not null identity,
	LanguageId int not null,
	UserId int not null,
	Rating int not null,
	CONSTRAINT pk_UserLanguage_ID PRIMARY KEY (UserLanguageId),
	CONSTRAINT fk_Language_ID FOREIGN KEY (LanguageId) REFERENCES Languages (LanguageId),
	CONSTRAINT fk_User_ID FOREIGN KEY (UserId) REFERENCES [User] (UserId),
	CONSTRAINT ak_UniqueUserLanguage_ID UNIQUE (LanguageId,UserId)
)
GO


INSERT INTO Languages (Name) VALUES ('French')
INSERT INTO Languages (Name) VALUES ('English')
INSERT INTO Languages (Name) VALUES ('Portuguese')
INSERT INTO Languages (Name) VALUES ('Spanish')

INSERT INTO [User] (Email,Registered) VALUES ('test1@hotmail.com', GETDATE())
INSERT INTO [User] (Email,Registered) VALUES ('test2@hotmail.com', '2017-01-08')
INSERT INTO [User] (Email,Registered) VALUES ('test3@hotmail.com', '2017-01-01')
INSERT INTO [User] (Email,Registered) VALUES ('test4@hotmail.com', '2017-01-05')
INSERT INTO [User] (Email,Registered) VALUES ('test5@hotmail.com', '2017-01-12')
INSERT INTO [User] (Email,Registered) VALUES ('test6@hotmail.com', '2016-12-25')
INSERT INTO [User] (Email,Registered) VALUES ('test7@hotmail.com', '2017-01-04')
INSERT INTO [User] (Email,Registered) VALUES ('test8@hotmail.com', '2017-01-07')

INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (1,1,10)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (1,2,7)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (1,3,4)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (1,4,2)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (1,8,1)

INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (2,1,10)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (2,2,8)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (2,3,6)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (2,4,4)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (2,5,2)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (2,6,1)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (2,7,9)

INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (3,1,8)

INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (4,1,1)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (4,2,5)
INSERT INTO UserLanguage (LanguageId,UserId,Rating) VALUES (4,3,7)

delete UserLanguage where UserId = 7