USE [master]
GO
/****** Object:  Database [WardrobeDB]    Script Date: 5/17/2017 5:22:26 AM ******/
CREATE DATABASE [WardrobeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WardrobeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WardrobeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WardrobeDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WardrobeDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WardrobeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WardrobeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WardrobeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WardrobeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WardrobeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WardrobeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WardrobeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WardrobeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WardrobeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WardrobeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WardrobeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WardrobeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WardrobeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WardrobeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WardrobeDB] SET  MULTI_USER 
GO
ALTER DATABASE [WardrobeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WardrobeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WardrobeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WardrobeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WardrobeDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WardrobeDB]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 5/17/2017 5:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleName] [nvarchar](50) NOT NULL,
	[ArticleImage] [nvarchar](150) NULL,
	[ArticleType] [nvarchar](50) NOT NULL,
	[ClothingTypeID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClothingTypes]    Script Date: 5/17/2017 5:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClothingTypes](
	[ClothingTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ClothingType] [nvarchar](20) NULL,
 CONSTRAINT [PK_ClothingTypes] PRIMARY KEY CLUSTERED 
(
	[ClothingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colors]    Script Date: 5/17/2017 5:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occasions]    Script Date: 5/17/2017 5:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasions](
	[OccasionID] [int] IDENTITY(1,1) NOT NULL,
	[OccasionType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Occasions] PRIMARY KEY CLUSTERED 
(
	[OccasionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 5/17/2017 5:22:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seasons](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[SeasonType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Seasons] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (1, N'Long-sleeve Boater Shirt', N'~/Content/AudreyCasualWhiteShirt.jpg', N'Shirt', 1, 3, 2, 1)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (2, N'Comfortable Knit Sweater', N'~/Content/AudreyCasualGraySweater.jpg', N'Sweater', 1, 3, 1, 6)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (3, N'Button-down Dress Shirt', N'~/Content/AudreyBusinessWhiteShirt.jpg', N'Shirt', 1, 2, 3, 1)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (4, N'Chic Dress Top', N'~/Content/AudreyFormalWhiteShirt.jpg', N'Shirt', 1, 1, 4, 1)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (5, N'Classic Black Capri Pants', N'~/Content/AudreyBusinessBlackPants.jpg', N'Pants', 2, 2, 2, 2)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (6, N'Checkered Capri Pants', N'~/Content/AudreyCasualBluePants.jpg', N'Pants', 2, 3, 2, 4)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (7, N'Classic Sun Shorts', N'~/Content/AudreyCasualWhiteShorts.jpg', N'Shorts', 2, 3, 3, 1)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (8, N'Vintage Givenchy Suit Dress', N'~/Content/AudreyFormalGreenSuit.jpg', N'Suit Dress', 5, 1, 2, 5)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (9, N'Classic Dress Pants', N'~/Content/AudreyFormalBlackPants.jpg', N'Dress Pants', 2, 1, 4, 2)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (10, N'Audrey Style Crystal Pumps', N'~/Content/AudreysCrystalPumps.jpg', N'Pumps', 3, 3, 4, 2)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (11, N'Audrey Style Red Heels', N'~/Content/AudreysRedHeels.jpg', N'High Heels', 3, 2, 1, 3)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (12, N'Audrey Style Metallic Strappy Sandals', N'~/Content/AudreysStrappySandals.jpg', N'Sandals', 3, 3, 3, 1)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (13, N'Audrey Style Formal Heels', N'~/Content/AudreysWhiteFormalShoes.jpg', N'Formal Shoes', 3, 1, 3, 1)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (14, N'Iconic Royal Ascot Dress', N'~/Content/AudreyWhiteAscotDress.jpg', N'Designer Dress', 5, 1, 3, 1)
INSERT [dbo].[Articles] ([ArticleID], [ArticleName], [ArticleImage], [ArticleType], [ClothingTypeID], [OccasionID], [SeasonID], [ColorID]) VALUES (15, N'Little Black Dress', N'~/Content/AudreyBlackTiffanyDress.jpg', N'Satin Evening Gown', 5, 1, 4, 2)
SET IDENTITY_INSERT [dbo].[Articles] OFF
SET IDENTITY_INSERT [dbo].[ClothingTypes] ON 

INSERT [dbo].[ClothingTypes] ([ClothingTypeID], [ClothingType]) VALUES (1, N'Tops')
INSERT [dbo].[ClothingTypes] ([ClothingTypeID], [ClothingType]) VALUES (2, N'Bottoms')
INSERT [dbo].[ClothingTypes] ([ClothingTypeID], [ClothingType]) VALUES (3, N'Shoes')
INSERT [dbo].[ClothingTypes] ([ClothingTypeID], [ClothingType]) VALUES (4, N'Accessories')
INSERT [dbo].[ClothingTypes] ([ClothingTypeID], [ClothingType]) VALUES (5, N'Dresses')
SET IDENTITY_INSERT [dbo].[ClothingTypes] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorID], [ColorType]) VALUES (1, N'White')
INSERT [dbo].[Colors] ([ColorID], [ColorType]) VALUES (2, N'Black')
INSERT [dbo].[Colors] ([ColorID], [ColorType]) VALUES (3, N'Red')
INSERT [dbo].[Colors] ([ColorID], [ColorType]) VALUES (4, N'Blue')
INSERT [dbo].[Colors] ([ColorID], [ColorType]) VALUES (5, N'Green')
INSERT [dbo].[Colors] ([ColorID], [ColorType]) VALUES (6, N'Gray')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Occasions] ON 

INSERT [dbo].[Occasions] ([OccasionID], [OccasionType]) VALUES (1, N'Formal')
INSERT [dbo].[Occasions] ([OccasionID], [OccasionType]) VALUES (2, N'Business')
INSERT [dbo].[Occasions] ([OccasionID], [OccasionType]) VALUES (3, N'Casual')
SET IDENTITY_INSERT [dbo].[Occasions] OFF
SET IDENTITY_INSERT [dbo].[Seasons] ON 

INSERT [dbo].[Seasons] ([SeasonID], [SeasonType]) VALUES (1, N'Winter')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonType]) VALUES (2, N'Spring')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonType]) VALUES (3, N'Summer')
INSERT [dbo].[Seasons] ([SeasonID], [SeasonType]) VALUES (4, N'Fall')
SET IDENTITY_INSERT [dbo].[Seasons] OFF
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_ClothingTypes] FOREIGN KEY([ClothingTypeID])
REFERENCES [dbo].[ClothingTypes] ([ClothingTypeID])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_ClothingTypes]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Colors] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Colors] ([ColorID])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Colors]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Occasions]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Seasons]
GO
USE [master]
GO
ALTER DATABASE [WardrobeDB] SET  READ_WRITE 
GO
