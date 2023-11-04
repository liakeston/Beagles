USE [master]
GO
/****** Object:  Database [BeagleRescue]    Script Date: 11/1/2023 1:34:48 PM ******/
CREATE DATABASE [BeagleRescue]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeagleRescue', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EX\MSSQL\DATA\BeagleRescue.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeagleRescue_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019EX\MSSQL\DATA\BeagleRescue_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BeagleRescue] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeagleRescue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeagleRescue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeagleRescue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeagleRescue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeagleRescue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeagleRescue] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeagleRescue] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeagleRescue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeagleRescue] SET AUTO_UPDATE_STATISTICS OFF 
GO
ALTER DATABASE [BeagleRescue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeagleRescue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeagleRescue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeagleRescue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeagleRescue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeagleRescue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeagleRescue] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeagleRescue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeagleRescue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeagleRescue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeagleRescue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeagleRescue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeagleRescue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeagleRescue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeagleRescue] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BeagleRescue] SET  MULTI_USER 
GO
ALTER DATABASE [BeagleRescue] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [BeagleRescue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeagleRescue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeagleRescue] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeagleRescue] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeagleRescue] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BeagleRescue] SET QUERY_STORE = OFF
GO
USE [BeagleRescue]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/1/2023 1:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](20) NULL,
	[AddressCity] [nvarchar](20) NULL,
	[AddressState] [nvarchar](2) NULL,
	[AddressZipcode] [nvarchar](20) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/1/2023 1:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adoption]    Script Date: 11/1/2023 1:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adoption](
	[AdoptionID] [int] IDENTITY(1,1) NOT NULL,
	[AdoptionApplication] [varbinary](max) NULL,
	[UserID] [int] NULL,
	[DogID] [int] NULL,
	[ListingID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dog]    Script Date: 11/1/2023 1:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dog](
	[DogID] [int] IDENTITY(1,1) NOT NULL,
	[DogName] [nvarchar](50) NOT NULL,
	[DogDescription] [nvarchar](200) NULL,
	[DogPhoto] [varbinary](max) NULL,
	[DogAge] [int] NULL,
	[DogGender] [char](1) NULL,
	[IsFostered] [char](1) NULL,
	[IsSpay/Neuter] [char](1) NULL,
	[IsVaccinated] [char](1) NULL,
	[IsMicrochipped] [char](1) NULL,
	[DogEntryDate] [datetime] NULL,
	[UserID] [int] NULL,
	[ListingID] [int] NULL,
 CONSTRAINT [PK_Dog] PRIMARY KEY CLUSTERED 
(
	[DogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foster]    Script Date: 11/1/2023 1:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foster](
	[FosterID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FosterApplication] [varbinary](max) NULL,
 CONSTRAINT [PK_Foster] PRIMARY KEY CLUSTERED 
(
	[FosterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listing]    Script Date: 11/1/2023 1:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listing](
	[ListingID] [int] IDENTITY(1,1) NOT NULL,
	[AdoptionFee] [decimal](18, 0) NULL,
	[AdoptionDate] [datetime] NOT NULL,
	[AdminID] [int] NULL,
	[DogID] [int] NULL,
 CONSTRAINT [PK_Listing] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/1/2023 1:34:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserFIrstName] [nvarchar](50) NULL,
	[UserLastName] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserContactNumber] [nvarchar](15) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_User]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [FK_Adoption_Dog] FOREIGN KEY([DogID])
REFERENCES [dbo].[Dog] ([DogID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [FK_Adoption_Dog]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [FK_Adoption_Listing] FOREIGN KEY([ListingID])
REFERENCES [dbo].[Listing] ([ListingID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [FK_Adoption_Listing]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [FK_Adoption_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [FK_Adoption_User]
GO
ALTER TABLE [dbo].[Dog]  WITH CHECK ADD  CONSTRAINT [FK_Dog_Listing] FOREIGN KEY([ListingID])
REFERENCES [dbo].[Listing] ([ListingID])
GO
ALTER TABLE [dbo].[Dog] CHECK CONSTRAINT [FK_Dog_Listing]
GO
ALTER TABLE [dbo].[Dog]  WITH CHECK ADD  CONSTRAINT [FK_Dog_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Dog] CHECK CONSTRAINT [FK_Dog_User]
GO
ALTER TABLE [dbo].[Foster]  WITH CHECK ADD  CONSTRAINT [FK_Foster_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Foster] CHECK CONSTRAINT [FK_Foster_User]
GO
ALTER TABLE [dbo].[Listing]  WITH CHECK ADD  CONSTRAINT [FK_Listing_Admin] FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Listing] CHECK CONSTRAINT [FK_Listing_Admin]
GO
ALTER TABLE [dbo].[Listing]  WITH CHECK ADD  CONSTRAINT [FK_Listing_Dog] FOREIGN KEY([DogID])
REFERENCES [dbo].[Dog] ([DogID])
GO
ALTER TABLE [dbo].[Listing] CHECK CONSTRAINT [FK_Listing_Dog]
GO
USE [master]
GO
ALTER DATABASE [BeagleRescue] SET  READ_WRITE 
GO
