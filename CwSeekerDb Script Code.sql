USE [master]
GO
/****** Object:  Database [IEACvDb]    Script Date: 10.10.2023 19:17:28 ******/
CREATE DATABASE [IEACvDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cvProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cvProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cvProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cvProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [IEACvDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IEACvDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IEACvDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IEACvDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IEACvDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IEACvDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IEACvDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [IEACvDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IEACvDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IEACvDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IEACvDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IEACvDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IEACvDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IEACvDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IEACvDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IEACvDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IEACvDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IEACvDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IEACvDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IEACvDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IEACvDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IEACvDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IEACvDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IEACvDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IEACvDb] SET RECOVERY FULL 
GO
ALTER DATABASE [IEACvDb] SET  MULTI_USER 
GO
ALTER DATABASE [IEACvDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IEACvDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IEACvDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IEACvDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IEACvDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IEACvDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IEACvDb', N'ON'
GO
ALTER DATABASE [IEACvDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [IEACvDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [IEACvDb]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_User_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwShowUsers]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwShowUsers]
as
select * from Users
GO
/****** Object:  Table [dbo].[Cvs]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cvs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[NameLastName] [varchar](150) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[WebSite] [varchar](50) NULL,
	[Summary] [varchar](max) NULL,
	[About] [varchar](500) NULL,
	[City] [varchar](150) NULL,
	[Address] [varchar](150) NULL,
 CONSTRAINT [PK_Cvs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwShowCvs]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwShowCvs]
AS
SELECT 
    c.Id AS "#",
    u.UserName,
    u.Email AS UserEmail,
    c.Title,
    c.NameLastName,
    c.PhoneNumber,
    c.Email AS CvEmail,
    c.WebSite,
    c.Summary,
    c.About,
    c.City,
    c.Address
FROM Cvs c
LEFT JOIN Users u ON c.UserId = u.Id
GO
/****** Object:  Table [dbo].[SocialMedias]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialMedias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CvId] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Link] [varchar](350) NOT NULL,
 CONSTRAINT [PK_SocialMedias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwShowSocialMedias]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwShowSocialMedias]
AS
SELECT 
	s.Id #,
	c.Title,
	s.Name,
	s.Link
FROM SocialMedias s
LEFT JOIN Cvs c ON s.CvId = c.Id
GO
/****** Object:  Table [dbo].[Entrances]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrances](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Entrances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwShowEntrances]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwShowEntrances]
AS
SELECT 
	Id #,
	Name
FROM Entrances
GO
/****** Object:  Table [dbo].[Closings]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Closings](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Closings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motivations]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motivations](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Motivations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statussess]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statussess](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Statussess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoverLetters]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoverLetters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[NameLastName] [varchar](150) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[PhoneNumber] [varchar](150) NOT NULL,
	[Address] [varchar](500) NULL,
	[PostalCode] [varchar](10) NULL,
	[City] [varchar](150) NULL,
	[CustomProperty] [varchar](150) NULL,
	[Buyer] [varchar](max) NULL,
	[DatePost] [varchar](max) NULL,
	[EntranceId] [tinyint] NOT NULL,
	[StatusId] [tinyint] NOT NULL,
	[MotivationId] [tinyint] NOT NULL,
	[ClosingId] [tinyint] NOT NULL,
 CONSTRAINT [PK_CoverLetters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwShowCoverLetters]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwShowCoverLetters]
as
select 
	u.UserName UserName,
	u.Email UserEmail,
	cov.Mail,
	cov.PhoneNumber,
	cov.Address,
	cov.PostalCode,
	cov.City,
	cov.CustomProperty,
	cov.Buyer,
	cov.DatePost,
	e.Name Entrance,
	s.Name Status,
	m.Name Motivation,
	c.Name Closing
from CoverLetters cov
left join Users u on cov.UserId = u.Id
left join Entrances e on cov.EntranceId = e.Id
left join Statussess s on cov.StatusId = s.Id
left join Motivations m on cov.MotivationId = m.Id
left join Closings c on cov.ClosingId = c.Id
GO
/****** Object:  View [dbo].[vwShowStatussess]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwShowStatussess]
AS
SELECT 
	Id #,
	Name
FROM Statussess
GO
/****** Object:  View [dbo].[vwShowMotivations]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwShowMotivations]
AS
SELECT 
	Id #,
	Name
FROM Motivations
GO
/****** Object:  View [dbo].[vwShowClosings]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwShowClosings]
AS
SELECT 
	Id #,
	Name
FROM Closings
GO
/****** Object:  Table [dbo].[Resumes]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resumes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CvId] [int] NOT NULL,
	[CompanyName] [varchar](150) NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[Description] [varchar](500) NULL,
	[StartingDate] [datetime] NOT NULL,
	[EndingDate] [datetime] NULL,
 CONSTRAINT [PK_Resumes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwShowResumes]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwShowResumes]
as
select 
	r.Id #,
	c.Title CwTitle,
	r.CompanyName,
	r.Title ResumeTitle,
	r.Description,
	r.StartingDate,
	r.EndingDate
from Resumes r
left join Cvs c on r.CvId = c.Id
GO
ALTER TABLE [dbo].[CoverLetters]  WITH CHECK ADD  CONSTRAINT [FK_CoverLetters_Closings] FOREIGN KEY([ClosingId])
REFERENCES [dbo].[Closings] ([Id])
GO
ALTER TABLE [dbo].[CoverLetters] CHECK CONSTRAINT [FK_CoverLetters_Closings]
GO
ALTER TABLE [dbo].[CoverLetters]  WITH CHECK ADD  CONSTRAINT [FK_CoverLetters_Entrances] FOREIGN KEY([EntranceId])
REFERENCES [dbo].[Entrances] ([Id])
GO
ALTER TABLE [dbo].[CoverLetters] CHECK CONSTRAINT [FK_CoverLetters_Entrances]
GO
ALTER TABLE [dbo].[CoverLetters]  WITH CHECK ADD  CONSTRAINT [FK_CoverLetters_Motivations] FOREIGN KEY([MotivationId])
REFERENCES [dbo].[Motivations] ([Id])
GO
ALTER TABLE [dbo].[CoverLetters] CHECK CONSTRAINT [FK_CoverLetters_Motivations]
GO
ALTER TABLE [dbo].[CoverLetters]  WITH CHECK ADD  CONSTRAINT [FK_CoverLetters_Statussess] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statussess] ([Id])
GO
ALTER TABLE [dbo].[CoverLetters] CHECK CONSTRAINT [FK_CoverLetters_Statussess]
GO
ALTER TABLE [dbo].[CoverLetters]  WITH CHECK ADD  CONSTRAINT [FK_CoverLetters_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[CoverLetters] CHECK CONSTRAINT [FK_CoverLetters_Users]
GO
ALTER TABLE [dbo].[Cvs]  WITH CHECK ADD  CONSTRAINT [FK_Cvs_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Cvs] CHECK CONSTRAINT [FK_Cvs_Users]
GO
ALTER TABLE [dbo].[Resumes]  WITH CHECK ADD  CONSTRAINT [FK_Resumes_Cvs] FOREIGN KEY([CvId])
REFERENCES [dbo].[Cvs] ([Id])
GO
ALTER TABLE [dbo].[Resumes] CHECK CONSTRAINT [FK_Resumes_Cvs]
GO
ALTER TABLE [dbo].[SocialMedias]  WITH CHECK ADD  CONSTRAINT [FK_SocialMedias_Cvs] FOREIGN KEY([CvId])
REFERENCES [dbo].[Cvs] ([Id])
GO
ALTER TABLE [dbo].[SocialMedias] CHECK CONSTRAINT [FK_SocialMedias_Cvs]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteClosing]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteClosing]
    @Id tinyint
AS
BEGIN
    DELETE FROM Closings
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCoverLetter]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteCoverLetter]
    @Id int
AS
BEGIN
    DELETE FROM CoverLetters
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCv]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteCv]
    @Id int
AS
BEGIN
    DELETE FROM Cvs
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEntrance]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteEntrance]
    @Id tinyint
AS
BEGIN
    DELETE FROM Entrances
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMotivation]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteMotivation]
    @Id tinyint
AS
BEGIN
    DELETE FROM Motivations
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteResume]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteResume]
    @Id int
AS
BEGIN
    DELETE FROM Resumes
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSocialMedia]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteSocialMedia]
    @Id int
AS
BEGIN
    DELETE FROM SocialMedias
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStatussess]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteStatussess]
    @Id tinyint
AS
BEGIN
    DELETE FROM Statussess
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteUser]
    @Id uniqueidentifier
AS
BEGIN
    DELETE FROM Users
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertClosing]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertClosing]
    @Name varchar(255)
AS
BEGIN
    INSERT INTO Closings (Name)
    VALUES (@Name);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCoverLetter]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCoverLetter]
    @UserId uniqueidentifier,
    @NameLastName varchar(255),
    @Email varchar(255),
    @PhoneNumber varchar(20),
    @PostalCode varchar(10),
    @City varchar(255),
    @CustomProperty varchar(255),
    @Buyer varchar(255),
    @DatePost varchar(20),
    @EntranceId int,
    @StatusId int,
    @MotivationId int,
    @ClosingId int
AS
BEGIN
    INSERT INTO CoverLetters (UserId, NameLastName, Email, PhoneNumber, PostalCode, City, CustomProperty, Buyer, DatePost, EntranceId, StatusId, MotivationId, ClosingId)
    VALUES (@UserId, @NameLastName, @Email, @PhoneNumber, @PostalCode, @City, @CustomProperty, @Buyer, @DatePost, @EntranceId, @StatusId, @MotivationId, @ClosingId);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCv]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCv]
    @UserId uniqueidentifier,
    @Title varchar(255),
    @NameLastName varchar(255),
    @PhoneNumber varchar(20),
    @Email varchar(255),
    @WebSite varchar(255),
    @Summary varchar(1000),
    @About varchar(max),
    @City varchar(255),
    @Address varchar(255)
AS
BEGIN
    INSERT INTO Cvs (UserId, Title, NameLastName, PhoneNumber, Email, WebSite, Summary, About, City, Address)
    VALUES (@UserId, @Title, @NameLastName, @PhoneNumber, @Email, @WebSite, @Summary, @About, @City, @Address);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEntrance]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertEntrance]
    @Name varchar(255)
AS
BEGIN
    INSERT INTO Entrances (Name)
    VALUES (@Name);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertMotivation]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertMotivation]
    @Name varchar(255)
AS
BEGIN
    INSERT INTO Motivations (Name)
    VALUES (@Name);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertResume]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertResume]
    @CvId int,
    @CompanyName varchar(255),
    @Title varchar(255),
    @Description varchar(1000),
    @StartingDate datetime
AS
BEGIN
    INSERT INTO Resumes (CvId, CompanyName, Title, Description, StartingDate)
    VALUES (@CvId, @CompanyName, @Title, @Description, @StartingDate);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSocialMedia]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSocialMedia]
    @CvId int,
    @Name varchar(255),
    @Link varchar(255)
AS
BEGIN
    INSERT INTO SocialMedias (CvId, Name, Link)
    VALUES (@CvId, @Name, @Link);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStatussess]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertStatussess]
    @Name varchar(255)
AS
BEGIN
    INSERT INTO Statussess (Name)
    VALUES (@Name);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUser]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertUser]
    @UserName varchar(255),
    @Email varchar(255),
    @Password varchar(255),
	@Id uniqueidentifier
AS
BEGIN
	
	DECLARE @UserId Uniqueidentifier = NEWID();
    INSERT INTO Users (Id,UserName, Email, Password)
    VALUES (@Id,@UserName, @Email, @Password);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateClosing]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateClosing]
    @Id tinyint,
    @Name varchar(255)
AS
BEGIN
    UPDATE Closings
    SET
        Name = @Name
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCoverLetter]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCoverLetter]
    @Id int,
    @UserId uniqueidentifier,
    @NameLastName varchar(255),
    @Email varchar(255),
    @PhoneNumber varchar(20),
    @PostalCode varchar(10),
    @City varchar(255),
    @CustomProperty varchar(255),
    @Buyer varchar(255),
    @DatePost varchar(20),
    @EntranceId int,
    @StatusId int,
    @MotivationId int,
    @ClosingId int
AS
BEGIN
    UPDATE CoverLetters
    SET
        UserId = @UserId,
        NameLastName = @NameLastName,
        Email = @Email,
        PhoneNumber = @PhoneNumber,
        PostalCode = @PostalCode,
        City = @City,
        CustomProperty = @CustomProperty,
        Buyer = @Buyer,
        DatePost = @DatePost,
        EntranceId = @EntranceId,
        StatusId = @StatusId,
        MotivationId = @MotivationId,
        ClosingId = @ClosingId
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCv]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCv]
    @Id int,
    @UserId uniqueidentifier,
    @Title varchar(255),
    @NameLastName varchar(255),
    @PhoneNumber varchar(20),
    @Email varchar(255),
    @WebSite varchar(255),
    @Summary varchar(1000),
    @About varchar(max),
    @City varchar(255),
    @Address varchar(255)
AS
BEGIN
    UPDATE Cvs
    SET
        UserId = @UserId,
        Title = @Title,
        NameLastName = @NameLastName,
        PhoneNumber = @PhoneNumber,
        Email = @Email,
        WebSite = @WebSite,
        Summary = @Summary,
        About = @About,
        City = @City,
        Address = @Address
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEntrance]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateEntrance]
    @Id tinyint,
    @Name varchar(255)
AS
BEGIN
    UPDATE Entrances
    SET
        Name = @Name
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMotivation]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateMotivation]
    @Id tinyint,
    @Name varchar(255)
AS
BEGIN
    UPDATE Motivations
    SET
        Name = @Name
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateResume]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateResume]
    @Id int,
    @CompanyName varchar(255),
    @Title varchar(255),
    @Description varchar(1000),
    @EndingDate datetime
AS
BEGIN
    UPDATE Resumes
    SET
        CompanyName = @CompanyName,
        Title = @Title,
        Description = @Description,
        EndingDate = @EndingDate
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSocialMedia]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateSocialMedia]
    @Id int,
    @Name varchar(255),
    @Link varchar(255)
AS
BEGIN
    UPDATE SocialMedias
    SET
        Name = @Name,
        Link = @Link
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStatussess]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateStatussess]
    @Id tinyint,
    @Name varchar(255)
AS
BEGIN
    UPDATE Statussess
    SET
        Name = @Name
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 10.10.2023 19:17:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateUser]
    @Id uniqueidentifier,
    @UserName varchar(255),
    @Email varchar(255),
    @Password varchar(255)
AS
BEGIN
    UPDATE Users
    SET
        UserName = @UserName,
        Email = @Email,
        Password = @Password
    WHERE Id = @Id;
END;
GO
USE [master]
GO
ALTER DATABASE [IEACvDb] SET  READ_WRITE 
GO
