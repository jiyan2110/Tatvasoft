-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE __EFMigrationsHistory(
	MigrationId Varchar(150) NOT NULL,
	ProductVersion Varchar(32) NOT NULL,
 CONSTRAINT PK___EFMigrationsHistory PRIMARY KEY 
(
	MigrationId
) 
);
/* SQLINES DEMO *** able [dbo].[City]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE City(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	CountryId int NOT NULL,
	CityName Text NULL,
 CONSTRAINT PK_City PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[CMS]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE CMS(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	Title Text NULL,
	Description Text NULL,
	Slug Text NULL,
	Status Text NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
 CONSTRAINT PK_CMS PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[ContactUs]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE ContactUs(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	UserId int NOT NULL,
	Name Text NULL,
	EmailAddress Text NULL,
	Subject Text NULL,
	Message Text NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
 CONSTRAINT PK_ContactUs PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[Country]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Country(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	CountryName Text NULL,
 CONSTRAINT PK_Country PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[ForgotPassword]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE ForgotPassword(
	Id Varchar(450) NOT NULL,
	UserId int NOT NULL,
	RequestDateTime Timestamp(6) NOT NULL,
 CONSTRAINT PK_ForgotPassword PRIMARY KEY 
(
	Id
) 
);
/* SQLINES DEMO *** able [dbo].[MissionApplication]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE MissionApplication(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	MissionId int NOT NULL,
	UserId int NOT NULL,
	AppliedDate Timestamp(3) NOT NULL,
	Status Boolean NOT NULL,
	CreatedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	ModifiedDate Timestamp(6) NULL,
	Sheet int NOT NULL,
 CONSTRAINT PK_MissionApplication PRIMARY KEY 
(
	Id
) 
);
/* SQLINES DEMO *** able [dbo].[MissionComment]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE MissionComment(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	MissionId int NOT NULL,
	UserId int NOT NULL,
	CommentDescription Text NULL,
	CommentDate Timestamp(3) NULL,
	CreatedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	ModifiedDate Timestamp(6) NULL,
 CONSTRAINT PK_MissionComment PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[MissionFavourites]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE MissionFavourites(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	MissionId int NOT NULL,
	UserId int NOT NULL,
	CreatedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	ModifiedDate Timestamp(6) NULL,
 CONSTRAINT PK_MissionFavourites PRIMARY KEY 
(
	Id
) 
);
/* SQLINES DEMO *** able [dbo].[MissionRating]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE MissionRating(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	MissionId int NOT NULL,
	UserId int NOT NULL,
	Rating int NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
 CONSTRAINT PK_MissionRating PRIMARY KEY 
(
	Id
) 
);
/* SQLINES DEMO *** able [dbo].[Missions]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Missions(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	MissionTitle Text NULL,
	MissionDescription Text NULL,
	MissionOrganisationName Text NULL,
	MissionOrganisationDetail Text NULL,
	CountryId int NOT NULL,
	CityId int NOT NULL,
	StartDate date NOT NULL,
	EndDate date NOT NULL,
	TotalSheets int NULL,
	RegistrationDeadLine date NULL,
	MissionThemeId Text NULL,
	MissionSkillId Text NULL,
	MissionVideoUrl Text NULL,
	MissionType Text NULL,
	MissionImages Text NULL,
	MissionDocuments Text NULL,
	MissionAvilability Text NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
 CONSTRAINT PK_Missions PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[MissionSkill]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE MissionSkill(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	SkillName Text NULL,
	Status Text NULL,
	CreatedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	ModifiedDate Timestamp(6) NULL,
 CONSTRAINT PK_MissionSkill PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[MissionTheme]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE MissionTheme(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	ThemeName Text NULL,
	Status Text NULL,
	CreatedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	ModifiedDate Timestamp(6) NULL,
 CONSTRAINT PK_MissionTheme PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[Story]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Story(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	MissionId int NOT NULL,
	UserId int NOT NULL,
	StoryTitle Text NULL,
	StoryDate Timestamp(6) NOT NULL,
	StoryDescription Text NULL,
	VideoUrl Text NULL,
	StoryImage Text NULL,
	IsActive Boolean NOT NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	StoryViewerCount int NULL,
 CONSTRAINT PK_Story PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[User]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE "User"(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	FirstName Text NULL,
	LastName Text NULL,
	PhoneNumber Text NULL,
	EmailAddress Text NULL,
	Password Text NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	UserType Text NULL,
 CONSTRAINT PK_User PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[UserDetail]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE UserDetail(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	UserId int NOT NULL,
	Name Text NULL,
	Surname Text NULL,
	EmployeeId Text NULL,
	Manager Text NULL,
	Title Text NULL,
	Department Text NULL,
	MyProfile Text NULL,
	WhyIVolunteer Text NULL,
	CountryId int NOT NULL,
	CityId int NOT NULL,
	Avilability Text NULL,
	LinkdInUrl Text NULL,
	MySkills Text NULL,
	UserImage Text NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	Status Boolean NOT NULL,
 CONSTRAINT PK_UserDetail PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[UserSkills]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE UserSkills(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	Skill Text NULL,
	UserId int NOT NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
 CONSTRAINT PK_UserSkills PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[VolunteeringGoals]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE VolunteeringGoals(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	UserId int NOT NULL,
	MissionId int NOT NULL,
	Date date NOT NULL,
	Action int NOT NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
	Message Text NULL,
 CONSTRAINT PK_VolunteeringGoals PRIMARY KEY 
(
	Id
) 
) ;
/* SQLINES DEMO *** able [dbo].[VolunteeringHours]    Script Date: 27-05-2025 13:06:06 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE VolunteeringHours(
	Id int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	UserId int NOT NULL,
	MissionId int NOT NULL,
	DateVolunteered date NOT NULL,
	Hours Text NULL,
	Minutes Text NULL,
	Message Text NULL,
	CreatedDate Timestamp(6) NULL,
	ModifiedDate Timestamp(6) NULL,
	IsDeleted Boolean NOT NULL,
 CONSTRAINT PK_VolunteeringHours PRIMARY KEY 
(
	Id
) 
) ;
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240102131843_InitialCI', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240106061122_Initialstory', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240109053634_InitialAddColumn', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240109074118_InitialAddColumn1', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240109074330_InitialAddColumn2', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240109094401_InitialAddColumn3', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240113035330_InitialAddTable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240113072755_InitialAddTables', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240113121110_InitialAddTabl', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240115064120_addTable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240115065050_addTable1', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240115065142_updatetable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240115085914_updatetables', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240115090051_updatetabless', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240115094504_updatetabl', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240115094816_updatetabls', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240116045741_updatecolumn', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240116060824_addTab', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240120061537_addtabls', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240120063327_addtablsd', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240120092704_updatecol', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240120100903_updatecols', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240121110623_updatemissions', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240121111211_updatemodal', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240122113010_addcommenttable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240122113429_updatecommenttable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240122121305_updatecommenttables', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240122121427_updatecommenttabl', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240123064727_addfavouritetable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240123065047_updatefavouritetable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240123083037_updatefavouritetables', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240123121846_addratingtable', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240123121934_addratingtables', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240127042126_altercolumnstory', '5.0.17');
INSERT INTO __EFMigrationsHistory (MigrationId, ProductVersion) VALUES ('20240127044907_altercolumnstoryh', '5.0.17');
 
/* SET IDENTITY_INSERT [dbo].[City] ON */ 

