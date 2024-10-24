USE [master]
GO
/****** Object:  Database [Group3_iCARECB]    Script Date: 10/22/2024 5:28:42 PM ******/
CREATE DATABASE [Group3_iCARECB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Group3_iCARECB', FILENAME = N'C:\Users\etwil\Group3_iCARECB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Group3_iCARECB_log', FILENAME = N'C:\Users\etwil\Group3_iCARECB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Group3_iCARECB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Group3_iCARECB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Group3_iCARECB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Group3_iCARECB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Group3_iCARECB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Group3_iCARECB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Group3_iCARECB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Group3_iCARECB] SET  MULTI_USER 
GO
ALTER DATABASE [Group3_iCARECB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Group3_iCARECB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Group3_iCARECB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Group3_iCARECB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Group3_iCARECB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Group3_iCARECB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Group3_iCARECB] SET QUERY_STORE = OFF
GO
USE [Group3_iCARECB]
GO
/****** Object:  Table [dbo].[DocumentMetadata]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentMetadata](
	[DocumentID] [uniqueidentifier] NOT NULL,
	[DocumentName] [nchar](10) NULL,
	[CreationDate] [date] NULL,
	[PatientID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_DocumentMetadata] PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugsDictionary]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugsDictionary](
	[DrugID] [uniqueidentifier] NOT NULL,
	[ExternalDrugID] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_DrugsDictionary] PRIMARY KEY CLUSTERED 
(
	[DrugID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GeoCodes]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeoCodes](
	[GeoCodeID] [int] NOT NULL,
	[Building] [nchar](10) NULL,
	[Floor] [nchar](10) NULL,
	[RoomNo] [nchar](10) NULL,
	[Bed] [nchar](10) NULL,
	[PatientID] [int] NULL,
 CONSTRAINT [PK_GeoCodes] PRIMARY KEY CLUSTERED 
(
	[GeoCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iCareAdmin]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iCareAdmin](
	[UserID] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_iCareAdmin] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iCareUser]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iCareUser](
	[UserID] [int] NOT NULL,
	[Username] [nchar](10) NOT NULL,
	[PermissionID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_iCareUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_iCareUser] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iCareWorker]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iCareWorker](
	[UserID] [int] NOT NULL,
	[Profession] [nchar](10) NULL,
	[Type] [nchar](10) NULL,
 CONSTRAINT [PK_iCareWorker] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModificationHistory]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModificationHistory](
	[ModificationID] [uniqueidentifier] NOT NULL,
	[DocumentID] [uniqueidentifier] NOT NULL,
	[ModificationDate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ModificationHistory] PRIMARY KEY CLUSTERED 
(
	[ModificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientRecord]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientRecord](
	[PatientID] [int] NOT NULL,
	[Fname] [nchar](10) NULL,
	[Lname] [nchar](10) NULL,
	[Address] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
 CONSTRAINT [PK_PatientRecord] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TreatmentRecord]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreatmentRecord](
	[AssignmentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_TreatmentRecord] PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPassword]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPassword](
	[UserID] [int] NOT NULL,
	[EncryptedPassword] [char](10) NOT NULL,
	[ExpirationDate] [date] NULL,
	[LastChanged] [date] NULL,
 CONSTRAINT [PK_UserPassword] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/22/2024 5:28:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[PermissionName] [nchar](10) NOT NULL,
	[PermissionID] [uniqueidentifier] NOT NULL,
	[SystemAdmin] [bit] NULL,
	[Doctor] [bit] NULL,
	[Nurse] [bit] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentMetadata]  WITH CHECK ADD  CONSTRAINT [FK_DocumentMetadata_iCareUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[iCareUser] ([UserID])
GO
ALTER TABLE [dbo].[DocumentMetadata] CHECK CONSTRAINT [FK_DocumentMetadata_iCareUser]
GO
ALTER TABLE [dbo].[DocumentMetadata]  WITH CHECK ADD  CONSTRAINT [FK_DocumentMetadata_PatientRecord] FOREIGN KEY([PatientID])
REFERENCES [dbo].[PatientRecord] ([PatientID])
GO
ALTER TABLE [dbo].[DocumentMetadata] CHECK CONSTRAINT [FK_DocumentMetadata_PatientRecord]
GO
ALTER TABLE [dbo].[GeoCodes]  WITH CHECK ADD  CONSTRAINT [FK_GeoCodes_PatientRecord] FOREIGN KEY([PatientID])
REFERENCES [dbo].[PatientRecord] ([PatientID])
GO
ALTER TABLE [dbo].[GeoCodes] CHECK CONSTRAINT [FK_GeoCodes_PatientRecord]
GO
ALTER TABLE [dbo].[iCareAdmin]  WITH CHECK ADD  CONSTRAINT [FK_iCareAdmin_iCareUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[iCareUser] ([UserID])
GO
ALTER TABLE [dbo].[iCareAdmin] CHECK CONSTRAINT [FK_iCareAdmin_iCareUser]
GO
ALTER TABLE [dbo].[iCareUser]  WITH CHECK ADD  CONSTRAINT [FK_iCareUser_UserRole] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[UserRole] ([PermissionID])
GO
ALTER TABLE [dbo].[iCareUser] CHECK CONSTRAINT [FK_iCareUser_UserRole]
GO
ALTER TABLE [dbo].[iCareWorker]  WITH CHECK ADD  CONSTRAINT [FK_iCareWorker_iCareUser1] FOREIGN KEY([UserID])
REFERENCES [dbo].[iCareUser] ([UserID])
GO
ALTER TABLE [dbo].[iCareWorker] CHECK CONSTRAINT [FK_iCareWorker_iCareUser1]
GO
ALTER TABLE [dbo].[ModificationHistory]  WITH CHECK ADD  CONSTRAINT [FK_ModificationHistory_DocumentMetadata] FOREIGN KEY([DocumentID])
REFERENCES [dbo].[DocumentMetadata] ([DocumentID])
GO
ALTER TABLE [dbo].[ModificationHistory] CHECK CONSTRAINT [FK_ModificationHistory_DocumentMetadata]
GO
ALTER TABLE [dbo].[ModificationHistory]  WITH CHECK ADD  CONSTRAINT [FK_ModificationHistory_iCareUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[iCareUser] ([UserID])
GO
ALTER TABLE [dbo].[ModificationHistory] CHECK CONSTRAINT [FK_ModificationHistory_iCareUser]
GO
ALTER TABLE [dbo].[TreatmentRecord]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentRecord_iCareUser] FOREIGN KEY([PatientID])
REFERENCES [dbo].[PatientRecord] ([PatientID])
GO
ALTER TABLE [dbo].[TreatmentRecord] CHECK CONSTRAINT [FK_TreatmentRecord_iCareUser]
GO
ALTER TABLE [dbo].[UserPassword]  WITH CHECK ADD  CONSTRAINT [FK_UserPassword_iCareUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[iCareUser] ([UserID])
GO
ALTER TABLE [dbo].[UserPassword] CHECK CONSTRAINT [FK_UserPassword_iCareUser]
GO
USE [master]
GO
ALTER DATABASE [Group3_iCARECB] SET  READ_WRITE 
GO