INSERT INTO City (Id, CountryId, CityName) VALUES (1, 1, 'Kabul');
INSERT INTO City (Id, CountryId, CityName) VALUES (2, 1, 'Kandahar');
INSERT INTO City (Id, CountryId, CityName) VALUES (3, 1, 'Herat');
INSERT INTO City (Id, CountryId, CityName) VALUES (4, 1, 'Kunduz');
INSERT INTO City (Id, CountryId, CityName) VALUES (5, 1, 'Jalalabad');
INSERT INTO City (Id, CountryId, CityName) VALUES (6, 1, 'Taloqan');
INSERT INTO City (Id, CountryId, CityName) VALUES (7, 1, 'Puli Khumri');
INSERT INTO City (Id, CountryId, CityName) VALUES (8, 1, 'Charikar');
INSERT INTO City (Id, CountryId, CityName) VALUES (9, 1, 'Lashkargah');
INSERT INTO City (Id, CountryId, CityName) VALUES (10, 1, 'Sheberghan');
INSERT INTO City (Id, CountryId, CityName) VALUES (11, 1, 'Ghazni');
INSERT INTO City (Id, CountryId, CityName) VALUES (12, 1, 'Khost');
INSERT INTO City (Id, CountryId, CityName) VALUES (13, 1, 'Sar-e Pol');
INSERT INTO City (Id, CountryId, CityName) VALUES (14, 1, 'Chaghcharan');
INSERT INTO City (Id, CountryId, CityName) VALUES (15, 1, 'Mihtarlamv');
INSERT INTO City (Id, CountryId, CityName) VALUES (16, 2, 'Sydney');
INSERT INTO City (Id, CountryId, CityName) VALUES (17, 2, 'Melbourne');
INSERT INTO City (Id, CountryId, CityName) VALUES (18, 2, 'Brisbane');
INSERT INTO City (Id, CountryId, CityName) VALUES (19, 2, 'Adelaide');
INSERT INTO City (Id, CountryId, CityName) VALUES (20, 2, 'Hobart');
INSERT INTO City (Id, CountryId, CityName) VALUES (21, 2, 'Darwin');
INSERT INTO City (Id, CountryId, CityName) VALUES (22, 3, 'Sao paulo');
INSERT INTO City (Id, CountryId, CityName) VALUES (23, 3, 'Brasilia');
INSERT INTO City (Id, CountryId, CityName) VALUES (24, 3, 'Salvador');
INSERT INTO City (Id, CountryId, CityName) VALUES (25, 3, 'Manaus');
INSERT INTO City (Id, CountryId, CityName) VALUES (26, 3, 'Belem');
INSERT INTO City (Id, CountryId, CityName) VALUES (27, 4, 'Ottawa');
INSERT INTO City (Id, CountryId, CityName) VALUES (28, 4, 'Edmonton');
INSERT INTO City (Id, CountryId, CityName) VALUES (29, 4, 'Victoria');
INSERT INTO City (Id, CountryId, CityName) VALUES (30, 4, 'Winnipeg');
INSERT INTO City (Id, CountryId, CityName) VALUES (31, 4, 'Toronto');
INSERT INTO City (Id, CountryId, CityName) VALUES (32, 4, 'Regina');
INSERT INTO City (Id, CountryId, CityName) VALUES (33, 5, 'Aarhus');
INSERT INTO City (Id, CountryId, CityName) VALUES (34, 5, 'Odense');
INSERT INTO City (Id, CountryId, CityName) VALUES (35, 5, 'Kodling');
INSERT INTO City (Id, CountryId, CityName) VALUES (36, 5, 'Horsens');
INSERT INTO City (Id, CountryId, CityName) VALUES (37, 5, 'Viborg');
INSERT INTO City (Id, CountryId, CityName) VALUES (38, 6, 'Mumbai');
INSERT INTO City (Id, CountryId, CityName) VALUES (39, 6, 'Ahmedabad');
INSERT INTO City (Id, CountryId, CityName) VALUES (40, 6, 'Jamnagar');
INSERT INTO City (Id, CountryId, CityName) VALUES (41, 6, 'Vadodara');
INSERT INTO City (Id, CountryId, CityName) VALUES (42, 6, 'Surat');
INSERT INTO City (Id, CountryId, CityName) VALUES (43, 6, 'Chennai');
INSERT INTO City (Id, CountryId, CityName) VALUES (44, 6, 'Surat');
INSERT INTO City (Id, CountryId, CityName) VALUES (45, 6, 'Pune');
INSERT INTO City (Id, CountryId, CityName) VALUES (46, 6, 'Rajkot');
INSERT INTO City (Id, CountryId, CityName) VALUES (47, 6, 'Nagpur');
INSERT INTO City (Id, CountryId, CityName) VALUES (48, 6, 'Hyderabad');
INSERT INTO City (Id, CountryId, CityName) VALUES (49, 6, 'Banglore');
INSERT INTO City (Id, CountryId, CityName) VALUES (50, 6, 'Delhi');
INSERT INTO City (Id, CountryId, CityName) VALUES (51, 7, 'Auckland');
INSERT INTO City (Id, CountryId, CityName) VALUES (52, 7, 'Charistchurch');
INSERT INTO City (Id, CountryId, CityName) VALUES (53, 7, 'Wellington');
INSERT INTO City (Id, CountryId, CityName) VALUES (54, 7, 'Hamilton');
INSERT INTO City (Id, CountryId, CityName) VALUES (55, 7, 'Tauranga');
INSERT INTO City (Id, CountryId, CityName) VALUES (56, 8, 'Aberdeen');
INSERT INTO City (Id, CountryId, CityName) VALUES (57, 8, 'Armagh');
INSERT INTO City (Id, CountryId, CityName) VALUES (58, 8, 'Belfast');
INSERT INTO City (Id, CountryId, CityName) VALUES (59, 8, 'Cambridge');
INSERT INTO City (Id, CountryId, CityName) VALUES (60, 8, 'Carlisle');
INSERT INTO City (Id, CountryId, CityName) VALUES (61, 8, 'Leicester');
/* SET IDENTITY_INSERT [dbo].[City] OFF */
 
/* SET IDENTITY_INSERT [dbo].[CMS] ON */ 

INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (1, 'Desktop publishing software like Aldus PageMaker including versions the leap into electronic typesetting.', '<p>Desktop publishing software like Aldus PageMaker including versions the leap into electronic typesetting.</p>', 'Test', 'active', CAST('2024-01-02T12:43:09.3433333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (2, 'Various versions have evolved over the years Many desktop publishing packages and web page editors.', '<p>Various versions have evolved over the years Many desktop publishing packages and web page editors.</p>', 'Test', 'active', CAST('2024-01-02T12:43:25.2800000' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (3, 'A Latin professor at Hampden-Sydney College in Virginia,', '<p>A Latin professor at Hampden-Sydney College in Virginia,</p>', 'Test', 'active', CAST('2024-01-02T12:43:38.8933333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (4, 'Suffered alteration in some form, by injected humour, or randomised words', '<p>Suffered alteration in some form, by injected humour, or randomised words</p>', 'Test', 'inactive', CAST('2024-01-02T12:43:55.8133333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (5, 'Our power of choice is untrammelled and when nothing prevents obest.', '<p>Our power of choice is untrammelled and when nothing prevents obest.</p>', 'Test', 'active', CAST('2024-01-02T12:44:09.5900000' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (6, 'Untrammelled and when nothing prevents our being able to do what we like best .10.32 and 1.10.33 from "de Finibus Bono”.', '<p>Untrammelled and when nothing prevents our being able to do what we like best .10.32 and 1.10.33 from "de Finibus Bono”.</p>', 'Test', 'active', CAST('2024-01-02T12:44:22.6666667' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (7, 'Et harum quidem rerum facilis est et expedita distinctio., very popular during the Renaissance.', '<p>Et harum quidem rerum facilis est et expedita distinctio., very popular during the Renaissance.</p>', 'Test', 'active', CAST('2024-01-02T12:44:33.9666667' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (8, 'Maiores alias consequatur aut perferendis doloribus asperiores repellat', '<p>Maiores alias consequatur aut perferendis doloribus asperiores repellat</p>', 'Test', 'inactive', CAST('2024-01-02T12:44:43.8233333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (9, 'Beguiled and demoralized by the charms of pleasure of the moment,', '<p>Beguiled and demoralized by the charms of pleasure of the moment,</p>', 'Test', 'active', CAST('2024-01-02T12:44:52.8933333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (10, 'When nothing prevents our being able to do what we like best .10.32 and 1.10.33 from "de Finibus Bono”.', '<p>When nothing prevents our being able to do what we like best .10.32 and 1.10.33 from "de Finibus Bono”.</p>', 'Test', 'active', CAST('2024-01-02T12:45:01.9733333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO CMS (Id, Title, Description, Slug, Status, CreatedDate, ModifiedDate, IsDeleted) VALUES (11, 'Quidem rerum facilis est et expedita distinctio., very popular during the Renaissance.', '<p>Quidem rerum facilis est et expedita distinctio., very popular during the Renaissance.</p>', 'Test', 'active', CAST('2024-01-02T12:45:10.7000000' AS TIMESTAMP(6)), NULL, 0);
/* SET IDENTITY_INSERT [dbo].[CMS] OFF */
 
/* SET IDENTITY_INSERT [dbo].[ContactUs] ON */ 

INSERT INTO ContactUs (Id, UserId, Name, EmailAddress, Subject, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (1, 5, 'Evan Donohue', 'evan@gmail.com', 'Test', 'This is Test Message', CAST('2024-01-13T10:36:00.3066667' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO ContactUs (Id, UserId, Name, EmailAddress, Subject, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (2, 5, 'Evan Donohue', 'evan@gmail.com', 'Testing Contact', 'This is Testing to ContactUs Detail', CAST('2024-01-13T10:37:55.8566667' AS TIMESTAMP(6)), NULL, 0);
/* SET IDENTITY_INSERT [dbo].[ContactUs] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Country] ON */ 

INSERT INTO Country (Id, CountryName) VALUES (1, 'Afghanistan');
INSERT INTO Country (Id, CountryName) VALUES (2, 'Australia');
INSERT INTO Country (Id, CountryName) VALUES (3, 'Brazil');
INSERT INTO Country (Id, CountryName) VALUES (4, 'Canada');
INSERT INTO Country (Id, CountryName) VALUES (5, 'Denmark');
INSERT INTO Country (Id, CountryName) VALUES (6, 'India');
INSERT INTO Country (Id, CountryName) VALUES (7, 'NewZealand');
INSERT INTO Country (Id, CountryName) VALUES (8, 'United Kingdom');
/* SET IDENTITY_INSERT [dbo].[Country] OFF */
 
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('03d5c6a8-8e05-4dcc-be73-985c1668c30c', 1008, CAST('2024-03-11T11:09:10.8819880' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('1006e587-a25f-40cd-8986-f4d0a8dc5547', 1008, CAST('2024-03-21T14:18:45.5233828' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('2ea153c5-d75f-4315-a905-c17bd7f78bd8', 1, CAST('2022-12-15T11:36:18.4165600' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('37884a03-4cdc-4284-8564-47f01f9e607b', 1008, CAST('2024-03-21T14:16:51.0556995' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('3acdc119-ef04-4ebc-afc9-a4a7223dbcb8', 1, CAST('2022-12-15T11:41:20.7362098' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('4c2613fe-357a-4455-885b-840a45c22fcc', 1, CAST('2022-12-15T11:36:13.0841795' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('8da701f2-c013-4b2f-ad0f-bbac2cc5e478', 1008, CAST('2024-03-11T11:13:36.0366425' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('8f173b1c-fa06-4618-a2f7-bc35e48c4ceb', 3, CAST('2022-12-15T11:44:40.9481707' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('b175e3a5-1b11-4fa6-bb8d-d5cdc7de38f8', 1008, CAST('2024-03-21T14:16:08.8879447' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('b788eb9e-926f-40fa-b738-74385648de76', 1008, CAST('2024-03-21T14:17:31.6946490' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('c250865d-2812-4a64-b130-2a1015cbab9e', 1, CAST('2022-12-15T11:41:17.8741631' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('ca45fcc4-835e-493c-8065-d14f76bdec2e', 1008, CAST('2024-03-27T10:07:13.8175785' AS TIMESTAMP(6)));
INSERT INTO ForgotPassword (Id, UserId, RequestDateTime) VALUES ('d28d0d7e-3b9f-4037-af3b-a8bb86b8962d', 1, CAST('2022-12-20T11:00:40.7355788' AS TIMESTAMP(6)));
 
/* SET IDENTITY_INSERT [dbo].[MissionApplication] ON */ 

INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (1, 8, 3, CAST('2024-01-26T14:17:33.000' AS TIMESTAMP(3)), 0, CAST('2024-01-26T14:17:54.8466667' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (3, 9, 3, CAST('2024-01-26T17:08:30.000' AS TIMESTAMP(3)), 0, CAST('2024-01-26T17:08:30.1366667' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (5, 1, 3, CAST('2024-01-26T17:42:29.000' AS TIMESTAMP(3)), 1, CAST('2024-01-26T17:42:34.0600000' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (6, 4, 5, CAST('2024-01-26T17:44:32.000' AS TIMESTAMP(3)), 0, CAST('2024-01-26T17:44:32.0733333' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (8, 3, 1008, CAST('2024-03-11T12:07:12.000' AS TIMESTAMP(3)), 0, CAST('2024-03-11T12:07:12.6800000' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (9, 10, 1008, CAST('2024-03-11T12:09:23.000' AS TIMESTAMP(3)), 0, CAST('2024-03-11T12:09:23.3666667' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (10, 3, 5, CAST('2024-03-13T16:30:19.000' AS TIMESTAMP(3)), 0, CAST('2024-03-13T16:30:19.5433333' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (11, 11, 5, CAST('2024-03-13T16:47:22.000' AS TIMESTAMP(3)), 1, CAST('2024-03-13T16:47:22.1333333' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (12, 3, 5, CAST('2024-03-13T17:05:23.000' AS TIMESTAMP(3)), 1, CAST('2024-03-13T17:05:23.0600000' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (13, 3, 5, CAST('2024-03-20T09:23:55.000' AS TIMESTAMP(3)), 0, CAST('2024-03-20T09:23:55.1700000' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (14, 3, 5, CAST('2024-03-21T14:27:12.000' AS TIMESTAMP(3)), 0, CAST('2024-03-21T14:27:12.0366667' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (15, 3, 5, CAST('2024-04-08T12:09:18.000' AS TIMESTAMP(3)), 1, CAST('2024-04-08T12:09:18.9300000' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (16, 3, 5, CAST('2024-04-08T12:09:31.000' AS TIMESTAMP(3)), 1, CAST('2024-04-08T12:09:31.4633333' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (17, 3, 5, CAST('2024-04-09T11:44:49.000' AS TIMESTAMP(3)), 1, CAST('2024-04-09T11:44:49.1800000' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (18, 3, 3, CAST('2024-04-09T11:50:20.000' AS TIMESTAMP(3)), 1, CAST('2024-04-09T11:50:20.1966667' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (19, 0, 5, CAST('2024-04-24T11:31:04.000' AS TIMESTAMP(3)), 0, CAST('2024-04-24T11:31:04.1000000' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (20, 6, 5, CAST('2024-04-24T11:59:52.000' AS TIMESTAMP(3)), 1, CAST('2024-04-24T12:00:29.3579891' AS TIMESTAMP(6)), 0, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (21, 7, 5, CAST('2024-04-24T12:08:03.000' AS TIMESTAMP(3)), 0, CAST('2024-04-24T12:08:05.2355846' AS TIMESTAMP(6)), 1, NULL, 1);
INSERT INTO MissionApplication (Id, MissionId, UserId, AppliedDate, Status, CreatedDate, IsDeleted, ModifiedDate, Sheet) VALUES (22, 13, 5, CAST('2024-05-01T11:42:35.000' AS TIMESTAMP(3)), 1, CAST('2024-05-01T11:42:57.4531540' AS TIMESTAMP(6)), 0, NULL, 1);
/* SET IDENTITY_INSERT [dbo].[MissionApplication] OFF */
 
/* SET IDENTITY_INSERT [dbo].[MissionComment] ON */ 

INSERT INTO MissionComment (Id, MissionId, UserId, CommentDescription, CommentDate, CreatedDate, IsDeleted, ModifiedDate) VALUES (1, 1, 5, 'Nice mission great opportunity for peoples', CAST('2022-12-23T17:22:00.000' AS TIMESTAMP(3)), CAST('2022-12-23T17:22:46.1166667' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionComment (Id, MissionId, UserId, CommentDescription, CommentDate, CreatedDate, IsDeleted, ModifiedDate) VALUES (2, 1, 3, 'This is Helpful Mission', CAST('2022-12-23T17:23:00.000' AS TIMESTAMP(3)), CAST('2022-12-23T17:23:29.8100000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionComment (Id, MissionId, UserId, CommentDescription, CommentDate, CreatedDate, IsDeleted, ModifiedDate) VALUES (3, 3, 5, 'Heelo test', CAST('2024-04-23T10:36:00.000' AS TIMESTAMP(3)), CAST('2024-04-23T10:36:53.5233333' AS TIMESTAMP(6)), 0, NULL);
/* SET IDENTITY_INSERT [dbo].[MissionComment] OFF */
 
/* SET IDENTITY_INSERT [dbo].[MissionFavourites] ON */ 

INSERT INTO MissionFavourites (Id, MissionId, UserId, CreatedDate, IsDeleted, ModifiedDate) VALUES (1, 1, 3, CAST('2022-12-23T17:46:06.4666667' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionFavourites (Id, MissionId, UserId, CreatedDate, IsDeleted, ModifiedDate) VALUES (2, 5, 3, CAST('2022-12-23T17:46:09.8500000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionFavourites (Id, MissionId, UserId, CreatedDate, IsDeleted, ModifiedDate) VALUES (6, 3, 3, CAST('2022-12-26T10:01:19.2533333' AS TIMESTAMP(6)), 0, NULL);
/* SET IDENTITY_INSERT [dbo].[MissionFavourites] OFF */
 
/* SET IDENTITY_INSERT [dbo].[MissionRating] ON */ 

INSERT INTO MissionRating (Id, MissionId, UserId, Rating, CreatedDate, ModifiedDate, IsDeleted) VALUES (1, 1, 3, 5, CAST('2022-12-26T11:51:03.8566667' AS TIMESTAMP(6)), CAST('2022-12-26T14:40:45.1366667' AS TIMESTAMP(6)), 0);
INSERT INTO MissionRating (Id, MissionId, UserId, Rating, CreatedDate, ModifiedDate, IsDeleted) VALUES (2, 3, 3, 4, CAST('2022-12-26T11:53:21.0900000' AS TIMESTAMP(6)), CAST('2022-12-26T11:53:30.1066667' AS TIMESTAMP(6)), 0);
INSERT INTO MissionRating (Id, MissionId, UserId, Rating, CreatedDate, ModifiedDate, IsDeleted) VALUES (3, 4, 3, 2, CAST('2022-12-26T12:27:44.0866667' AS TIMESTAMP(6)), CAST('2022-12-26T13:58:56.3566667' AS TIMESTAMP(6)), 0);
INSERT INTO MissionRating (Id, MissionId, UserId, Rating, CreatedDate, ModifiedDate, IsDeleted) VALUES (4, 3, 5, 5, CAST('2024-02-09T11:41:35.4800000' AS TIMESTAMP(6)), CAST('2024-02-09T11:41:35.5000000' AS TIMESTAMP(6)), 0);
INSERT INTO MissionRating (Id, MissionId, UserId, Rating, CreatedDate, ModifiedDate, IsDeleted) VALUES (5, 6, 5, 4, CAST('2024-02-09T11:41:41.7600000' AS TIMESTAMP(6)), CAST('2024-02-09T11:41:46.4933333' AS TIMESTAMP(6)), 0);
INSERT INTO MissionRating (Id, MissionId, UserId, Rating, CreatedDate, ModifiedDate, IsDeleted) VALUES (6, 12, 5, 5, CAST('2024-03-21T14:25:23.8500000' AS TIMESTAMP(6)), CAST('2024-03-21T14:25:23.8733333' AS TIMESTAMP(6)), 0);
/* SET IDENTITY_INSERT [dbo].[MissionRating] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Missions] ON */ 

INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (1, 'Desktop publishing softwares', 'Desktop publishing software like Aldus PageMaker including versions the leap into electronic.', 'United Nations Organization (UN)', 'Second, on our list of international organizations is UNICEF. UNICEF, or the United Nations Children’s Fund, is a United Nations organization that provides humanitarian and developmental aid to children around the world. With a presence in 192 countries and territories, the agency is one of the most well-known and well-known social welfare organizations in the world. Immunization and disease prevention are among UNICEF’s initiatives, as are HIV treatment for children and women, improving childhood and maternal nutrition, increasing sanitation, promoting education, and providing emergency relief in disasters.', 6, 48, CAST('2024-01-29' AS Date), CAST('2024-01-30' AS Date), 99, CAST('2024-01-28' AS Date), '17', '1,3', 'https://www.youtube.com', 'Time', 'UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability-1_20221223155829.png,UploadMissionImageMissionimage2_20221223155829.png,UploadMissionImageMissionimg_20221223155829.png,UploadMissionImageMissionimg2_20221223155829.png', NULL, 'missionAvilability1', CAST('2022-12-23T15:58:29.1033333' AS TIMESTAMP(6)), CAST('2024-03-21T14:21:43.6900000' AS TIMESTAMP(6)), 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (2, 'Various versions have evolved overs', 'Various versions have evolved over the years Many desktop publishing packages and web page editors', 'United Nations Children’s Fund (UNICEF)', 'Next on our list of international organizations is WHO. The World Health Organization (WHO) is a United Nations specialized organization in charge of international public health. “The attainment by all peoples of the highest attainable degree of health,” declares the WHO Constitution, which sets the agency’s governance structure and ideals. It has six semi-autonomous regional offices and 150 field offices worldwide, with its headquarters in Geneva, Switzerland. ', 2, 19, CAST('2024-01-25' AS Date), CAST('2024-01-25' AS Date), 100, CAST('2024-01-24' AS Date), '13', '3,7,9', 'https://www.youtube.com', 'Time', 'UploadMissionImageMissionimg2_20221223155952.png,UploadMissionImageMissionimg22_20221223155952.png,UploadMissionImageMissionPlantation_20221223155952.png', NULL, 'missionAvilability2', CAST('2022-12-23T15:59:52.9900000' AS TIMESTAMP(6)), CAST('2024-02-09T11:43:28.1166667' AS TIMESTAMP(6)), 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (3, 'A Latin professor at Hampden-Sydney', 'A Latin professor at Hampden-Sydney College in Virginia,', 'World Health Organization (WHO)', 'The World Economic Forum (WEF), based in Cologny, Canton of Geneva, Switzerland, is an international non-governmental organization (NGO) created on January 24, 1971. “Committed to improving the status of the world by engaging commercial, governmental, intellectual, and other leaders of society to influence global, regional, and industry agendas,” reads the WEF’s mission statement.', 3, 26, CAST('2024-01-27' AS Date), CAST('2024-01-27' AS Date), 96, NULL, '7', '7', 'https://www.youtube.com', 'Goal', 'UploadMissionImageMissionCSR-initiative-stands-for-Coffee--and-Farmer-Equity-6_20221223160110.png,UploadMissionImageMissionEducation-Supplies-for-Every--Pair-of-Shoes-Sold-1_20221223160110.png,UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability-1_20221223160110.png', NULL, 'missionAvilability3', CAST('2022-12-23T16:01:10.4666667' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (4, 'Suffered alteration in some form', 'Suffered alteration in some form, by injected humour, or randomised words', 'World Economic Forum', 'The International Monetary Fund (IMF) is one of the most prominent international organization and thus on our list. It is a 190-country international financial institution headquartered in Washington, D.C. that works to promote global monetary cooperation, secure financial stability, facilitate international trade, promote high employment and sustainable economic growth, and reduce poverty around the world while relying on the World Bank for resources on a periodic basis.', 4, 27, CAST('2024-01-30' AS Date), CAST('2024-01-31' AS Date), 74, CAST('2024-01-29' AS Date), '13', '3,7,9', 'https://www.youtube.com/', 'Time', 'UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability-2_20221223160234.png', NULL, 'missionAvilability4', CAST('2022-12-23T16:02:34.0700000' AS TIMESTAMP(6)), CAST('2024-02-09T11:45:18.1833333' AS TIMESTAMP(6)), 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (5, 'Et harum quidem rerum facilis est', 'Et harum quidem rerum facilis est et expedita distinctio., very popular during the Renaissance', ' International Monetary Fund (IMF)', 'Next on our list of international organizations is World Bank. The World Bank is an international financial agency that lends and gives money to governments in low- and middle-income nations to fund capital projects. The International Bank for Reconstruction and Development (IBRD) and the International Development Association (IDA) are the two institutions that make up the organization (IDA). The World Bank Group consists of the World Bank and its subsidiaries.', 5, 37, CAST('2024-01-26' AS Date), CAST('2024-01-27' AS Date), 124, CAST('2024-01-25' AS Date), '12', '5,7', 'https://www.youtube.com', 'Time', 'UploadMissionImageMissionEducation-Supplies-for-Every--Pair-of-Shoes-Sold-1_20221223160340.png', NULL, 'missionAvilability5', CAST('2022-12-23T16:03:40.9800000' AS TIMESTAMP(6)), CAST('2024-02-09T11:46:03.0600000' AS TIMESTAMP(6)), 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (6, 'Maiores alias consequatur aut', 'Maiores alias consequatur aut perferendis doloribus asperiores repellat', ' World Bank', 'he World Trade Organization (WTO) is a multilateral organization that regulates and supports international trade. It began operations on January 1, 1995, as a result of the 1994 Marrakesh Agreement, which replaced the 1948-established General Agreement on Tariffs and Trade (GATT).', 5, 35, CAST('2024-01-28' AS Date), CAST('2024-01-29' AS Date), 99, NULL, '14', '6,8', 'https://www.youtube.com', 'Goal', 'UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability-3_20221223160527.png,UploadMissionImageMissionimage1_20221223160527.png,UploadMissionImageMissionimg2_20221223160527.png,UploadMissionImageMissionimg33_20221223160527.png,UploadMissionImageMissionNourish-the-Children-in--African-country_20221223160527.png,UploadMissionImageMissionPlantation_20221223160527.png', NULL, 'missionAvilability5', CAST('2022-12-23T16:05:27.9166667' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (7, 'Our power of choice is untrammelled', 'Our power of choice is untrammelled and when nothing prevents obest.', 'World Trade Organization ', 'ASEAN, or the Association of Southeast Asian Nations, is an economic union in Southeast Asia made up of ten member states that promote intergovernmental cooperation and facilitate economic, political, security, military, educational, and sociocultural integration among its members and other Asian countries.', 8, 58, CAST('2024-02-01' AS Date), CAST('2024-02-02' AS Date), 99, NULL, '4', '3', 'https://www.youtube.com', 'Goal', 'UploadMissionImageMissionEducation-Supplies-for-Every--Pair-of-Shoes-Sold-1_20221223160921.png,UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability_20221223160921.png,UploadMissionImageMissionimage1_20221223160921.png,UploadMissionImageMissionimg1_20221223160921.png', 'UploadMissionImageMissionDocCI-SRS-Final-23_20221223160921.docx', 'missionAvilability3', CAST('2022-12-23T16:09:21.4333333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (8, 'Beguiled and demoralized by the charms', 'Beguiled and demoralized by the charms of pleasure of the moment,', 'Association of South East Nations (ASEAN)', 'The Asian Infrastructure Investment Bank (AIIB) is an international development bank dedicated to improving Asia’s economic and social conditions. Currently, the bank has 103 members and 21 prospective members from all around the world.', 5, 35, CAST('2024-01-29' AS Date), CAST('2024-01-30' AS Date), 149, CAST('2024-01-28' AS Date), '7', '1,4', '', 'Time', 'UploadMissionImageMissionCSR-initiative-stands-for-Coffee--and-Farmer-Equity-6_20221223161040.png,UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability-login_20221223161040.png', 'UploadMissionImageMissionDocaddtocart_20221223161040.txt', 'missionAvilability4', CAST('2022-12-23T16:10:40.0566667' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (9, 'Untrammelled and when nothing prevents', 'Untrammelled and when nothing prevents our being able to do what we like best .10.32 and 1.10.33 from "de Finibus Bono”.', 'Asian Infrastructure Investment Bank (AIIB)', 'The Asian Development Bank (ADB) is a regional development bank headquartered in the Ortigas Center in Mandaluyong, Metro Manila, Philippines. It was founded on December 19, 1966. In addition the corporation operates 31 field offices around the world to promote Asia’s social and economic development.', 6, 49, CAST('2024-01-30' AS Date), CAST('2024-01-31' AS Date), 23, CAST('2024-01-29' AS Date), '9', '2', 'https://www.youtube.com', 'Time', 'UploadMissionImageMissionCSR-initiative-stands-for-Coffee--and-Farmer-Equity-6_20221223161205.png,UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability-5_20221223161205.png,UploadMissionImageMissionimage1_20221223161205.png,UploadMissionImageMissionimg22_20221223161205.png,UploadMissionImageMissionPlantation_20221223161205.png', NULL, 'missionAvilability5', CAST('2022-12-23T16:12:05.9500000' AS TIMESTAMP(6)), CAST('2024-02-09T11:48:18.1200000' AS TIMESTAMP(6)), 0);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (10, 'Oluptates repudiandae sint et molestiae', 'Oluptates repudiandae sint et molestiae non recusandae.', 'Asian Development Bank (ADB)', 'he World Trade Organization (WTO) is a multilateral organization that regulates and supports international trade. It began operations on January 1, 1995, as a result of the 1994 Marrakesh Agreement, which replaced the 1948-established General Agreement on Tariffs and Trade (GATT).', 5, 36, CAST('2024-01-25' AS Date), CAST('2024-01-26' AS Date), 100, NULL, '7', '3,6,9', 'https://www.youtube.com', 'Goal', 'UploadMissionImageMissionGrow-Trees-On-the-path-to-environment-sustainability-1_20221223161312.png,UploadMissionImageMissionimage2_20221223161312.png', 'UploadMissionImageMissionDocCI-SRS-Final-23_20221223161312.docx', 'missionAvilability3', CAST('2022-12-23T16:13:12.6133333' AS TIMESTAMP(6)), NULL, 1);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (11, 'Desktop publishing software', 'Desktop publishing software like Aldus PageMaker including versions the leap into electronic typesetting.', 'United Nations Organization (UN)', 'Second, on our list of international organizations is UNICEF. UNICEF, or the United Nations Children’s Fund, is a United Nations organization that provides humanitarian and developmental aid to children around the world. With a presence in 192 countries and territories, the agency is one of the most well-known and well-known social welfare organizations in the world. Immunization and disease prevention are among UNICEF’s initiatives, as are HIV treatment for children and women, improving childhood and maternal nutrition, increasing sanitation, promoting education, and providing emergency relief in disasters.', 6, 46, CAST('2024-03-15' AS Date), CAST('2024-03-31' AS Date), 98, CAST('2024-03-14' AS Date), '17', '1,2,3', 'https://www.youtube.com', 'Time', 'UploadMissionImageMission11_20240313164643.png,UploadMissionImageMission12_20240313164643.png,UploadMissionImageMission21_20240313164643.png,UploadMissionImageMission22_20240313164643.png,UploadMissionImageMission31_20240313164643.png', '', 'missionAvilability1', CAST('2024-03-13T16:46:43.5733333' AS TIMESTAMP(6)), NULL, 1);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (12, 'Test Mission', 'Test', 'Test', 'Test', 6, 44, CAST('2024-03-21' AS Date), CAST('2024-03-30' AS Date), 10, CAST('2024-03-20' AS Date), '4', '2,3,4', 'http://localhost:56577/swagger/index.html', 'Time', 'UploadMissionImageMission11_20240321142440.png,UploadMissionImageMission21_20240321142440.png,UploadMissionImageMission22_20240321142440.png,UploadMissionImageMission31_20240321142440.png', '', 'missionAvilability2', CAST('2024-03-21T14:24:40.3566667' AS TIMESTAMP(6)), NULL, 1);
INSERT INTO Missions (Id, MissionTitle, MissionDescription, MissionOrganisationName, MissionOrganisationDetail, CountryId, CityId, StartDate, EndDate, TotalSheets, RegistrationDeadLine, MissionThemeId, MissionSkillId, MissionVideoUrl, MissionType, MissionImages, MissionDocuments, MissionAvilability, CreatedDate, ModifiedDate, IsDeleted) VALUES (13, 'Test Mission Update', 'Test', NULL, NULL, 6, 46, CAST('2024-05-01' AS Date), CAST('2024-05-05' AS Date), 0, NULL, '13', '3,4', NULL, NULL, 'UploadMissionImageMission10_20240501105157.jpeg', NULL, NULL, NULL, CAST('2024-05-01T11:23:10.7821876' AS TIMESTAMP(6)), 0);
/* SET IDENTITY_INSERT [dbo].[Missions] OFF */
 
/* SET IDENTITY_INSERT [dbo].[MissionSkill] ON */ 

INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (1, 'Spanish Language', 'active', CAST('2022-12-20T14:38:31.8333333' AS TIMESTAMP(6)), 0, CAST('2024-04-23T10:31:26.3533333' AS TIMESTAMP(6)));
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (2, 'Community Outreach', 'active', CAST('2022-12-20T14:38:42.4400000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (3, 'Leadership', 'active', CAST('2022-12-20T14:38:55.7600000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (4, 'Self-Motivated', 'active', CAST('2022-12-20T14:41:25.4800000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (5, 'Lifelong Learner', 'active', CAST('2022-12-20T14:41:35.6633333' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (6, 'Leader and Follower', 'active', CAST('2022-12-20T14:41:44.1033333' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (7, 'Positive Attitude', 'active', CAST('2022-12-20T14:41:52.1033333' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (8, 'Positive Thinkers', 'active', CAST('2022-12-20T14:44:00.8866667' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionSkill (Id, SkillName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (9, 'Open-Minded', 'active', CAST('2022-12-20T14:44:09.0133333' AS TIMESTAMP(6)), 0, NULL);
/* SET IDENTITY_INSERT [dbo].[MissionSkill] OFF */
 
/* SET IDENTITY_INSERT [dbo].[MissionTheme] ON */ 

INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (1, 'A Church in Every Nation', 'active', CAST('2022-12-20T13:00:43.2500000' AS TIMESTAMP(6)), 0, CAST('2022-12-20T14:13:39.1333333' AS TIMESTAMP(6)));
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (2, 'A Clear and Compelling Call', 'active', CAST('2022-12-20T13:01:15.1900000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (3, 'A Heart for the Harvest","A Time for True Freedom', 'active', CAST('2022-12-20T13:01:25.5100000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (4, 'A Vision of the Harvest', 'active', CAST('2022-12-20T13:01:35.5566667' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (5, 'A Waiting World - a Willing Churchs?', 'inactive', CAST('2022-12-20T13:01:47.3100000' AS TIMESTAMP(6)), 1, CAST('2024-04-23T10:30:39.9200000' AS TIMESTAMP(6)));
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (6, 'Across the Street - Across the Sea', 'active', CAST('2022-12-20T13:01:57.6033333' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (7, 'An Open Door', 'active', CAST('2022-12-20T13:02:06.2100000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (8, 'Approved to Proclaim (1 Thes. 2:4)', 'active', CAST('2022-12-20T13:02:16.9600000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (9, 'Are We There Yet?', 'active', CAST('2022-12-20T13:02:25.5466667' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (10, 'Arise, Go, Preach (Jonah 3:2)', 'active', CAST('2022-12-20T13:02:34.7466667' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (11, 'Around the Community, Around the World', 'active', CAST('2022-12-20T13:02:45.3000000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (12, 'World of Opportunities', 'active', CAST('2022-12-20T13:04:49.6833333' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (13, 'A Whole New World', 'active', CAST('2022-12-20T13:04:56.6433333' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (14, 'A Celebration of Success', 'active', CAST('2022-12-20T13:05:04.0900000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (15, 'A Spectrum of Opportunities', 'active', CAST('2022-12-20T13:05:11.7500000' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (16, 'Ain’t No Stoppin’ Us Now', 'active', CAST('2022-12-20T13:05:18.8666667' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO MissionTheme (Id, ThemeName, Status, CreatedDate, IsDeleted, ModifiedDate) VALUES (17, 'Better and Consistent', 'active', CAST('2022-12-20T14:14:07.9133333' AS TIMESTAMP(6)), 0, NULL);
/* SET IDENTITY_INSERT [dbo].[MissionTheme] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Story] ON */ 

INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (1, 2, 5, 'Desktop publishing software also the leap into', CAST('2024-01-25T00:00:00.0000000' AS TIMESTAMP(6)), '<p>Desktop publishing software like Aldus PageMaker including versions the leap into electronic typesetting.</p>', 'https://www.google.com/', 'UploadMissionImageShareStoryimg3_20221206150249.png,UploadMissionImageShareStoryimg22_20221206150249.png,UploadMissionImageShareStoryimg33_20221206150249.png', 1, CAST('2022-12-06T15:03:12.6300000' AS TIMESTAMP(6)), NULL, 0, 9);
INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (2, 3, 3, 'Various versions have evolved over sometimes', CAST('2024-01-25T00:00:00.0000000' AS TIMESTAMP(6)), '<p>There are a ton of lorem ipsum generators out there. But what makes this one a standout is the number of really useful options it offers.
 Sure, you can configure the number of words or paragraphs you need – that’s fairly standard. However, this “Professional” tool also lets you choose between 
 HTML and plain text (which you can copy or download), along with several different languages to pick from.</p>', 'https://www.w3schools.com/html/default.asp', 'UploadMissionImageShareStoryEducation-Supplies-for-Every--Pair-of-Shoes-Sold-2_20221206150602.png,UploadMissionImageShareStoryGrow-Trees-On-the-path-to-environment-sustainability_20221215100327.png,UploadMissionImageShareStoryimg_20221215100327.png,UploadMissionImageShareStoryimg1_20221215100327.png,UploadMissionImageShareStoryimg11_20221215100327.png,UploadMissionImageShareStoryAnimal-welfare-_-save-birds-campaign-1_20221206151140.png', 1, CAST('2022-12-06T15:07:09.5633333' AS TIMESTAMP(6)), NULL, 0, NULL);
INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (3, 5, 2, 'A Latin professor at Hampden-Sydney  like Aldus PageMaker i', CAST('2024-01-25T00:00:00.0000000' AS TIMESTAMP(6)), '<p>A Latin professor at Hampden-Sydney College in Virginia,</p>', 'https://www.geeksforgeeks.org/html/', 'UploadMissionImageShareStoryimg1_20221206151038.png,UploadMissionImageShareStoryNourish-the-Children-in--African-country_20221206151038.png', 1, CAST('2022-12-06T15:10:39.8200000' AS TIMESTAMP(6)), NULL, 0, NULL);
INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (4, 9, 3, 'Suffered alteration in some form still in their infancy.', CAST('2024-01-25T00:00:00.0000000' AS TIMESTAMP(6)), '<p>The word Lorem Ipsum is derived from the Latin word which means “pain itself”. It is a kind of a text filler tool that is used by the webmaster on the website.
Basically, this tool is used to create dummy content on the website when it’s new.</p>
<p>It helps the designer plan where the content will sit. It helps in creating drafts of the content on the pages of the website. It originates from the Latin text but is seen as gibberish.</p>
<p>Sometimes, the reader gets distracted while creating or working on the website. That’s why this language is important.</p>
<p>This tool makes the work easier for the webmaster.</p>
', 'https://www.youtube.com/', 'UploadMissionImageShareStoryGrow-Trees-On-the-path-to-environment-sustainability_20221215100327.png,UploadMissionImageShareStoryimg_20221215100327.png,UploadMissionImageShareStoryimg1_20221215100327.png,UploadMissionImageShareStoryimg11_20221215100327.png,UploadMissionImageShareStoryAnimal-welfare-_-save-birds-campaign-1_20221206151140.png', 1, CAST('2022-12-06T15:11:41.7866667' AS TIMESTAMP(6)), NULL, 0, 1);
INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (5, 5, 5, 'Et harum quidem rerum facilis est  make a type specimen book', CAST('2024-01-25T00:00:00.0000000' AS TIMESTAMP(6)), '<p>Our power of choice is untrammelled and when nothing prevents obest.</p>', 'https://valor-software.com/ngx-bootstrap/#/documentation', 'UploadMissionImageShareStoryGrow-Trees-On-the-path-to-environment-sustainability-1_20221206151509.png', 0, CAST('2022-12-06T15:16:36.7466667' AS TIMESTAMP(6)), NULL, 0, NULL);
INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (6, 10, 2, 'Untrammelled and when nothing prevents', CAST('2024-01-25T00:00:00.0000000' AS TIMESTAMP(6)), '<p>Untrammelled and when nothing prevents our being able to do what we like best .10.32 and 1.10.33Untrammelled and when nothing prevents our being able to do what we like best .10.32 and 1.10.33..</p>', 'https://www.youtube.com/', 'UploadMissionImageShareStoryPlantation-and-Afforestation-programme-1_20221209124034.png', 1, CAST('2022-12-09T12:40:35.0666667' AS TIMESTAMP(6)), NULL, 0, NULL);
INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (1006, 3, 5, 'A Latin professor at Hampden-Sydney', CAST('2024-01-25T00:00:00.0000000' AS TIMESTAMP(6)), '<p>A Latin professor at Hampden-Sydney  like Aldus PageMaker i, professor at Hampden-Sydney  like Aldus PageMaker i</p>', 'https://www.youtube.com/', 'UploadMissionImageShareStoryEducation-Supplies-for-Every--Pair-of-Shoes-Sold-2_20221215100327.png,UploadMissionImageShareStoryGrow-Trees-On-the-path-to-environment-sustainability_20221215100327.png,UploadMissionImageShareStoryimg_20221215100327.png,UploadMissionImageShareStoryimg1_20221215100327.png,UploadMissionImageShareStoryimg11_20221215100327.png', 1, CAST('2022-12-15T10:03:27.7866667' AS TIMESTAMP(6)), NULL, 0, NULL);
INSERT INTO Story (Id, MissionId, UserId, StoryTitle, StoryDate, StoryDescription, VideoUrl, StoryImage, IsActive, CreatedDate, ModifiedDate, IsDeleted, StoryViewerCount) VALUES (1007, 1, 3, 'Test', CAST('2024-03-01T00:00:00.0000000' AS TIMESTAMP(6)), '<p>Just for testing</p>', 'null', 'UploadMissionImageShareStory34_20240311113940.png', 0, CAST('2024-03-11T11:39:40.3366667' AS TIMESTAMP(6)), NULL, 0, NULL);
/* SET IDENTITY_INSERT [dbo].[Story] OFF */
 
/* SET IDENTITY_INSERT [dbo].[User] ON */ 

INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (1, 'Sourabh', 'Patidar', '8128335589', 'sourabh@gmail.com', 'Sourabh@123', CAST('2024-01-19T11:49:43.4266667' AS TIMESTAMP(6)), NULL, 0, 'admin');
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (2, 'Dheeraj', 'Patidar', '8403345343', 'dheeraj@gmail.com', 'Sourabh@123', CAST('2024-01-19T12:49:43.4266667' AS TIMESTAMP(6)), NULL, 1, 'user');
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (3, 'Test', 'User', '7878787878', 'test@gmail.com', 'Sourabh@123', CAST('2024-01-19T10:49:43.4266667' AS TIMESTAMP(6)), NULL, 0, 'user');
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (4, 'evans', 'donohues', '9876549556', 'sourabh123@gmail.com', 'Sourabh@123', CAST('2024-01-19T10:49:43.4266667' AS TIMESTAMP(6)), CAST('2024-01-12T09:49:43.4266667' AS TIMESTAMP(6)), 1, 'user');
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (5, 'Evan', 'Donohue', '7897897896', 'sourabh123@gmail.com', 'Sourabh@123', CAST('2024-01-19T10:49:43.4266667' AS TIMESTAMP(6)), CAST('2024-01-12T09:49:43.4266667' AS TIMESTAMP(6)), 0, 'user');
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (1007, 'Tatva', 'User', '7687686756', 'tatva@gmail.com', 'Sourabh@123', CAST('2022-12-28T09:09:35.3166667' AS TIMESTAMP(6)), NULL, 0, 'user');
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (1008, 'Test', 'Two', '8827970493', 'hunter8gaming@gmail.com', 'Tatva1234', CAST('2024-03-11T10:55:45.8766667' AS TIMESTAMP(6)), NULL, 1, 'user');
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (1009, 'Test', 'User Test', '1234567890', 'testuser@gmail.com', 'Test@123', CAST('2024-04-25T11:22:49.7200000' AS TIMESTAMP(6)), CAST('2024-04-29T17:10:37.0160187' AS TIMESTAMP(6)), 0, NULL);
INSERT INTO "User" (Id, FirstName, LastName, PhoneNumber, EmailAddress, Password, CreatedDate, ModifiedDate, IsDeleted, UserType) VALUES (1010, 'Sourabh', 'hjgvh', '0987654321', 'testnew@gmail.com', 'Sourabh@12', CAST('2024-05-01T12:48:30.7083542' AS TIMESTAMP(6)), NULL, 0, 'user');
/* SET IDENTITY_INSERT [dbo].[User] OFF */
 
/* SET IDENTITY_INSERT [dbo].[UserDetail] ON */ 

INSERT INTO UserDetail (Id, UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile, WhyIVolunteer, CountryId, CityId, Avilability, LinkdInUrl, MySkills, UserImage, CreatedDate, ModifiedDate, IsDeleted, Status) VALUES (1, 2, 'Atul', 'Vaghela', '123451', 'Superwiser', 'Test', 'HR', 'Test Profile', 'Test Volunteer', 5, 35, 'Block Availability', 'htttps://www.linkdin.com/abc-def', 'Computer Science,Office Management,Music Theory,Agronomy', 'UploadMissionImageUserImagevolunteer1_20221212103211.png', CAST('2022-12-12T10:32:24.7200000' AS TIMESTAMP(6)), CAST('2022-12-19T12:43:31.6800000' AS TIMESTAMP(6)), 1, 1);
INSERT INTO UserDetail (Id, UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile, WhyIVolunteer, CountryId, CityId, Avilability, LinkdInUrl, MySkills, UserImage, CreatedDate, ModifiedDate, IsDeleted, Status) VALUES (2, 3, 'Test', 'User', '123452', 'Superwiser', 'Test', 'HR', 'Test Profile', 'Test Volunteer', 5, 35, 'Block Availability', 'htttps://www.linkdin.com/abc-def', 'Data Entry,Office Management,Agronomy', 'UploadMissionImageUserImagevolunteer3_20221212130311.png', CAST('2022-12-12T12:58:19.9866667' AS TIMESTAMP(6)), CAST('2022-12-19T12:44:54.0700000' AS TIMESTAMP(6)), 0, 1);
INSERT INTO UserDetail (Id, UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile, WhyIVolunteer, CountryId, CityId, Avilability, LinkdInUrl, MySkills, UserImage, CreatedDate, ModifiedDate, IsDeleted, Status) VALUES (3, 4, 'evans', 'donohues', '123453', 'dfgd', 'dgd', 'Sales', 'dfgdfgs', 'ertres', 4, 32, 'Service Availability', 'dg', 'Anthropology,ComputerScience', 'UploadMissionImageUserImagevolunteer2_20221212130914.png', CAST('2022-12-12T13:09:30.7133333' AS TIMESTAMP(6)), CAST('2022-12-12T16:19:56.1466667' AS TIMESTAMP(6)), 1, 0);
INSERT INTO UserDetail (Id, UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile, WhyIVolunteer, CountryId, CityId, Avilability, LinkdInUrl, MySkills, UserImage, CreatedDate, ModifiedDate, IsDeleted, Status) VALUES (4, 5, 'Evan', 'Donohue', '123454', 'Manager', 'Demo', 'Sales', 'sdf', 'sdf', 4, 27, 'Standards Availability', 'sdf', 'Anthropology,Research,Administrative Support', 'UploadMissionImageUserImage10_20240501105319.jpeg', CAST('2022-12-12T18:34:30.3266667' AS TIMESTAMP(6)), CAST('2024-05-01T10:53:19.0266667' AS TIMESTAMP(6)), 0, 1);
INSERT INTO UserDetail (Id, UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile, WhyIVolunteer, CountryId, CityId, Avilability, LinkdInUrl, MySkills, UserImage, CreatedDate, ModifiedDate, IsDeleted, Status) VALUES (1003, 1008, 'Test', 'Two', '', 'Superwiser', 'Test', 'HR', 'Test Volunteer', 'Test Volunteer', 6, 46, 'Monthly', 'test', 'Computer Science', 'UploadMissionImageUserImagevolunteer5_20240311120643.png', CAST('2024-03-11T12:06:43.2333333' AS TIMESTAMP(6)), NULL, 1, 1);
INSERT INTO UserDetail (Id, UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile, WhyIVolunteer, CountryId, CityId, Avilability, LinkdInUrl, MySkills, UserImage, CreatedDate, ModifiedDate, IsDeleted, Status) VALUES (1004, 1009, 'Test', 'User', '254354', '', '', '', 'fhg', '', 6, 45, 'Monthly', 'cfc', 'Mathematics,Music Theory', 'UploadMissionImageUserImage10_20240425112609.jpeg', CAST('2024-04-25T11:26:09.9666667' AS TIMESTAMP(6)), NULL, 0, 1);
INSERT INTO UserDetail (Id, UserId, Name, Surname, EmployeeId, Manager, Title, Department, MyProfile, WhyIVolunteer, CountryId, CityId, Avilability, LinkdInUrl, MySkills, UserImage, CreatedDate, ModifiedDate, IsDeleted, Status) VALUES (1005, 1010, 'Sourabh', 'hjgvh', '254355', NULL, NULL, 'IT', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
/* SET IDENTITY_INSERT [dbo].[UserDetail] OFF */
 
/* SET IDENTITY_INSERT [dbo].[UserSkills] ON */ 

INSERT INTO UserSkills (Id, Skill, UserId, CreatedDate, ModifiedDate, IsDeleted) VALUES (1, 'Anthropology,Astronomy,Research,Data Entry,Administrative Support', 5, CAST('2022-12-16T11:53:49.7200000' AS TIMESTAMP(6)), CAST('2022-12-16T14:46:43.0333333' AS TIMESTAMP(6)), 0);
INSERT INTO UserSkills (Id, Skill, UserId, CreatedDate, ModifiedDate, IsDeleted) VALUES (2, 'Data Entry,Office Management,Music Theory,Agronomy,Mathematics,Customer Service,Program Management,Animal Care / Handling', 3, CAST('2022-12-16T12:34:22.8400000' AS TIMESTAMP(6)), CAST('2022-12-20T15:55:22.0700000' AS TIMESTAMP(6)), 0);
INSERT INTO UserSkills (Id, Skill, UserId, CreatedDate, ModifiedDate, IsDeleted) VALUES (3, 'Computer Science,Data Entry,Office Management,Music Theory,Customer Service,Agronomy', 2, CAST('2022-12-16T12:46:15.8400000' AS TIMESTAMP(6)), CAST('2022-12-16T12:59:35.2600000' AS TIMESTAMP(6)), 0);
INSERT INTO UserSkills (Id, Skill, UserId, CreatedDate, ModifiedDate, IsDeleted) VALUES (4, 'Computer Science,Data Entry,Office Management,Environmental Science,Office Reception,History,Astronomy,Anthropology', 1004, CAST('2022-12-19T10:30:37.7800000' AS TIMESTAMP(6)), CAST('2022-12-19T11:09:40.1100000' AS TIMESTAMP(6)), 0);
INSERT INTO UserSkills (Id, Skill, UserId, CreatedDate, ModifiedDate, IsDeleted) VALUES (5, 'Computer Science,Data Entry,Office Management,Mathematics', 1008, CAST('2024-03-11T12:04:55.4733333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO UserSkills (Id, Skill, UserId, CreatedDate, ModifiedDate, IsDeleted) VALUES (6, ',Mathematics,Music Theory', 1009, CAST('2024-04-25T11:24:19.4666667' AS TIMESTAMP(6)), CAST('2024-04-25T11:25:32.9233333' AS TIMESTAMP(6)), 0);
/* SET IDENTITY_INSERT [dbo].[UserSkills] OFF */
 
/* SET IDENTITY_INSERT [dbo].[VolunteeringGoals] ON */ 

INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (1, 3, 1, CAST('2022-12-14' AS Date), 1, CAST('2022-12-14T16:02:35.2800000' AS TIMESTAMP(6)), NULL, 0, 'Test');
INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (2, 3, 2, CAST('2022-12-15' AS Date), 0, CAST('2022-12-14T16:02:47.7566667' AS TIMESTAMP(6)), NULL, 0, 'Test1');
INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (3, 3, 3, CAST('2022-12-15' AS Date), 1, CAST('2022-12-14T16:03:00.4466667' AS TIMESTAMP(6)), NULL, 0, 'Test2');
INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (4, 5, 4, CAST('2022-12-16' AS Date), 1, CAST('2022-12-14T16:05:30.8233333' AS TIMESTAMP(6)), CAST('2022-12-14T16:05:38.2033333' AS TIMESTAMP(6)), 0, 'Test4');
INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (5, 5, 5, CAST('2022-12-17' AS Date), 0, CAST('2022-12-14T16:05:51.4200000' AS TIMESTAMP(6)), NULL, 0, 'Test5');
INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (6, 5, 6, CAST('2022-12-18' AS Date), 1, CAST('2022-12-14T16:06:06.1633333' AS TIMESTAMP(6)), NULL, 0, 'Test6');
INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (7, 3, 1, CAST('2024-03-04' AS Date), 0, CAST('2024-03-11T11:57:18.9866667' AS TIMESTAMP(6)), NULL, 0, 'test');
INSERT INTO VolunteeringGoals (Id, UserId, MissionId, Date, Action, CreatedDate, ModifiedDate, IsDeleted, Message) VALUES (8, 1008, 1, CAST('2024-03-01' AS Date), 1, CAST('2024-03-11T12:08:05.6466667' AS TIMESTAMP(6)), NULL, 0, 'test');
/* SET IDENTITY_INSERT [dbo].[VolunteeringGoals] OFF */
 
/* SET IDENTITY_INSERT [dbo].[VolunteeringHours] ON */ 

INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (1, 3, 1, CAST('2022-12-14' AS Date), '1', '60', 'Test', CAST('2022-12-14T16:01:08.7700000' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (2, 3, 2, CAST('2022-12-15' AS Date), '2', '120', 'Test1', CAST('2022-12-14T16:01:26.9000000' AS TIMESTAMP(6)), CAST('2022-12-16T17:32:20.5400000' AS TIMESTAMP(6)), 0);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (3, 3, 3, CAST('2022-12-15' AS Date), '3', '180', 'Test3', CAST('2022-12-14T16:02:08.9800000' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (4, 5, 4, CAST('2022-12-16' AS Date), '4', '240', 'Test4', CAST('2022-12-14T16:04:28.5933333' AS TIMESTAMP(6)), NULL, 1);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (5, 5, 5, CAST('2022-12-17' AS Date), '5', '30', 'Test5', CAST('2022-12-14T16:04:48.6866667' AS TIMESTAMP(6)), CAST('2024-03-21T14:26:35.3166667' AS TIMESTAMP(6)), 1);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (6, 5, 6, CAST('2022-12-18' AS Date), '6', '360', 'Test6', CAST('2022-12-14T16:05:10.1800000' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (7, 3, 4, CAST('2022-12-21' AS Date), '7', '420', 'Test7', CAST('2022-12-19T12:50:49.0800000' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (8, 5, 3, CAST('2024-03-13' AS Date), '4', '5', 'Test', CAST('2024-03-13T17:08:18.1733333' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (9, 5, 1, CAST('2024-03-20' AS Date), '50', '30', 'For Testing', CAST('2024-03-20T09:25:00.4700000' AS TIMESTAMP(6)), NULL, 0);
INSERT INTO VolunteeringHours (Id, UserId, MissionId, DateVolunteered, Hours, Minutes, Message, CreatedDate, ModifiedDate, IsDeleted) VALUES (10, 5, 11, CAST('2024-03-21' AS Date), '60', '26', 'test', CAST('2024-03-21T13:44:47.9000000' AS TIMESTAMP(6)), NULL, 0);
/* SET IDENTITY_INSERT [dbo].[VolunteeringHours] OFF */
 
ALTER TABLE MissionApplication ALTER COLUMN IsDeleted  SET DEFAULT (CAST((0) AS Boolean)) ;
 
ALTER TABLE MissionApplication ALTER COLUMN Sheet  SET DEFAULT ((0)) ;
 
ALTER TABLE MissionComment ALTER COLUMN IsDeleted  SET DEFAULT (CAST((0) AS Boolean)) ;
 
ALTER TABLE MissionFavourites ALTER COLUMN MissionId  SET DEFAULT ((0)) ;
 
ALTER TABLE MissionFavourites ALTER COLUMN UserId  SET DEFAULT ((0)) ;
 
ALTER TABLE MissionFavourites ALTER COLUMN IsDeleted  SET DEFAULT (CAST((0) AS Boolean)) ;
 
ALTER TABLE MissionSkill ALTER COLUMN IsDeleted  SET DEFAULT (CAST((0) AS Boolean)) ;
 
ALTER TABLE MissionTheme ALTER COLUMN IsDeleted  SET DEFAULT (CAST((0) AS Boolean)) ;
 
ALTER TABLE UserDetail ALTER COLUMN Status  SET DEFAULT (CAST((0) AS Boolean)) ;
 
