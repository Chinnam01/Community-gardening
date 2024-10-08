USE [master]
GO
/****** Object:  Database [XCommunityProj2]    Script Date: 3/13/2022 10:51:53 AM ******/
CREATE DATABASE [XCommunityProj2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XCommunityProj2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\XCommunityProj2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XCommunityProj2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\XCommunityProj2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [XCommunityProj2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XCommunityProj2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XCommunityProj2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XCommunityProj2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XCommunityProj2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XCommunityProj2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XCommunityProj2] SET ARITHABORT OFF 
GO
ALTER DATABASE [XCommunityProj2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XCommunityProj2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XCommunityProj2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XCommunityProj2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XCommunityProj2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XCommunityProj2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XCommunityProj2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XCommunityProj2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XCommunityProj2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XCommunityProj2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XCommunityProj2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XCommunityProj2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XCommunityProj2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XCommunityProj2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XCommunityProj2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XCommunityProj2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XCommunityProj2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XCommunityProj2] SET RECOVERY FULL 
GO
ALTER DATABASE [XCommunityProj2] SET  MULTI_USER 
GO
ALTER DATABASE [XCommunityProj2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XCommunityProj2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XCommunityProj2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XCommunityProj2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XCommunityProj2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [XCommunityProj2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'XCommunityProj2', N'ON'
GO
ALTER DATABASE [XCommunityProj2] SET QUERY_STORE = OFF
GO
USE [XCommunityProj2]
GO
/****** Object:  UserDefinedFunction [dbo].[Function1]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Function1] (@ColumnName int, @Percent int)
RETURNS INT AS
BEGIN 
			RETURN @ColumnName + (@ColumnName*@Percent)/100
END
GO
/****** Object:  Table [dbo].[Lands]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lands](
	[LandID] [int] NOT NULL,
	[LandSizeHec] [int] NULL,
	[LandType] [varchar](50) NULL,
	[LandOwner] [varchar](50) NULL,
	[LandContact] [int] NULL,
	[LandLocation] [varchar](50) NULL,
 CONSTRAINT [PK_Lands] PRIMARY KEY CLUSTERED 
(
	[LandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConnectionRegistry]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConnectionRegistry](
	[ConnectionID] [int] NOT NULL,
	[ConncectedDate] [date] NULL,
	[LandID] [int] NULL,
	[ResidentID] [int] NULL,
	[VolunteerID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_ConnectionRegistry] PRIMARY KEY CLUSTERED 
(
	[ConnectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductDescription] [varchar](50) NULL,
	[FruitID] [int] NULL,
	[VegitableID] [int] NULL,
	[NutritionID] [int] NULL,
	[UOM] [varchar](50) NULL,
	[WeightKG] [int] NULL,
	[AVGCost] [int] NULL,
 CONSTRAINT [PK_ProductMix] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailySales]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailySales](
	[SalesID] [int] NOT NULL,
	[SalesDate] [date] NULL,
	[ConnectionID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[SellingUnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
 CONSTRAINT [PK_DailySales] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProfitProductPerLand]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProfitProductPerLand] AS

SELECT 
	A.SalesDate,A.ProductID,
	C.ProductDescription, B.LandID,
	D.LandLocation,
	A.Quantity*A.SellingUnitPrice - A.Quantity*C.AVGCost AS Profit 
FROM [dbo].[DailySales] AS A
INNER JOIN [dbo].[Products] AS C ON A.ProductID = C.ProductID
INNER JOIN  [dbo].[ConnectionRegistry] AS B ON A.ConnectionID = B.ConnectionID
INNER JOIN  [dbo].[Lands] AS D ON B.LandID = D.LandID
GO
/****** Object:  View [dbo].[HIGHSALES]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HIGHSALES] AS
	SELECT [ProductID], SUM([TotalPrice]) AS [PRODUCT TOTAL]
	FROM [dbo].[DailySales]
	GROUP BY [ProductID]
GO
/****** Object:  View [dbo].[ProfitCalculation]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProfitCalculation] AS

SELECT 
	D.ProductID,B.ProductDescription, 
	D.Quantity,D.SellingUnitPrice, 
	B.AVGCost, 
	D.Quantity*D.SellingUnitPrice - D.Quantity*B.AVGCost AS Profit 
FROM [dbo].[DailySales] AS D
INNER JOIN [dbo].[Products] AS B ON D.ProductID = B.ProductID
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] NOT NULL,
	[EquipmentName] [varchar](50) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquipmentRegistry]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentRegistry](
	[EquipmentRegID] [int] NOT NULL,
	[EquipmentID] [int] NULL,
	[EquipmentQuantity] [int] NULL,
	[PurchaseDate] [date] NULL,
	[LandID] [int] NULL,
 CONSTRAINT [PK_EquipmentRegistry] PRIMARY KEY CLUSTERED 
(
	[EquipmentRegID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FertilizerRegistry]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FertilizerRegistry](
	[FertilizerRegID] [int] NOT NULL,
	[FetilizerID] [int] NULL,
	[FertilizerQuantity] [int] NULL,
	[PurchasedDate] [date] NULL,
	[LandID] [int] NULL,
 CONSTRAINT [PK_FertilizerRegistry] PRIMARY KEY CLUSTERED 
(
	[FertilizerRegID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fertilizers]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fertilizers](
	[FertilizerID] [int] NOT NULL,
	[FertilizerName] [varchar](50) NULL,
 CONSTRAINT [PK_Fertilizers] PRIMARY KEY CLUSTERED 
(
	[FertilizerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fruits]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fruits](
	[FruitID] [int] NOT NULL,
	[FruitName] [varchar](50) NULL,
 CONSTRAINT [PK_Fruit] PRIMARY KEY CLUSTERED 
(
	[FruitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NutritionType]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NutritionType](
	[NutritionID] [int] NOT NULL,
	[NutritionDescription] [varchar](50) NULL,
 CONSTRAINT [PK_NutritionType] PRIMARY KEY CLUSTERED 
(
	[NutritionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Residents]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Residents](
	[ResidentID] [int] NOT NULL,
	[ResidentName] [varchar](50) NULL,
	[ResidentAge] [int] NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
 CONSTRAINT [PK_Residents] PRIMARY KEY CLUSTERED 
(
	[ResidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vegitables]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vegitables](
	[VegitableID] [int] NOT NULL,
	[VegitableName] [varchar](150) NULL,
 CONSTRAINT [PK_Vegitables] PRIMARY KEY CLUSTERED 
(
	[VegitableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteers]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteers](
	[VolunteerID] [int] NOT NULL,
	[VolunteerName] [varchar](50) NULL,
	[VolunteerAge] [int] NULL,
	[VolunteerAddress] [varchar](50) NULL,
	[VolunteerCity] [varchar](50) NULL,
 CONSTRAINT [PK_Volunteers] PRIMARY KEY CLUSTERED 
(
	[VolunteerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40001, CAST(N'2021-10-30' AS Date), 30004, 10014, 20010, 70019)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40002, CAST(N'2021-01-31' AS Date), 30002, 10009, 20005, 70003)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40003, CAST(N'2021-03-01' AS Date), 30007, 10015, 20006, 70018)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40004, CAST(N'2020-06-02' AS Date), 30009, 10025, 20008, 70012)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40005, CAST(N'2020-04-03' AS Date), 30006, 10016, 20001, 70001)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40006, CAST(N'2020-12-04' AS Date), 30004, 10024, 20002, 70015)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40007, CAST(N'2021-05-05' AS Date), 30003, 10002, 20008, 70014)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40008, CAST(N'2021-07-06' AS Date), 30006, 10014, 20001, 70019)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40009, CAST(N'2021-02-07' AS Date), 30003, 10024, 20006, 70011)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40010, CAST(N'2021-01-08' AS Date), 30008, 10016, 20004, 70013)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40011, CAST(N'2021-05-09' AS Date), 30006, 10014, 20003, 70011)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40012, CAST(N'2021-06-10' AS Date), 30004, 10006, 20008, 70020)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40013, CAST(N'2021-10-11' AS Date), 30004, 10012, 20006, 70003)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40014, CAST(N'2021-09-12' AS Date), 30005, 10009, 20003, 70006)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40015, CAST(N'2021-06-13' AS Date), 30003, 10009, 20004, 70007)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40016, CAST(N'2021-07-14' AS Date), 30006, 10014, 20003, 70011)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40017, CAST(N'2021-04-15' AS Date), 30008, 10012, 20003, 70005)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40018, CAST(N'2021-06-16' AS Date), 30006, 10011, 20006, 70008)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40019, CAST(N'2021-05-17' AS Date), 30001, 10010, 20007, 70003)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40020, CAST(N'2021-08-18' AS Date), 30009, 10011, 20010, 70013)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40021, CAST(N'2021-08-19' AS Date), 30001, 10007, 20006, 70010)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40022, CAST(N'2021-05-20' AS Date), 30007, 10006, 20001, 70010)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40023, CAST(N'2021-01-21' AS Date), 30007, 10009, 20009, 70014)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40024, CAST(N'2021-09-22' AS Date), 30001, 10004, 20004, 70018)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40025, CAST(N'2021-11-23' AS Date), 30003, 10015, 20007, 70001)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40026, CAST(N'2021-05-24' AS Date), 30009, 10002, 20010, 70007)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40027, CAST(N'2021-07-25' AS Date), 30009, 10007, 20008, 70009)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40028, CAST(N'2021-04-26' AS Date), 30001, 10005, 20008, 70013)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40029, CAST(N'2021-08-27' AS Date), 30003, 10017, 20010, 70003)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40030, CAST(N'2021-06-28' AS Date), 30001, 10008, 20005, 70019)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40031, CAST(N'2021-02-01' AS Date), 30001, 10019, 20002, 70009)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40032, CAST(N'2021-01-02' AS Date), 30006, 10012, 20003, 70013)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40033, CAST(N'2021-07-03' AS Date), 30005, 10007, 20001, 70009)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40034, CAST(N'2021-07-04' AS Date), 30001, 10008, 20002, 70016)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40035, CAST(N'2021-06-05' AS Date), 30010, 10005, 20004, 70010)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40036, CAST(N'2021-07-06' AS Date), 30010, 10009, 20006, 70011)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40037, CAST(N'2021-06-07' AS Date), 30010, 10009, 20001, 70001)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40038, CAST(N'2021-04-08' AS Date), 30004, 10024, 20001, 70005)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40039, CAST(N'2021-06-09' AS Date), 30002, 10019, 20003, 70005)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40040, CAST(N'2021-03-10' AS Date), 30009, 10024, 20004, 70019)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40041, CAST(N'2021-06-11' AS Date), 30006, 10015, 20007, 70002)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40042, CAST(N'2021-06-12' AS Date), 30004, 10014, 20004, 70014)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40043, CAST(N'2021-09-13' AS Date), 30002, 10023, 20002, 70003)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40044, CAST(N'2021-02-14' AS Date), 30002, 10023, 20009, 70017)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40045, CAST(N'2021-06-15' AS Date), 30004, 10004, 20004, 70014)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40046, CAST(N'2021-04-16' AS Date), 30008, 10006, 20004, 70015)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40047, CAST(N'2021-09-17' AS Date), 30002, 10001, 20006, 70010)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40048, CAST(N'2021-04-18' AS Date), 30001, 10011, 20001, 70006)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40049, CAST(N'2021-08-19' AS Date), 30003, 10001, 20006, 70001)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40050, CAST(N'2021-07-20' AS Date), 30004, 10001, 20006, 70011)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40051, CAST(N'2021-11-21' AS Date), 30005, 10024, 20006, 70016)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40052, CAST(N'2021-12-22' AS Date), 30001, 10015, 20002, 70019)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40053, CAST(N'2021-05-23' AS Date), 30010, 10019, 20004, 70019)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40054, CAST(N'2021-03-24' AS Date), 30008, 10007, 20007, 70009)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40055, CAST(N'2021-07-25' AS Date), 30005, 10018, 20001, 70008)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40056, CAST(N'2021-06-26' AS Date), 30004, 10019, 20010, 70005)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40057, CAST(N'2021-06-27' AS Date), 30006, 10003, 20009, 70007)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40058, CAST(N'2021-06-28' AS Date), 30009, 10025, 20008, 70011)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40059, CAST(N'2021-07-29' AS Date), 30006, 10009, 20008, 70012)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40060, CAST(N'2021-01-30' AS Date), 30003, 10002, 20009, 70019)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40061, CAST(N'2021-05-31' AS Date), 30001, 10011, 20002, 70011)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40062, CAST(N'2021-06-01' AS Date), 30004, 10019, 20004, 70002)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40063, CAST(N'2021-07-02' AS Date), 30001, 10001, 20001, 70020)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40064, CAST(N'2021-08-03' AS Date), 30008, 10024, 20001, 70009)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40065, CAST(N'2021-09-04' AS Date), 30003, 10001, 20006, 70003)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40066, CAST(N'2021-01-05' AS Date), 30006, 10019, 20007, 70014)
INSERT [dbo].[ConnectionRegistry] ([ConnectionID], [ConncectedDate], [LandID], [ResidentID], [VolunteerID], [ProductID]) VALUES (40067, CAST(N'2021-09-06' AS Date), 30006, 10001, 20006, 70018)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71001, CAST(N'2022-02-12' AS Date), 40001, 70019, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71002, CAST(N'2022-02-03' AS Date), 40002, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71003, CAST(N'2022-02-02' AS Date), 40003, 70018, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71004, CAST(N'2022-01-24' AS Date), 40004, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71005, CAST(N'2022-01-12' AS Date), 40005, 70001, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71006, CAST(N'2022-01-02' AS Date), 40006, 70015, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71007, CAST(N'2022-02-24' AS Date), 40007, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71008, CAST(N'2022-01-09' AS Date), 40008, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71009, CAST(N'2022-01-01' AS Date), 40009, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71010, CAST(N'2022-01-18' AS Date), 40010, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71011, CAST(N'2022-01-26' AS Date), 40011, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71012, CAST(N'2022-01-12' AS Date), 40012, 70020, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71013, CAST(N'2022-02-24' AS Date), 40013, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71014, CAST(N'2022-03-05' AS Date), 40014, 70006, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71015, CAST(N'2022-03-03' AS Date), 40015, 70007, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71016, CAST(N'2022-02-02' AS Date), 40016, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71017, CAST(N'2022-02-08' AS Date), 40017, 70005, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71018, CAST(N'2022-01-26' AS Date), 40018, 70008, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71019, CAST(N'2022-01-01' AS Date), 40019, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71020, CAST(N'2022-02-05' AS Date), 40020, 70013, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71021, CAST(N'2022-01-07' AS Date), 40021, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71022, CAST(N'2022-03-06' AS Date), 40022, 70010, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71023, CAST(N'2022-02-02' AS Date), 40023, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71024, CAST(N'2022-01-04' AS Date), 40024, 70018, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71025, CAST(N'2022-03-03' AS Date), 40025, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71026, CAST(N'2022-01-31' AS Date), 40026, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71027, CAST(N'2022-02-19' AS Date), 40027, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71028, CAST(N'2022-03-10' AS Date), 40028, 70013, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71029, CAST(N'2022-01-02' AS Date), 40029, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71030, CAST(N'2022-01-15' AS Date), 40030, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71031, CAST(N'2022-02-15' AS Date), 40031, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71032, CAST(N'2022-02-26' AS Date), 40032, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71033, CAST(N'2022-02-27' AS Date), 40033, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71034, CAST(N'2022-01-26' AS Date), 40034, 70016, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71035, CAST(N'2022-02-13' AS Date), 40035, 70010, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71036, CAST(N'2022-01-18' AS Date), 40036, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71037, CAST(N'2022-02-15' AS Date), 40037, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71038, CAST(N'2022-02-15' AS Date), 40038, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71039, CAST(N'2022-03-01' AS Date), 40039, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71040, CAST(N'2022-03-02' AS Date), 40040, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71041, CAST(N'2022-01-17' AS Date), 40041, 70002, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71042, CAST(N'2022-02-06' AS Date), 40042, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71043, CAST(N'2022-01-31' AS Date), 40043, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71044, CAST(N'2022-03-10' AS Date), 40044, 70017, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71045, CAST(N'2022-02-07' AS Date), 40045, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71046, CAST(N'2022-01-11' AS Date), 40046, 70015, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71047, CAST(N'2022-02-11' AS Date), 40047, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71048, CAST(N'2022-03-07' AS Date), 40048, 70006, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71049, CAST(N'2022-02-01' AS Date), 40049, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71050, CAST(N'2022-01-11' AS Date), 40050, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71051, CAST(N'2022-01-16' AS Date), 40051, 70016, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71052, CAST(N'2022-01-28' AS Date), 40052, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71053, CAST(N'2022-02-27' AS Date), 40053, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71054, CAST(N'2022-01-30' AS Date), 40054, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71055, CAST(N'2022-02-16' AS Date), 40055, 70008, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71056, CAST(N'2022-03-02' AS Date), 40056, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71057, CAST(N'2022-02-12' AS Date), 40057, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71058, CAST(N'2022-02-10' AS Date), 40058, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71059, CAST(N'2022-01-30' AS Date), 40059, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71060, CAST(N'2022-03-03' AS Date), 40060, 70019, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71061, CAST(N'2022-01-17' AS Date), 40061, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71062, CAST(N'2022-01-05' AS Date), 40062, 70002, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71063, CAST(N'2022-02-14' AS Date), 40063, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71064, CAST(N'2022-02-09' AS Date), 40064, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71065, CAST(N'2022-03-09' AS Date), 40065, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71066, CAST(N'2022-02-15' AS Date), 40066, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71067, CAST(N'2022-01-04' AS Date), 40067, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71068, CAST(N'2022-02-26' AS Date), 40001, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71069, CAST(N'2022-02-04' AS Date), 40002, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71070, CAST(N'2022-02-12' AS Date), 40003, 70018, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71071, CAST(N'2022-01-23' AS Date), 40004, 70012, 4, 17, 68)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71072, CAST(N'2022-01-11' AS Date), 40005, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71073, CAST(N'2022-01-21' AS Date), 40006, 70015, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71074, CAST(N'2022-02-19' AS Date), 40007, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71075, CAST(N'2022-02-02' AS Date), 40008, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71076, CAST(N'2022-02-07' AS Date), 40009, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71077, CAST(N'2022-02-09' AS Date), 40010, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71078, CAST(N'2022-01-28' AS Date), 40011, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71079, CAST(N'2022-03-04' AS Date), 40012, 70020, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71080, CAST(N'2022-03-01' AS Date), 40013, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71081, CAST(N'2022-03-06' AS Date), 40014, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71082, CAST(N'2022-02-18' AS Date), 40015, 70007, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71083, CAST(N'2022-03-01' AS Date), 40016, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71084, CAST(N'2022-01-17' AS Date), 40017, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71085, CAST(N'2022-02-09' AS Date), 40018, 70008, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71086, CAST(N'2022-01-17' AS Date), 40019, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71087, CAST(N'2022-01-29' AS Date), 40020, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71088, CAST(N'2022-01-12' AS Date), 40021, 70010, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71089, CAST(N'2022-01-02' AS Date), 40022, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71090, CAST(N'2022-01-05' AS Date), 40023, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71091, CAST(N'2022-02-02' AS Date), 40024, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71092, CAST(N'2022-02-01' AS Date), 40025, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71093, CAST(N'2022-01-24' AS Date), 40026, 70007, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71094, CAST(N'2022-01-04' AS Date), 40027, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71095, CAST(N'2022-02-02' AS Date), 40028, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71096, CAST(N'2022-02-26' AS Date), 40029, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71097, CAST(N'2022-03-08' AS Date), 40030, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71098, CAST(N'2022-01-06' AS Date), 40031, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71099, CAST(N'2022-02-04' AS Date), 40032, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71100, CAST(N'2022-02-14' AS Date), 40033, 70009, 3, 12, 36)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71101, CAST(N'2022-01-27' AS Date), 40034, 70016, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71102, CAST(N'2022-02-15' AS Date), 40035, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71103, CAST(N'2022-01-23' AS Date), 40036, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71104, CAST(N'2022-02-28' AS Date), 40037, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71105, CAST(N'2022-02-09' AS Date), 40038, 70005, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71106, CAST(N'2022-03-05' AS Date), 40039, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71107, CAST(N'2022-01-07' AS Date), 40040, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71108, CAST(N'2022-02-27' AS Date), 40041, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71109, CAST(N'2022-01-15' AS Date), 40042, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71110, CAST(N'2022-01-08' AS Date), 40043, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71111, CAST(N'2022-01-22' AS Date), 40044, 70017, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71112, CAST(N'2022-02-21' AS Date), 40045, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71113, CAST(N'2022-01-23' AS Date), 40046, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71114, CAST(N'2022-02-13' AS Date), 40047, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71115, CAST(N'2022-01-03' AS Date), 40048, 70006, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71116, CAST(N'2022-01-18' AS Date), 40049, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71117, CAST(N'2022-02-07' AS Date), 40050, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71118, CAST(N'2022-01-01' AS Date), 40051, 70016, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71119, CAST(N'2022-02-03' AS Date), 40052, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71120, CAST(N'2022-01-06' AS Date), 40053, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71121, CAST(N'2022-01-07' AS Date), 40054, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71122, CAST(N'2022-01-07' AS Date), 40055, 70008, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71123, CAST(N'2022-01-06' AS Date), 40056, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71124, CAST(N'2022-01-21' AS Date), 40057, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71125, CAST(N'2022-01-29' AS Date), 40058, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71126, CAST(N'2022-02-25' AS Date), 40059, 70012, 2, 17, 34)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71127, CAST(N'2022-02-17' AS Date), 40060, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71128, CAST(N'2022-02-10' AS Date), 40061, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71129, CAST(N'2022-03-01' AS Date), 40062, 70002, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71130, CAST(N'2022-01-06' AS Date), 40063, 70020, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71131, CAST(N'2022-01-19' AS Date), 40064, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71132, CAST(N'2022-01-16' AS Date), 40065, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71133, CAST(N'2022-01-24' AS Date), 40066, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71134, CAST(N'2022-01-01' AS Date), 40067, 70018, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71135, CAST(N'2022-02-10' AS Date), 40001, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71136, CAST(N'2022-01-23' AS Date), 40002, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71137, CAST(N'2022-02-03' AS Date), 40003, 70018, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71138, CAST(N'2022-02-08' AS Date), 40004, 70012, 4, 17, 68)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71139, CAST(N'2022-02-12' AS Date), 40005, 70001, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71140, CAST(N'2022-01-28' AS Date), 40006, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71141, CAST(N'2022-02-27' AS Date), 40007, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71142, CAST(N'2022-01-16' AS Date), 40008, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71143, CAST(N'2022-01-01' AS Date), 40009, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71144, CAST(N'2022-03-05' AS Date), 40010, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71145, CAST(N'2022-01-02' AS Date), 40011, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71146, CAST(N'2022-01-27' AS Date), 40012, 70020, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71147, CAST(N'2022-02-17' AS Date), 40013, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71148, CAST(N'2022-03-05' AS Date), 40014, 70006, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71149, CAST(N'2022-01-23' AS Date), 40015, 70007, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71150, CAST(N'2022-01-29' AS Date), 40016, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71151, CAST(N'2022-02-22' AS Date), 40017, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71152, CAST(N'2022-02-15' AS Date), 40018, 70008, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71153, CAST(N'2022-02-24' AS Date), 40019, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71154, CAST(N'2022-01-30' AS Date), 40020, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71155, CAST(N'2022-02-27' AS Date), 40021, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71156, CAST(N'2022-01-17' AS Date), 40022, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71157, CAST(N'2022-02-24' AS Date), 40023, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71158, CAST(N'2022-01-07' AS Date), 40024, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71159, CAST(N'2022-01-29' AS Date), 40025, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71160, CAST(N'2022-03-04' AS Date), 40026, 70007, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71161, CAST(N'2022-02-04' AS Date), 40027, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71162, CAST(N'2022-01-06' AS Date), 40028, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71163, CAST(N'2022-01-20' AS Date), 40029, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71164, CAST(N'2022-01-07' AS Date), 40030, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71165, CAST(N'2022-03-07' AS Date), 40031, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71166, CAST(N'2022-02-18' AS Date), 40032, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71167, CAST(N'2022-02-19' AS Date), 40033, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71168, CAST(N'2022-01-02' AS Date), 40034, 70016, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71169, CAST(N'2022-02-23' AS Date), 40035, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71170, CAST(N'2022-01-24' AS Date), 40036, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71171, CAST(N'2022-02-04' AS Date), 40037, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71172, CAST(N'2022-01-07' AS Date), 40038, 70005, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71173, CAST(N'2022-01-24' AS Date), 40039, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71174, CAST(N'2022-01-20' AS Date), 40040, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71175, CAST(N'2022-01-12' AS Date), 40041, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71176, CAST(N'2022-02-22' AS Date), 40042, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71177, CAST(N'2022-01-25' AS Date), 40043, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71178, CAST(N'2022-01-29' AS Date), 40044, 70017, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71179, CAST(N'2022-01-08' AS Date), 40045, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71180, CAST(N'2022-01-05' AS Date), 40046, 70015, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71181, CAST(N'2022-01-01' AS Date), 40047, 70010, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71182, CAST(N'2022-02-06' AS Date), 40048, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71183, CAST(N'2022-01-21' AS Date), 40049, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71184, CAST(N'2022-02-07' AS Date), 40050, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71185, CAST(N'2022-01-24' AS Date), 40051, 70016, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71186, CAST(N'2022-02-19' AS Date), 40052, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71187, CAST(N'2022-01-13' AS Date), 40053, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71188, CAST(N'2022-02-22' AS Date), 40054, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71189, CAST(N'2022-01-20' AS Date), 40055, 70008, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71190, CAST(N'2022-01-19' AS Date), 40056, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71191, CAST(N'2022-02-16' AS Date), 40057, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71192, CAST(N'2022-03-03' AS Date), 40058, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71193, CAST(N'2022-01-26' AS Date), 40059, 70012, 7, 17, 119)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71194, CAST(N'2022-02-16' AS Date), 40060, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71195, CAST(N'2022-01-16' AS Date), 40061, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71196, CAST(N'2022-01-24' AS Date), 40062, 70002, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71197, CAST(N'2022-02-09' AS Date), 40063, 70020, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71198, CAST(N'2022-02-22' AS Date), 40064, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71199, CAST(N'2022-03-03' AS Date), 40065, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71200, CAST(N'2022-01-24' AS Date), 40066, 70014, 6, 14, 84)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71201, CAST(N'2022-01-08' AS Date), 40067, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71202, CAST(N'2022-01-05' AS Date), 40001, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71203, CAST(N'2022-01-17' AS Date), 40002, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71204, CAST(N'2022-01-16' AS Date), 40003, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71205, CAST(N'2022-03-03' AS Date), 40004, 70012, 6, 17, 102)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71206, CAST(N'2022-02-14' AS Date), 40005, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71207, CAST(N'2022-01-28' AS Date), 40006, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71208, CAST(N'2022-01-21' AS Date), 40007, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71209, CAST(N'2022-02-07' AS Date), 40008, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71210, CAST(N'2022-01-23' AS Date), 40009, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71211, CAST(N'2022-01-05' AS Date), 40010, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71212, CAST(N'2022-02-05' AS Date), 40011, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71213, CAST(N'2022-02-09' AS Date), 40012, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71214, CAST(N'2022-01-16' AS Date), 40013, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71215, CAST(N'2022-01-16' AS Date), 40014, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71216, CAST(N'2022-02-27' AS Date), 40015, 70007, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71217, CAST(N'2022-01-28' AS Date), 40016, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71218, CAST(N'2022-02-28' AS Date), 40017, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71219, CAST(N'2022-03-06' AS Date), 40018, 70008, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71220, CAST(N'2022-01-28' AS Date), 40019, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71221, CAST(N'2022-01-15' AS Date), 40020, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71222, CAST(N'2022-02-19' AS Date), 40021, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71223, CAST(N'2022-01-27' AS Date), 40022, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71224, CAST(N'2022-02-05' AS Date), 40023, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71225, CAST(N'2022-02-27' AS Date), 40024, 70018, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71226, CAST(N'2022-02-19' AS Date), 40025, 70001, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71227, CAST(N'2022-02-23' AS Date), 40026, 70007, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71228, CAST(N'2022-02-20' AS Date), 40027, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71229, CAST(N'2022-03-04' AS Date), 40028, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71230, CAST(N'2022-02-20' AS Date), 40029, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71231, CAST(N'2022-02-02' AS Date), 40030, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71232, CAST(N'2022-01-11' AS Date), 40031, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71233, CAST(N'2022-02-20' AS Date), 40032, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71234, CAST(N'2022-02-18' AS Date), 40033, 70009, 3, 12, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71235, CAST(N'2022-03-03' AS Date), 40034, 70016, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71236, CAST(N'2022-02-28' AS Date), 40035, 70010, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71237, CAST(N'2022-02-19' AS Date), 40036, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71238, CAST(N'2022-02-20' AS Date), 40037, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71239, CAST(N'2022-01-29' AS Date), 40038, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71240, CAST(N'2022-01-30' AS Date), 40039, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71241, CAST(N'2022-03-07' AS Date), 40040, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71242, CAST(N'2022-01-19' AS Date), 40041, 70002, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71243, CAST(N'2022-01-29' AS Date), 40042, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71244, CAST(N'2022-01-11' AS Date), 40043, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71245, CAST(N'2022-01-09' AS Date), 40044, 70017, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71246, CAST(N'2022-01-23' AS Date), 40045, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71247, CAST(N'2022-01-01' AS Date), 40046, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71248, CAST(N'2022-02-05' AS Date), 40047, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71249, CAST(N'2022-02-16' AS Date), 40048, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71250, CAST(N'2022-01-29' AS Date), 40049, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71251, CAST(N'2022-02-10' AS Date), 40050, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71252, CAST(N'2022-02-22' AS Date), 40051, 70016, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71253, CAST(N'2022-02-16' AS Date), 40052, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71254, CAST(N'2022-02-13' AS Date), 40053, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71255, CAST(N'2022-01-13' AS Date), 40054, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71256, CAST(N'2022-01-17' AS Date), 40055, 70008, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71257, CAST(N'2022-02-15' AS Date), 40056, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71258, CAST(N'2022-01-05' AS Date), 40057, 70007, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71259, CAST(N'2022-02-18' AS Date), 40058, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71260, CAST(N'2022-01-31' AS Date), 40059, 70012, 6, 17, 102)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71261, CAST(N'2022-01-09' AS Date), 40060, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71262, CAST(N'2022-02-03' AS Date), 40061, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71263, CAST(N'2022-01-17' AS Date), 40062, 70002, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71264, CAST(N'2022-03-04' AS Date), 40063, 70020, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71265, CAST(N'2022-02-20' AS Date), 40064, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71266, CAST(N'2022-02-15' AS Date), 40065, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71267, CAST(N'2022-02-16' AS Date), 40066, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71268, CAST(N'2022-02-12' AS Date), 40067, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71269, CAST(N'2022-01-01' AS Date), 40001, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71270, CAST(N'2022-01-24' AS Date), 40002, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71271, CAST(N'2022-02-10' AS Date), 40003, 70018, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71272, CAST(N'2022-01-17' AS Date), 40004, 70012, 6, 17, 102)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71273, CAST(N'2022-01-19' AS Date), 40005, 70001, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71274, CAST(N'2022-01-12' AS Date), 40006, 70015, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71275, CAST(N'2022-02-05' AS Date), 40007, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71276, CAST(N'2022-02-02' AS Date), 40008, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71277, CAST(N'2022-01-16' AS Date), 40009, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71278, CAST(N'2022-01-18' AS Date), 40010, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71279, CAST(N'2022-01-24' AS Date), 40011, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71280, CAST(N'2022-01-09' AS Date), 40012, 70020, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71281, CAST(N'2022-01-27' AS Date), 40013, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71282, CAST(N'2022-02-05' AS Date), 40014, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71283, CAST(N'2022-01-13' AS Date), 40015, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71284, CAST(N'2022-02-07' AS Date), 40016, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71285, CAST(N'2022-01-03' AS Date), 40017, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71286, CAST(N'2022-01-31' AS Date), 40018, 70008, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71287, CAST(N'2022-01-31' AS Date), 40019, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71288, CAST(N'2022-01-28' AS Date), 40020, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71289, CAST(N'2022-03-06' AS Date), 40021, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71290, CAST(N'2022-02-16' AS Date), 40022, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71291, CAST(N'2022-01-12' AS Date), 40023, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71292, CAST(N'2022-02-26' AS Date), 40024, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71293, CAST(N'2022-02-22' AS Date), 40025, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71294, CAST(N'2022-03-08' AS Date), 40026, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71295, CAST(N'2022-03-05' AS Date), 40027, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71296, CAST(N'2022-03-09' AS Date), 40028, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71297, CAST(N'2022-02-01' AS Date), 40029, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71298, CAST(N'2022-02-11' AS Date), 40030, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71299, CAST(N'2022-01-28' AS Date), 40031, 70009, 7, 12, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71300, CAST(N'2022-02-09' AS Date), 40032, 70013, 2, 14, 28)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71301, CAST(N'2022-01-15' AS Date), 40033, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71302, CAST(N'2022-01-12' AS Date), 40034, 70016, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71303, CAST(N'2022-02-19' AS Date), 40035, 70010, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71304, CAST(N'2022-01-12' AS Date), 40036, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71305, CAST(N'2022-03-06' AS Date), 40037, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71306, CAST(N'2022-01-07' AS Date), 40038, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71307, CAST(N'2022-02-07' AS Date), 40039, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71308, CAST(N'2022-01-02' AS Date), 40040, 70019, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71309, CAST(N'2022-01-28' AS Date), 40041, 70002, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71310, CAST(N'2022-01-27' AS Date), 40042, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71311, CAST(N'2022-01-12' AS Date), 40043, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71312, CAST(N'2022-02-12' AS Date), 40044, 70017, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71313, CAST(N'2022-02-20' AS Date), 40045, 70014, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71314, CAST(N'2022-03-05' AS Date), 40046, 70015, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71315, CAST(N'2022-02-16' AS Date), 40047, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71316, CAST(N'2022-01-17' AS Date), 40048, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71317, CAST(N'2022-01-15' AS Date), 40049, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71318, CAST(N'2022-02-08' AS Date), 40050, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71319, CAST(N'2022-02-15' AS Date), 40051, 70016, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71320, CAST(N'2022-01-25' AS Date), 40052, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71321, CAST(N'2022-02-20' AS Date), 40053, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71322, CAST(N'2022-01-18' AS Date), 40054, 70009, 3, 12, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71323, CAST(N'2022-02-16' AS Date), 40055, 70008, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71324, CAST(N'2022-03-08' AS Date), 40056, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71325, CAST(N'2022-02-10' AS Date), 40057, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71326, CAST(N'2022-01-07' AS Date), 40058, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71327, CAST(N'2022-02-24' AS Date), 40059, 70012, 7, 17, 119)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71328, CAST(N'2022-03-03' AS Date), 40060, 70019, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71329, CAST(N'2022-02-22' AS Date), 40061, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71330, CAST(N'2022-01-13' AS Date), 40062, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71331, CAST(N'2022-03-05' AS Date), 40063, 70020, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71332, CAST(N'2022-02-07' AS Date), 40064, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71333, CAST(N'2022-01-05' AS Date), 40065, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71334, CAST(N'2022-01-25' AS Date), 40066, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71335, CAST(N'2022-02-20' AS Date), 40067, 70018, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71336, CAST(N'2022-01-28' AS Date), 40001, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71337, CAST(N'2022-02-24' AS Date), 40002, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71338, CAST(N'2022-02-25' AS Date), 40003, 70018, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71339, CAST(N'2022-01-12' AS Date), 40004, 70012, 6, 17, 102)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71340, CAST(N'2022-02-12' AS Date), 40005, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71341, CAST(N'2022-02-11' AS Date), 40006, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71342, CAST(N'2022-01-20' AS Date), 40007, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71343, CAST(N'2022-01-30' AS Date), 40008, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71344, CAST(N'2022-01-16' AS Date), 40009, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71345, CAST(N'2022-02-21' AS Date), 40010, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71346, CAST(N'2022-01-18' AS Date), 40011, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71347, CAST(N'2022-01-04' AS Date), 40012, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71348, CAST(N'2022-01-10' AS Date), 40013, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71349, CAST(N'2022-03-07' AS Date), 40014, 70006, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71350, CAST(N'2022-03-06' AS Date), 40015, 70007, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71351, CAST(N'2022-01-29' AS Date), 40016, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71352, CAST(N'2022-02-23' AS Date), 40017, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71353, CAST(N'2022-02-18' AS Date), 40018, 70008, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71354, CAST(N'2022-02-25' AS Date), 40019, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71355, CAST(N'2022-01-24' AS Date), 40020, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71356, CAST(N'2022-02-16' AS Date), 40021, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71357, CAST(N'2022-01-14' AS Date), 40022, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71358, CAST(N'2022-01-04' AS Date), 40023, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71359, CAST(N'2022-02-16' AS Date), 40024, 70018, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71360, CAST(N'2022-02-25' AS Date), 40025, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71361, CAST(N'2022-01-18' AS Date), 40026, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71362, CAST(N'2022-01-14' AS Date), 40027, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71363, CAST(N'2022-01-07' AS Date), 40028, 70013, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71364, CAST(N'2022-01-19' AS Date), 40029, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71365, CAST(N'2022-03-09' AS Date), 40030, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71366, CAST(N'2022-02-26' AS Date), 40031, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71367, CAST(N'2022-01-27' AS Date), 40032, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71368, CAST(N'2022-03-02' AS Date), 40033, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71369, CAST(N'2022-01-10' AS Date), 40034, 70016, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71370, CAST(N'2022-02-26' AS Date), 40035, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71371, CAST(N'2022-02-25' AS Date), 40036, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71372, CAST(N'2022-01-24' AS Date), 40037, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71373, CAST(N'2022-02-21' AS Date), 40038, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71374, CAST(N'2022-02-21' AS Date), 40039, 70005, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71375, CAST(N'2022-01-07' AS Date), 40040, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71376, CAST(N'2022-01-02' AS Date), 40041, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71377, CAST(N'2022-01-31' AS Date), 40042, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71378, CAST(N'2022-01-19' AS Date), 40043, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71379, CAST(N'2022-01-27' AS Date), 40044, 70017, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71380, CAST(N'2022-02-26' AS Date), 40045, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71381, CAST(N'2022-01-22' AS Date), 40046, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71382, CAST(N'2022-01-03' AS Date), 40047, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71383, CAST(N'2022-01-11' AS Date), 40048, 70006, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71384, CAST(N'2022-02-16' AS Date), 40049, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71385, CAST(N'2022-02-22' AS Date), 40050, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71386, CAST(N'2022-03-09' AS Date), 40051, 70016, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71387, CAST(N'2022-02-24' AS Date), 40052, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71388, CAST(N'2022-01-30' AS Date), 40053, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71389, CAST(N'2022-01-06' AS Date), 40054, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71390, CAST(N'2022-01-04' AS Date), 40055, 70008, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71391, CAST(N'2022-01-31' AS Date), 40056, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71392, CAST(N'2022-01-31' AS Date), 40057, 70007, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71393, CAST(N'2022-02-15' AS Date), 40058, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71394, CAST(N'2022-01-20' AS Date), 40059, 70012, 8, 17, 136)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71395, CAST(N'2022-01-15' AS Date), 40060, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71396, CAST(N'2022-02-11' AS Date), 40061, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71397, CAST(N'2022-01-16' AS Date), 40062, 70002, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71398, CAST(N'2022-02-19' AS Date), 40063, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71399, CAST(N'2022-01-30' AS Date), 40064, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71400, CAST(N'2022-01-16' AS Date), 40065, 70003, 4, 9, 36)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71401, CAST(N'2022-02-01' AS Date), 40066, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71402, CAST(N'2022-01-19' AS Date), 40067, 70018, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71403, CAST(N'2022-01-10' AS Date), 40001, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71404, CAST(N'2022-01-21' AS Date), 40002, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71405, CAST(N'2022-01-21' AS Date), 40003, 70018, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71406, CAST(N'2022-02-17' AS Date), 40004, 70012, 2, 17, 34)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71407, CAST(N'2022-02-09' AS Date), 40005, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71408, CAST(N'2022-03-09' AS Date), 40006, 70015, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71409, CAST(N'2022-02-15' AS Date), 40007, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71410, CAST(N'2022-02-22' AS Date), 40008, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71411, CAST(N'2022-01-19' AS Date), 40009, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71412, CAST(N'2022-03-01' AS Date), 40010, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71413, CAST(N'2022-02-14' AS Date), 40011, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71414, CAST(N'2022-02-09' AS Date), 40012, 70020, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71415, CAST(N'2022-01-03' AS Date), 40013, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71416, CAST(N'2022-02-15' AS Date), 40014, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71417, CAST(N'2022-02-03' AS Date), 40015, 70007, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71418, CAST(N'2022-01-23' AS Date), 40016, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71419, CAST(N'2022-01-08' AS Date), 40017, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71420, CAST(N'2022-01-17' AS Date), 40018, 70008, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71421, CAST(N'2022-02-10' AS Date), 40019, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71422, CAST(N'2022-01-13' AS Date), 40020, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71423, CAST(N'2022-02-26' AS Date), 40021, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71424, CAST(N'2022-02-08' AS Date), 40022, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71425, CAST(N'2022-01-14' AS Date), 40023, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71426, CAST(N'2022-01-20' AS Date), 40024, 70018, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71427, CAST(N'2022-02-14' AS Date), 40025, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71428, CAST(N'2022-02-22' AS Date), 40026, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71429, CAST(N'2022-02-19' AS Date), 40027, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71430, CAST(N'2022-02-04' AS Date), 40028, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71431, CAST(N'2022-01-17' AS Date), 40029, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71432, CAST(N'2022-01-30' AS Date), 40030, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71433, CAST(N'2022-01-23' AS Date), 40031, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71434, CAST(N'2022-02-01' AS Date), 40032, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71435, CAST(N'2022-02-14' AS Date), 40033, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71436, CAST(N'2022-01-09' AS Date), 40034, 70016, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71437, CAST(N'2022-02-22' AS Date), 40035, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71438, CAST(N'2022-02-20' AS Date), 40036, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71439, CAST(N'2022-02-09' AS Date), 40037, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71440, CAST(N'2022-01-14' AS Date), 40038, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71441, CAST(N'2022-03-04' AS Date), 40039, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71442, CAST(N'2022-01-05' AS Date), 40040, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71443, CAST(N'2022-01-17' AS Date), 40041, 70002, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71444, CAST(N'2022-01-19' AS Date), 40042, 70014, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71445, CAST(N'2022-03-02' AS Date), 40043, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71446, CAST(N'2022-01-30' AS Date), 40044, 70017, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71447, CAST(N'2022-02-18' AS Date), 40045, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71448, CAST(N'2022-02-03' AS Date), 40046, 70015, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71449, CAST(N'2022-02-09' AS Date), 40047, 70010, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71450, CAST(N'2022-02-17' AS Date), 40048, 70006, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71451, CAST(N'2022-02-13' AS Date), 40049, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71452, CAST(N'2022-01-22' AS Date), 40050, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71453, CAST(N'2022-01-31' AS Date), 40051, 70016, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71454, CAST(N'2022-01-04' AS Date), 40052, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71455, CAST(N'2022-02-06' AS Date), 40053, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71456, CAST(N'2022-02-10' AS Date), 40054, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71457, CAST(N'2022-02-20' AS Date), 40055, 70008, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71458, CAST(N'2022-01-01' AS Date), 40056, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71459, CAST(N'2022-01-12' AS Date), 40057, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71460, CAST(N'2022-03-09' AS Date), 40058, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71461, CAST(N'2022-02-19' AS Date), 40059, 70012, 4, 17, 68)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71462, CAST(N'2022-01-03' AS Date), 40060, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71463, CAST(N'2022-03-08' AS Date), 40061, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71464, CAST(N'2022-01-24' AS Date), 40062, 70002, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71465, CAST(N'2022-01-25' AS Date), 40063, 70020, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71466, CAST(N'2022-02-09' AS Date), 40064, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71467, CAST(N'2022-02-13' AS Date), 40065, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71468, CAST(N'2022-02-09' AS Date), 40066, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71469, CAST(N'2022-02-15' AS Date), 40067, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71470, CAST(N'2022-02-02' AS Date), 40001, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71471, CAST(N'2022-02-12' AS Date), 40002, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71472, CAST(N'2022-02-24' AS Date), 40003, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71473, CAST(N'2022-01-07' AS Date), 40004, 70012, 7, 17, 119)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71474, CAST(N'2022-02-15' AS Date), 40005, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71475, CAST(N'2022-01-25' AS Date), 40006, 70015, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71476, CAST(N'2022-01-31' AS Date), 40007, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71477, CAST(N'2022-01-14' AS Date), 40008, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71478, CAST(N'2022-02-25' AS Date), 40009, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71479, CAST(N'2022-01-31' AS Date), 40010, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71480, CAST(N'2022-02-25' AS Date), 40011, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71481, CAST(N'2022-01-08' AS Date), 40012, 70020, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71482, CAST(N'2022-03-08' AS Date), 40013, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71483, CAST(N'2022-01-26' AS Date), 40014, 70006, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71484, CAST(N'2022-03-05' AS Date), 40015, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71485, CAST(N'2022-01-08' AS Date), 40016, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71486, CAST(N'2022-02-26' AS Date), 40017, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71487, CAST(N'2022-01-29' AS Date), 40018, 70008, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71488, CAST(N'2022-01-02' AS Date), 40019, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71489, CAST(N'2022-01-08' AS Date), 40020, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71490, CAST(N'2022-02-22' AS Date), 40021, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71491, CAST(N'2022-01-23' AS Date), 40022, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71492, CAST(N'2022-01-26' AS Date), 40023, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71493, CAST(N'2022-01-24' AS Date), 40024, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71494, CAST(N'2022-03-04' AS Date), 40025, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71495, CAST(N'2022-02-16' AS Date), 40026, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71496, CAST(N'2022-01-08' AS Date), 40027, 70009, 3, 12, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71497, CAST(N'2022-01-26' AS Date), 40028, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71498, CAST(N'2022-01-26' AS Date), 40029, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71499, CAST(N'2022-02-13' AS Date), 40030, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71500, CAST(N'2022-02-15' AS Date), 40031, 70009, 4, 12, 48)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71501, CAST(N'2022-01-23' AS Date), 40032, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71502, CAST(N'2022-03-06' AS Date), 40033, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71503, CAST(N'2022-02-13' AS Date), 40034, 70016, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71504, CAST(N'2022-03-08' AS Date), 40035, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71505, CAST(N'2022-01-06' AS Date), 40036, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71506, CAST(N'2022-02-28' AS Date), 40037, 70001, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71507, CAST(N'2022-02-22' AS Date), 40038, 70005, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71508, CAST(N'2022-01-08' AS Date), 40039, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71509, CAST(N'2022-01-31' AS Date), 40040, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71510, CAST(N'2022-01-01' AS Date), 40041, 70002, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71511, CAST(N'2022-02-13' AS Date), 40042, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71512, CAST(N'2022-01-19' AS Date), 40043, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71513, CAST(N'2022-02-28' AS Date), 40044, 70017, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71514, CAST(N'2022-02-14' AS Date), 40045, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71515, CAST(N'2022-01-10' AS Date), 40046, 70015, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71516, CAST(N'2022-02-17' AS Date), 40047, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71517, CAST(N'2022-01-08' AS Date), 40048, 70006, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71518, CAST(N'2022-03-03' AS Date), 40049, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71519, CAST(N'2022-01-09' AS Date), 40050, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71520, CAST(N'2022-01-08' AS Date), 40051, 70016, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71521, CAST(N'2022-01-19' AS Date), 40052, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71522, CAST(N'2022-02-21' AS Date), 40053, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71523, CAST(N'2022-02-28' AS Date), 40054, 70009, 7, 12, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71524, CAST(N'2022-03-02' AS Date), 40055, 70008, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71525, CAST(N'2022-01-29' AS Date), 40056, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71526, CAST(N'2022-02-18' AS Date), 40057, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71527, CAST(N'2022-01-01' AS Date), 40058, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71528, CAST(N'2022-02-11' AS Date), 40059, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71529, CAST(N'2022-01-21' AS Date), 40060, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71530, CAST(N'2022-02-22' AS Date), 40061, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71531, CAST(N'2022-01-03' AS Date), 40062, 70002, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71532, CAST(N'2022-03-05' AS Date), 40063, 70020, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71533, CAST(N'2022-03-10' AS Date), 40064, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71534, CAST(N'2022-01-22' AS Date), 40065, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71535, CAST(N'2022-02-27' AS Date), 40066, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71536, CAST(N'2022-02-16' AS Date), 40067, 70018, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71537, CAST(N'2022-01-31' AS Date), 40001, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71538, CAST(N'2022-02-22' AS Date), 40002, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71539, CAST(N'2022-02-28' AS Date), 40003, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71540, CAST(N'2022-03-08' AS Date), 40004, 70012, 5, 17, 85)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71541, CAST(N'2022-01-10' AS Date), 40005, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71542, CAST(N'2022-02-08' AS Date), 40006, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71543, CAST(N'2022-01-23' AS Date), 40007, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71544, CAST(N'2022-01-11' AS Date), 40008, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71545, CAST(N'2022-01-03' AS Date), 40009, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71546, CAST(N'2022-02-24' AS Date), 40010, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71547, CAST(N'2022-03-02' AS Date), 40011, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71548, CAST(N'2022-01-11' AS Date), 40012, 70020, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71549, CAST(N'2022-01-31' AS Date), 40013, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71550, CAST(N'2022-02-17' AS Date), 40014, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71551, CAST(N'2022-01-19' AS Date), 40015, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71552, CAST(N'2022-03-09' AS Date), 40016, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71553, CAST(N'2022-02-16' AS Date), 40017, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71554, CAST(N'2022-01-21' AS Date), 40018, 70008, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71555, CAST(N'2022-03-04' AS Date), 40019, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71556, CAST(N'2022-01-10' AS Date), 40020, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71557, CAST(N'2022-02-03' AS Date), 40021, 70010, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71558, CAST(N'2022-02-05' AS Date), 40022, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71559, CAST(N'2022-01-06' AS Date), 40023, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71560, CAST(N'2022-01-23' AS Date), 40024, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71561, CAST(N'2022-02-17' AS Date), 40025, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71562, CAST(N'2022-02-17' AS Date), 40026, 70007, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71563, CAST(N'2022-01-22' AS Date), 40027, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71564, CAST(N'2022-02-09' AS Date), 40028, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71565, CAST(N'2022-02-18' AS Date), 40029, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71566, CAST(N'2022-01-15' AS Date), 40030, 70019, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71567, CAST(N'2022-02-27' AS Date), 40031, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71568, CAST(N'2022-01-15' AS Date), 40032, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71569, CAST(N'2022-01-26' AS Date), 40033, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71570, CAST(N'2022-02-20' AS Date), 40034, 70016, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71571, CAST(N'2022-01-05' AS Date), 40035, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71572, CAST(N'2022-01-25' AS Date), 40036, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71573, CAST(N'2022-02-13' AS Date), 40037, 70001, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71574, CAST(N'2022-01-26' AS Date), 40038, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71575, CAST(N'2022-01-25' AS Date), 40039, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71576, CAST(N'2022-01-04' AS Date), 40040, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71577, CAST(N'2022-01-22' AS Date), 40041, 70002, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71578, CAST(N'2022-02-20' AS Date), 40042, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71579, CAST(N'2022-02-23' AS Date), 40043, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71580, CAST(N'2022-01-06' AS Date), 40044, 70017, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71581, CAST(N'2022-01-28' AS Date), 40045, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71582, CAST(N'2022-02-18' AS Date), 40046, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71583, CAST(N'2022-02-08' AS Date), 40047, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71584, CAST(N'2022-02-27' AS Date), 40048, 70006, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71585, CAST(N'2022-02-13' AS Date), 40049, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71586, CAST(N'2022-01-20' AS Date), 40050, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71587, CAST(N'2022-01-03' AS Date), 40051, 70016, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71588, CAST(N'2022-03-09' AS Date), 40052, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71589, CAST(N'2022-01-28' AS Date), 40053, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71590, CAST(N'2022-01-19' AS Date), 40054, 70009, 7, 12, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71591, CAST(N'2022-03-02' AS Date), 40055, 70008, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71592, CAST(N'2022-01-27' AS Date), 40056, 70005, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71593, CAST(N'2022-03-01' AS Date), 40057, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71594, CAST(N'2022-01-12' AS Date), 40058, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71595, CAST(N'2022-02-14' AS Date), 40059, 70012, 6, 17, 102)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71596, CAST(N'2022-01-13' AS Date), 40060, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71597, CAST(N'2022-02-16' AS Date), 40061, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71598, CAST(N'2022-02-23' AS Date), 40062, 70002, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71599, CAST(N'2022-01-19' AS Date), 40063, 70020, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71600, CAST(N'2022-03-10' AS Date), 40064, 70009, 2, 12, 24)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71601, CAST(N'2022-01-02' AS Date), 40065, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71602, CAST(N'2022-03-04' AS Date), 40066, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71603, CAST(N'2022-03-01' AS Date), 40067, 70018, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71604, CAST(N'2022-03-04' AS Date), 40001, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71605, CAST(N'2022-02-08' AS Date), 40002, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71606, CAST(N'2022-03-06' AS Date), 40003, 70018, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71607, CAST(N'2022-02-14' AS Date), 40004, 70012, 8, 17, 136)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71608, CAST(N'2022-02-24' AS Date), 40005, 70001, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71609, CAST(N'2022-01-29' AS Date), 40006, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71610, CAST(N'2022-01-06' AS Date), 40007, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71611, CAST(N'2022-01-04' AS Date), 40008, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71612, CAST(N'2022-01-26' AS Date), 40009, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71613, CAST(N'2022-01-17' AS Date), 40010, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71614, CAST(N'2022-01-13' AS Date), 40011, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71615, CAST(N'2022-01-04' AS Date), 40012, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71616, CAST(N'2022-03-09' AS Date), 40013, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71617, CAST(N'2022-01-22' AS Date), 40014, 70006, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71618, CAST(N'2022-03-06' AS Date), 40015, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71619, CAST(N'2022-03-04' AS Date), 40016, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71620, CAST(N'2022-02-02' AS Date), 40017, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71621, CAST(N'2022-01-15' AS Date), 40018, 70008, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71622, CAST(N'2022-01-20' AS Date), 40019, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71623, CAST(N'2022-02-22' AS Date), 40020, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71624, CAST(N'2022-01-04' AS Date), 40021, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71625, CAST(N'2022-02-24' AS Date), 40022, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71626, CAST(N'2022-02-25' AS Date), 40023, 70014, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71627, CAST(N'2022-02-10' AS Date), 40024, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71628, CAST(N'2022-01-23' AS Date), 40025, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71629, CAST(N'2022-01-11' AS Date), 40026, 70007, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71630, CAST(N'2022-02-15' AS Date), 40027, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71631, CAST(N'2022-02-22' AS Date), 40028, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71632, CAST(N'2022-03-01' AS Date), 40029, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71633, CAST(N'2022-01-12' AS Date), 40030, 70019, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71634, CAST(N'2022-01-31' AS Date), 40031, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71635, CAST(N'2022-02-09' AS Date), 40032, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71636, CAST(N'2022-01-29' AS Date), 40033, 70009, 7, 12, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71637, CAST(N'2022-02-10' AS Date), 40034, 70016, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71638, CAST(N'2022-02-23' AS Date), 40035, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71639, CAST(N'2022-02-23' AS Date), 40036, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71640, CAST(N'2022-01-08' AS Date), 40037, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71641, CAST(N'2022-01-08' AS Date), 40038, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71642, CAST(N'2022-01-23' AS Date), 40039, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71643, CAST(N'2022-01-21' AS Date), 40040, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71644, CAST(N'2022-02-24' AS Date), 40041, 70002, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71645, CAST(N'2022-01-15' AS Date), 40042, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71646, CAST(N'2022-03-03' AS Date), 40043, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71647, CAST(N'2022-01-24' AS Date), 40044, 70017, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71648, CAST(N'2022-02-16' AS Date), 40045, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71649, CAST(N'2022-02-04' AS Date), 40046, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71650, CAST(N'2022-02-08' AS Date), 40047, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71651, CAST(N'2022-01-16' AS Date), 40048, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71652, CAST(N'2022-01-07' AS Date), 40049, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71653, CAST(N'2022-01-08' AS Date), 40050, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71654, CAST(N'2022-01-10' AS Date), 40051, 70016, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71655, CAST(N'2022-01-30' AS Date), 40052, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71656, CAST(N'2022-02-06' AS Date), 40053, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71657, CAST(N'2022-01-03' AS Date), 40054, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71658, CAST(N'2022-02-14' AS Date), 40055, 70008, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71659, CAST(N'2022-01-23' AS Date), 40056, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71660, CAST(N'2022-02-02' AS Date), 40057, 70007, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71661, CAST(N'2022-03-03' AS Date), 40058, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71662, CAST(N'2022-02-23' AS Date), 40059, 70012, 6, 17, 102)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71663, CAST(N'2022-02-16' AS Date), 40060, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71664, CAST(N'2022-02-02' AS Date), 40061, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71665, CAST(N'2022-01-10' AS Date), 40062, 70002, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71666, CAST(N'2022-01-31' AS Date), 40063, 70020, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71667, CAST(N'2022-01-29' AS Date), 40064, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71668, CAST(N'2022-01-17' AS Date), 40065, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71669, CAST(N'2022-02-25' AS Date), 40066, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71670, CAST(N'2022-01-14' AS Date), 40067, 70018, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71671, CAST(N'2022-03-07' AS Date), 40001, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71672, CAST(N'2022-03-05' AS Date), 40002, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71673, CAST(N'2022-03-07' AS Date), 40003, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71674, CAST(N'2022-02-15' AS Date), 40004, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71675, CAST(N'2022-03-03' AS Date), 40005, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71676, CAST(N'2022-02-04' AS Date), 40006, 70015, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71677, CAST(N'2022-01-27' AS Date), 40007, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71678, CAST(N'2022-03-04' AS Date), 40008, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71679, CAST(N'2022-02-04' AS Date), 40009, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71680, CAST(N'2022-01-17' AS Date), 40010, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71681, CAST(N'2022-01-31' AS Date), 40011, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71682, CAST(N'2022-02-18' AS Date), 40012, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71683, CAST(N'2022-02-21' AS Date), 40013, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71684, CAST(N'2022-01-18' AS Date), 40014, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71685, CAST(N'2022-01-16' AS Date), 40015, 70007, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71686, CAST(N'2022-01-21' AS Date), 40016, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71687, CAST(N'2022-01-25' AS Date), 40017, 70005, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71688, CAST(N'2022-02-23' AS Date), 40018, 70008, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71689, CAST(N'2022-01-10' AS Date), 40019, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71690, CAST(N'2022-01-23' AS Date), 40020, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71691, CAST(N'2022-02-27' AS Date), 40021, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71692, CAST(N'2022-01-30' AS Date), 40022, 70010, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71693, CAST(N'2022-01-28' AS Date), 40023, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71694, CAST(N'2022-02-02' AS Date), 40024, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71695, CAST(N'2022-02-15' AS Date), 40025, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71696, CAST(N'2022-01-23' AS Date), 40026, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71697, CAST(N'2022-03-05' AS Date), 40027, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71698, CAST(N'2022-02-19' AS Date), 40028, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71699, CAST(N'2022-01-15' AS Date), 40029, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71700, CAST(N'2022-01-07' AS Date), 40030, 70019, 1, 10, 10)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71701, CAST(N'2022-02-12' AS Date), 40031, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71702, CAST(N'2022-02-07' AS Date), 40032, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71703, CAST(N'2022-01-14' AS Date), 40033, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71704, CAST(N'2022-01-07' AS Date), 40034, 70016, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71705, CAST(N'2022-02-26' AS Date), 40035, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71706, CAST(N'2022-02-03' AS Date), 40036, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71707, CAST(N'2022-03-07' AS Date), 40037, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71708, CAST(N'2022-02-07' AS Date), 40038, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71709, CAST(N'2022-01-24' AS Date), 40039, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71710, CAST(N'2022-01-29' AS Date), 40040, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71711, CAST(N'2022-01-09' AS Date), 40041, 70002, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71712, CAST(N'2022-02-09' AS Date), 40042, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71713, CAST(N'2022-02-06' AS Date), 40043, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71714, CAST(N'2022-03-10' AS Date), 40044, 70017, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71715, CAST(N'2022-01-29' AS Date), 40045, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71716, CAST(N'2022-02-05' AS Date), 40046, 70015, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71717, CAST(N'2022-02-16' AS Date), 40047, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71718, CAST(N'2022-01-01' AS Date), 40048, 70006, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71719, CAST(N'2022-02-21' AS Date), 40049, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71720, CAST(N'2022-01-25' AS Date), 40050, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71721, CAST(N'2022-01-09' AS Date), 40051, 70016, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71722, CAST(N'2022-02-22' AS Date), 40052, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71723, CAST(N'2022-02-22' AS Date), 40053, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71724, CAST(N'2022-03-10' AS Date), 40054, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71725, CAST(N'2022-02-19' AS Date), 40055, 70008, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71726, CAST(N'2022-01-05' AS Date), 40056, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71727, CAST(N'2022-02-25' AS Date), 40057, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71728, CAST(N'2022-01-21' AS Date), 40058, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71729, CAST(N'2022-01-06' AS Date), 40059, 70012, 4, 17, 68)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71730, CAST(N'2022-01-05' AS Date), 40060, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71731, CAST(N'2022-01-09' AS Date), 40061, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71732, CAST(N'2022-02-27' AS Date), 40062, 70002, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71733, CAST(N'2022-01-27' AS Date), 40063, 70020, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71734, CAST(N'2022-01-11' AS Date), 40064, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71735, CAST(N'2022-01-19' AS Date), 40065, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71736, CAST(N'2022-01-06' AS Date), 40066, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71737, CAST(N'2022-01-05' AS Date), 40067, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71738, CAST(N'2022-03-09' AS Date), 40001, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71739, CAST(N'2022-01-28' AS Date), 40002, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71740, CAST(N'2022-02-05' AS Date), 40003, 70018, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71741, CAST(N'2022-03-04' AS Date), 40004, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71742, CAST(N'2022-02-14' AS Date), 40005, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71743, CAST(N'2022-01-09' AS Date), 40006, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71744, CAST(N'2022-01-31' AS Date), 40007, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71745, CAST(N'2022-01-26' AS Date), 40008, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71746, CAST(N'2022-01-09' AS Date), 40009, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71747, CAST(N'2022-01-14' AS Date), 40010, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71748, CAST(N'2022-01-12' AS Date), 40011, 70011, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71749, CAST(N'2022-02-05' AS Date), 40012, 70020, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71750, CAST(N'2022-02-18' AS Date), 40013, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71751, CAST(N'2022-02-05' AS Date), 40014, 70006, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71752, CAST(N'2022-02-03' AS Date), 40015, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71753, CAST(N'2022-01-23' AS Date), 40016, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71754, CAST(N'2022-01-16' AS Date), 40017, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71755, CAST(N'2022-01-10' AS Date), 40018, 70008, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71756, CAST(N'2022-01-07' AS Date), 40019, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71757, CAST(N'2022-01-18' AS Date), 40020, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71758, CAST(N'2022-03-02' AS Date), 40021, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71759, CAST(N'2022-03-09' AS Date), 40022, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71760, CAST(N'2022-02-05' AS Date), 40023, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71761, CAST(N'2022-02-12' AS Date), 40024, 70018, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71762, CAST(N'2022-01-01' AS Date), 40025, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71763, CAST(N'2022-02-24' AS Date), 40026, 70007, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71764, CAST(N'2022-01-29' AS Date), 40027, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71765, CAST(N'2022-02-06' AS Date), 40028, 70013, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71766, CAST(N'2022-02-22' AS Date), 40029, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71767, CAST(N'2022-02-23' AS Date), 40030, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71768, CAST(N'2022-01-11' AS Date), 40031, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71769, CAST(N'2022-02-20' AS Date), 40032, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71770, CAST(N'2022-03-04' AS Date), 40033, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71771, CAST(N'2022-01-24' AS Date), 40034, 70016, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71772, CAST(N'2022-02-28' AS Date), 40035, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71773, CAST(N'2022-02-15' AS Date), 40036, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71774, CAST(N'2022-01-12' AS Date), 40037, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71775, CAST(N'2022-02-09' AS Date), 40038, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71776, CAST(N'2022-03-03' AS Date), 40039, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71777, CAST(N'2022-01-24' AS Date), 40040, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71778, CAST(N'2022-02-28' AS Date), 40041, 70002, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71779, CAST(N'2022-01-13' AS Date), 40042, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71780, CAST(N'2022-01-01' AS Date), 40043, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71781, CAST(N'2022-01-14' AS Date), 40044, 70017, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71782, CAST(N'2022-01-30' AS Date), 40045, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71783, CAST(N'2022-02-19' AS Date), 40046, 70015, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71784, CAST(N'2022-01-17' AS Date), 40047, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71785, CAST(N'2022-01-23' AS Date), 40048, 70006, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71786, CAST(N'2022-01-20' AS Date), 40049, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71787, CAST(N'2022-01-21' AS Date), 40050, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71788, CAST(N'2022-01-10' AS Date), 40051, 70016, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71789, CAST(N'2022-02-25' AS Date), 40052, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71790, CAST(N'2022-03-04' AS Date), 40053, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71791, CAST(N'2022-03-03' AS Date), 40054, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71792, CAST(N'2022-01-10' AS Date), 40055, 70008, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71793, CAST(N'2022-02-17' AS Date), 40056, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71794, CAST(N'2022-02-12' AS Date), 40057, 70007, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71795, CAST(N'2022-01-02' AS Date), 40058, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71796, CAST(N'2022-03-06' AS Date), 40059, 70012, 4, 17, 68)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71797, CAST(N'2022-03-06' AS Date), 40060, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71798, CAST(N'2022-01-14' AS Date), 40061, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71799, CAST(N'2022-01-06' AS Date), 40062, 70002, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71800, CAST(N'2022-01-22' AS Date), 40063, 70020, 7, 11, 77)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71801, CAST(N'2022-02-26' AS Date), 40064, 70009, 7, 12, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71802, CAST(N'2022-02-18' AS Date), 40065, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71803, CAST(N'2022-01-22' AS Date), 40066, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71804, CAST(N'2022-03-07' AS Date), 40067, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71805, CAST(N'2022-01-25' AS Date), 40001, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71806, CAST(N'2022-02-19' AS Date), 40002, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71807, CAST(N'2022-03-04' AS Date), 40003, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71808, CAST(N'2022-01-31' AS Date), 40004, 70012, 6, 17, 102)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71809, CAST(N'2022-01-18' AS Date), 40005, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71810, CAST(N'2022-01-13' AS Date), 40006, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71811, CAST(N'2022-02-13' AS Date), 40007, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71812, CAST(N'2022-01-09' AS Date), 40008, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71813, CAST(N'2022-03-07' AS Date), 40009, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71814, CAST(N'2022-01-13' AS Date), 40010, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71815, CAST(N'2022-02-12' AS Date), 40011, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71816, CAST(N'2022-02-19' AS Date), 40012, 70020, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71817, CAST(N'2022-02-11' AS Date), 40013, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71818, CAST(N'2022-02-06' AS Date), 40014, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71819, CAST(N'2022-01-29' AS Date), 40015, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71820, CAST(N'2022-02-16' AS Date), 40016, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71821, CAST(N'2022-02-20' AS Date), 40017, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71822, CAST(N'2022-01-29' AS Date), 40018, 70008, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71823, CAST(N'2022-03-09' AS Date), 40019, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71824, CAST(N'2022-02-21' AS Date), 40020, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71825, CAST(N'2022-01-28' AS Date), 40021, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71826, CAST(N'2022-03-03' AS Date), 40022, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71827, CAST(N'2022-01-09' AS Date), 40023, 70014, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71828, CAST(N'2022-02-25' AS Date), 40024, 70018, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71829, CAST(N'2022-02-27' AS Date), 40025, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71830, CAST(N'2022-01-12' AS Date), 40026, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71831, CAST(N'2022-02-16' AS Date), 40027, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71832, CAST(N'2022-03-08' AS Date), 40028, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71833, CAST(N'2022-01-23' AS Date), 40029, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71834, CAST(N'2022-02-04' AS Date), 40030, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71835, CAST(N'2022-03-06' AS Date), 40031, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71836, CAST(N'2022-02-13' AS Date), 40032, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71837, CAST(N'2022-01-11' AS Date), 40033, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71838, CAST(N'2022-02-05' AS Date), 40034, 70016, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71839, CAST(N'2022-02-01' AS Date), 40035, 70010, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71840, CAST(N'2022-01-04' AS Date), 40036, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71841, CAST(N'2022-03-02' AS Date), 40037, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71842, CAST(N'2022-02-08' AS Date), 40038, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71843, CAST(N'2022-02-10' AS Date), 40039, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71844, CAST(N'2022-01-12' AS Date), 40040, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71845, CAST(N'2022-02-11' AS Date), 40041, 70002, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71846, CAST(N'2022-01-20' AS Date), 40042, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71847, CAST(N'2022-01-04' AS Date), 40043, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71848, CAST(N'2022-02-18' AS Date), 40044, 70017, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71849, CAST(N'2022-03-05' AS Date), 40045, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71850, CAST(N'2022-02-20' AS Date), 40046, 70015, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71851, CAST(N'2022-01-12' AS Date), 40047, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71852, CAST(N'2022-02-09' AS Date), 40048, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71853, CAST(N'2022-01-28' AS Date), 40049, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71854, CAST(N'2022-01-09' AS Date), 40050, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71855, CAST(N'2022-02-18' AS Date), 40051, 70016, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71856, CAST(N'2022-01-12' AS Date), 40052, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71857, CAST(N'2022-01-24' AS Date), 40053, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71858, CAST(N'2022-02-04' AS Date), 40054, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71859, CAST(N'2022-01-05' AS Date), 40055, 70008, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71860, CAST(N'2022-01-12' AS Date), 40056, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71861, CAST(N'2022-02-26' AS Date), 40057, 70007, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71862, CAST(N'2022-01-12' AS Date), 40058, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71863, CAST(N'2022-02-27' AS Date), 40059, 70012, 8, 17, 136)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71864, CAST(N'2022-02-24' AS Date), 40060, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71865, CAST(N'2022-03-08' AS Date), 40061, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71866, CAST(N'2022-03-08' AS Date), 40062, 70002, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71867, CAST(N'2022-02-17' AS Date), 40063, 70020, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71868, CAST(N'2022-03-02' AS Date), 40064, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71869, CAST(N'2022-02-18' AS Date), 40065, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71870, CAST(N'2022-01-24' AS Date), 40066, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71871, CAST(N'2022-02-16' AS Date), 40067, 70018, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71872, CAST(N'2022-01-11' AS Date), 40001, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71873, CAST(N'2022-03-06' AS Date), 40002, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71874, CAST(N'2022-02-22' AS Date), 40003, 70018, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71875, CAST(N'2022-01-26' AS Date), 40004, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71876, CAST(N'2022-02-23' AS Date), 40005, 70001, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71877, CAST(N'2022-01-07' AS Date), 40006, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71878, CAST(N'2022-01-20' AS Date), 40007, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71879, CAST(N'2022-02-02' AS Date), 40008, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71880, CAST(N'2022-01-12' AS Date), 40009, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71881, CAST(N'2022-02-22' AS Date), 40010, 70013, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71882, CAST(N'2022-01-28' AS Date), 40011, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71883, CAST(N'2022-01-28' AS Date), 40012, 70020, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71884, CAST(N'2022-03-04' AS Date), 40013, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71885, CAST(N'2022-02-20' AS Date), 40014, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71886, CAST(N'2022-02-16' AS Date), 40015, 70007, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71887, CAST(N'2022-01-08' AS Date), 40016, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71888, CAST(N'2022-01-06' AS Date), 40017, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71889, CAST(N'2022-03-01' AS Date), 40018, 70008, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71890, CAST(N'2022-02-10' AS Date), 40019, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71891, CAST(N'2022-03-10' AS Date), 40020, 70013, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71892, CAST(N'2022-03-05' AS Date), 40021, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71893, CAST(N'2022-02-16' AS Date), 40022, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71894, CAST(N'2022-01-14' AS Date), 40023, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71895, CAST(N'2022-01-17' AS Date), 40024, 70018, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71896, CAST(N'2022-02-04' AS Date), 40025, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71897, CAST(N'2022-03-09' AS Date), 40026, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71898, CAST(N'2022-02-07' AS Date), 40027, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71899, CAST(N'2022-01-21' AS Date), 40028, 70013, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71900, CAST(N'2022-01-10' AS Date), 40029, 70003, 7, 9, 63)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71901, CAST(N'2022-03-03' AS Date), 40030, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71902, CAST(N'2022-03-06' AS Date), 40031, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71903, CAST(N'2022-03-09' AS Date), 40032, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71904, CAST(N'2022-02-21' AS Date), 40033, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71905, CAST(N'2022-02-23' AS Date), 40034, 70016, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71906, CAST(N'2022-02-28' AS Date), 40035, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71907, CAST(N'2022-01-31' AS Date), 40036, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71908, CAST(N'2022-01-10' AS Date), 40037, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71909, CAST(N'2022-02-10' AS Date), 40038, 70005, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71910, CAST(N'2022-02-16' AS Date), 40039, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71911, CAST(N'2022-02-18' AS Date), 40040, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71912, CAST(N'2022-02-13' AS Date), 40041, 70002, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71913, CAST(N'2022-02-14' AS Date), 40042, 70014, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71914, CAST(N'2022-01-04' AS Date), 40043, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71915, CAST(N'2022-01-06' AS Date), 40044, 70017, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71916, CAST(N'2022-03-03' AS Date), 40045, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71917, CAST(N'2022-03-08' AS Date), 40046, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71918, CAST(N'2022-01-24' AS Date), 40047, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71919, CAST(N'2022-01-11' AS Date), 40048, 70006, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71920, CAST(N'2022-02-05' AS Date), 40049, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71921, CAST(N'2022-01-24' AS Date), 40050, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71922, CAST(N'2022-01-23' AS Date), 40051, 70016, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71923, CAST(N'2022-02-19' AS Date), 40052, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71924, CAST(N'2022-02-22' AS Date), 40053, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71925, CAST(N'2022-01-31' AS Date), 40054, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71926, CAST(N'2022-01-15' AS Date), 40055, 70008, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71927, CAST(N'2022-03-01' AS Date), 40056, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71928, CAST(N'2022-02-21' AS Date), 40057, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71929, CAST(N'2022-02-10' AS Date), 40058, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71930, CAST(N'2022-02-09' AS Date), 40059, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71931, CAST(N'2022-01-18' AS Date), 40060, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71932, CAST(N'2022-01-02' AS Date), 40061, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71933, CAST(N'2022-02-23' AS Date), 40062, 70002, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71934, CAST(N'2022-01-12' AS Date), 40063, 70020, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71935, CAST(N'2022-02-20' AS Date), 40064, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71936, CAST(N'2022-02-25' AS Date), 40065, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71937, CAST(N'2022-02-12' AS Date), 40066, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71938, CAST(N'2022-03-09' AS Date), 40067, 70018, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71939, CAST(N'2022-02-02' AS Date), 40001, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71940, CAST(N'2022-02-23' AS Date), 40002, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71941, CAST(N'2022-01-10' AS Date), 40003, 70018, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71942, CAST(N'2022-01-13' AS Date), 40004, 70012, 5, 17, 85)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71943, CAST(N'2022-02-08' AS Date), 40005, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71944, CAST(N'2022-01-12' AS Date), 40006, 70015, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71945, CAST(N'2022-01-30' AS Date), 40007, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71946, CAST(N'2022-02-01' AS Date), 40008, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71947, CAST(N'2022-02-23' AS Date), 40009, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71948, CAST(N'2022-02-12' AS Date), 40010, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71949, CAST(N'2022-03-07' AS Date), 40011, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71950, CAST(N'2022-02-02' AS Date), 40012, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71951, CAST(N'2022-01-20' AS Date), 40013, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71952, CAST(N'2022-02-26' AS Date), 40014, 70006, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71953, CAST(N'2022-02-06' AS Date), 40015, 70007, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71954, CAST(N'2022-02-26' AS Date), 40016, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71955, CAST(N'2022-02-22' AS Date), 40017, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71956, CAST(N'2022-01-04' AS Date), 40018, 70008, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71957, CAST(N'2022-01-09' AS Date), 40019, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71958, CAST(N'2022-03-01' AS Date), 40020, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71959, CAST(N'2022-02-03' AS Date), 40021, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71960, CAST(N'2022-03-08' AS Date), 40022, 70010, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71961, CAST(N'2022-02-04' AS Date), 40023, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71962, CAST(N'2022-03-10' AS Date), 40024, 70018, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71963, CAST(N'2022-02-01' AS Date), 40025, 70001, 3, 10, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71964, CAST(N'2022-02-24' AS Date), 40026, 70007, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71965, CAST(N'2022-01-06' AS Date), 40027, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71966, CAST(N'2022-01-09' AS Date), 40028, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71967, CAST(N'2022-02-03' AS Date), 40029, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71968, CAST(N'2022-02-27' AS Date), 40030, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71969, CAST(N'2022-02-27' AS Date), 40031, 70009, 2, 12, 24)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71970, CAST(N'2022-01-06' AS Date), 40032, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71971, CAST(N'2022-01-11' AS Date), 40033, 70009, 7, 12, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71972, CAST(N'2022-02-15' AS Date), 40034, 70016, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71973, CAST(N'2022-01-01' AS Date), 40035, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71974, CAST(N'2022-02-25' AS Date), 40036, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71975, CAST(N'2022-02-08' AS Date), 40037, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71976, CAST(N'2022-02-03' AS Date), 40038, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71977, CAST(N'2022-02-12' AS Date), 40039, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71978, CAST(N'2022-02-10' AS Date), 40040, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71979, CAST(N'2022-02-18' AS Date), 40041, 70002, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71980, CAST(N'2022-02-13' AS Date), 40042, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71981, CAST(N'2022-02-08' AS Date), 40043, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71982, CAST(N'2022-02-16' AS Date), 40044, 70017, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71983, CAST(N'2022-01-01' AS Date), 40045, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71984, CAST(N'2022-01-29' AS Date), 40046, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71985, CAST(N'2022-02-27' AS Date), 40047, 70010, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71986, CAST(N'2022-02-07' AS Date), 40048, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71987, CAST(N'2022-01-26' AS Date), 40049, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71988, CAST(N'2022-03-08' AS Date), 40050, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71989, CAST(N'2022-01-15' AS Date), 40051, 70016, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71990, CAST(N'2022-01-07' AS Date), 40052, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71991, CAST(N'2022-02-11' AS Date), 40053, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71992, CAST(N'2022-01-23' AS Date), 40054, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71993, CAST(N'2022-01-17' AS Date), 40055, 70008, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71994, CAST(N'2022-02-18' AS Date), 40056, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71995, CAST(N'2022-01-28' AS Date), 40057, 70007, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71996, CAST(N'2022-01-26' AS Date), 40058, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71997, CAST(N'2022-03-01' AS Date), 40059, 70012, 8, 17, 136)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71998, CAST(N'2022-03-04' AS Date), 40060, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (71999, CAST(N'2022-01-10' AS Date), 40061, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72000, CAST(N'2022-03-01' AS Date), 40062, 70002, 1, 9, 9)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72001, CAST(N'2022-01-02' AS Date), 40063, 70020, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72002, CAST(N'2022-03-06' AS Date), 40064, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72003, CAST(N'2022-03-06' AS Date), 40065, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72004, CAST(N'2022-01-14' AS Date), 40066, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72005, CAST(N'2022-01-06' AS Date), 40067, 70018, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72006, CAST(N'2022-01-22' AS Date), 40001, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72007, CAST(N'2022-02-26' AS Date), 40002, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72008, CAST(N'2022-02-18' AS Date), 40003, 70018, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72009, CAST(N'2022-01-22' AS Date), 40004, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72010, CAST(N'2022-03-07' AS Date), 40005, 70001, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72011, CAST(N'2022-01-25' AS Date), 40006, 70015, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72012, CAST(N'2022-02-19' AS Date), 40007, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72013, CAST(N'2022-03-04' AS Date), 40008, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72014, CAST(N'2022-01-31' AS Date), 40009, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72015, CAST(N'2022-01-18' AS Date), 40010, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72016, CAST(N'2022-01-13' AS Date), 40011, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72017, CAST(N'2022-02-13' AS Date), 40012, 70020, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72018, CAST(N'2022-01-09' AS Date), 40013, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72019, CAST(N'2022-03-07' AS Date), 40014, 70006, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72020, CAST(N'2022-01-13' AS Date), 40015, 70007, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72021, CAST(N'2022-02-12' AS Date), 40016, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72022, CAST(N'2022-02-19' AS Date), 40017, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72023, CAST(N'2022-02-11' AS Date), 40018, 70008, 7, 11, 77)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72024, CAST(N'2022-02-06' AS Date), 40019, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72025, CAST(N'2022-01-29' AS Date), 40020, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72026, CAST(N'2022-02-16' AS Date), 40021, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72027, CAST(N'2022-02-20' AS Date), 40022, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72028, CAST(N'2022-01-29' AS Date), 40023, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72029, CAST(N'2022-03-09' AS Date), 40024, 70018, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72030, CAST(N'2022-02-21' AS Date), 40025, 70001, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72031, CAST(N'2022-01-28' AS Date), 40026, 70007, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72032, CAST(N'2022-03-03' AS Date), 40027, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72033, CAST(N'2022-01-09' AS Date), 40028, 70013, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72034, CAST(N'2022-02-25' AS Date), 40029, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72035, CAST(N'2022-02-27' AS Date), 40030, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72036, CAST(N'2022-01-12' AS Date), 40031, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72037, CAST(N'2022-02-16' AS Date), 40032, 70013, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72038, CAST(N'2022-03-08' AS Date), 40033, 70009, 3, 12, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72039, CAST(N'2022-01-23' AS Date), 40034, 70016, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72040, CAST(N'2022-02-04' AS Date), 40035, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72041, CAST(N'2022-03-06' AS Date), 40036, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72042, CAST(N'2022-02-13' AS Date), 40037, 70001, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72043, CAST(N'2022-01-11' AS Date), 40038, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72044, CAST(N'2022-02-05' AS Date), 40039, 70005, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72045, CAST(N'2022-02-01' AS Date), 40040, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72046, CAST(N'2022-01-04' AS Date), 40041, 70002, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72047, CAST(N'2022-03-02' AS Date), 40042, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72048, CAST(N'2022-02-08' AS Date), 40043, 70003, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72049, CAST(N'2022-02-10' AS Date), 40044, 70017, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72050, CAST(N'2022-01-12' AS Date), 40045, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72051, CAST(N'2022-02-11' AS Date), 40046, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72052, CAST(N'2022-01-20' AS Date), 40047, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72053, CAST(N'2022-01-04' AS Date), 40048, 70006, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72054, CAST(N'2022-02-18' AS Date), 40049, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72055, CAST(N'2022-03-05' AS Date), 40050, 70011, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72056, CAST(N'2022-02-20' AS Date), 40051, 70016, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72057, CAST(N'2022-01-12' AS Date), 40052, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72058, CAST(N'2022-02-09' AS Date), 40053, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72059, CAST(N'2022-01-28' AS Date), 40054, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72060, CAST(N'2022-01-09' AS Date), 40055, 70008, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72061, CAST(N'2022-02-18' AS Date), 40056, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72062, CAST(N'2022-01-12' AS Date), 40057, 70007, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72063, CAST(N'2022-01-24' AS Date), 40058, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72064, CAST(N'2022-02-04' AS Date), 40059, 70012, 8, 17, 136)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72065, CAST(N'2022-01-05' AS Date), 40060, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72066, CAST(N'2022-01-12' AS Date), 40061, 70011, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72067, CAST(N'2022-02-26' AS Date), 40062, 70002, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72068, CAST(N'2022-01-12' AS Date), 40063, 70020, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72069, CAST(N'2022-02-27' AS Date), 40064, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72070, CAST(N'2022-02-24' AS Date), 40065, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72071, CAST(N'2022-03-08' AS Date), 40066, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72072, CAST(N'2022-03-08' AS Date), 40067, 70018, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72073, CAST(N'2022-02-17' AS Date), 40001, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72074, CAST(N'2022-03-02' AS Date), 40002, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72075, CAST(N'2022-02-18' AS Date), 40003, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72076, CAST(N'2022-01-24' AS Date), 40004, 70012, 5, 17, 85)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72077, CAST(N'2022-02-16' AS Date), 40005, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72078, CAST(N'2022-01-11' AS Date), 40006, 70015, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72079, CAST(N'2022-03-06' AS Date), 40007, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72080, CAST(N'2022-02-22' AS Date), 40008, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72081, CAST(N'2022-01-26' AS Date), 40009, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72082, CAST(N'2022-02-23' AS Date), 40010, 70013, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72083, CAST(N'2022-01-07' AS Date), 40011, 70011, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72084, CAST(N'2022-01-20' AS Date), 40012, 70020, 6, 11, 66)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72085, CAST(N'2022-02-02' AS Date), 40013, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72086, CAST(N'2022-01-12' AS Date), 40014, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72087, CAST(N'2022-02-22' AS Date), 40015, 70007, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72088, CAST(N'2022-01-28' AS Date), 40016, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72089, CAST(N'2022-01-28' AS Date), 40017, 70005, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72090, CAST(N'2022-03-04' AS Date), 40018, 70008, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72091, CAST(N'2022-02-20' AS Date), 40019, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72092, CAST(N'2022-02-16' AS Date), 40020, 70013, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72093, CAST(N'2022-01-08' AS Date), 40021, 70010, 2, 15, 30)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72094, CAST(N'2022-01-06' AS Date), 40022, 70010, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72095, CAST(N'2022-03-01' AS Date), 40023, 70014, 7, 14, 98)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72096, CAST(N'2022-02-10' AS Date), 40024, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72097, CAST(N'2022-03-10' AS Date), 40025, 70001, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72098, CAST(N'2022-03-05' AS Date), 40026, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72099, CAST(N'2022-02-16' AS Date), 40027, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72100, CAST(N'2022-01-14' AS Date), 40028, 70013, 2, 14, 28)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72101, CAST(N'2022-01-17' AS Date), 40029, 70003, 8, 9, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72102, CAST(N'2022-02-04' AS Date), 40030, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72103, CAST(N'2022-03-09' AS Date), 40031, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72104, CAST(N'2022-02-07' AS Date), 40032, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72105, CAST(N'2022-01-21' AS Date), 40033, 70009, 7, 12, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72106, CAST(N'2022-01-10' AS Date), 40034, 70016, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72107, CAST(N'2022-03-03' AS Date), 40035, 70010, 3, 15, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72108, CAST(N'2022-03-06' AS Date), 40036, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72109, CAST(N'2022-03-09' AS Date), 40037, 70001, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72110, CAST(N'2022-02-21' AS Date), 40038, 70005, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72111, CAST(N'2022-02-23' AS Date), 40039, 70005, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72112, CAST(N'2022-02-28' AS Date), 40040, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72113, CAST(N'2022-01-31' AS Date), 40041, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72114, CAST(N'2022-01-10' AS Date), 40042, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72115, CAST(N'2022-02-10' AS Date), 40043, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72116, CAST(N'2022-02-16' AS Date), 40044, 70017, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72117, CAST(N'2022-02-18' AS Date), 40045, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72118, CAST(N'2022-02-13' AS Date), 40046, 70015, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72119, CAST(N'2022-02-14' AS Date), 40047, 70010, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72120, CAST(N'2022-01-04' AS Date), 40048, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72121, CAST(N'2022-01-06' AS Date), 40049, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72122, CAST(N'2022-03-03' AS Date), 40050, 70011, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72123, CAST(N'2022-03-08' AS Date), 40051, 70016, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72124, CAST(N'2022-01-24' AS Date), 40052, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72125, CAST(N'2022-01-11' AS Date), 40053, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72126, CAST(N'2022-02-05' AS Date), 40054, 70009, 5, 12, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72127, CAST(N'2022-01-24' AS Date), 40055, 70008, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72128, CAST(N'2022-01-23' AS Date), 40056, 70005, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72129, CAST(N'2022-02-19' AS Date), 40057, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72130, CAST(N'2022-02-22' AS Date), 40058, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72131, CAST(N'2022-01-31' AS Date), 40059, 70012, 4, 17, 68)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72132, CAST(N'2022-01-15' AS Date), 40060, 70019, 7, 10, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72133, CAST(N'2022-03-01' AS Date), 40061, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72134, CAST(N'2022-02-21' AS Date), 40062, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72135, CAST(N'2022-02-10' AS Date), 40063, 70020, 8, 11, 88)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72136, CAST(N'2022-02-09' AS Date), 40064, 70009, 1, 12, 12)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72137, CAST(N'2022-01-18' AS Date), 40065, 70003, 6, 9, 54)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72138, CAST(N'2022-01-02' AS Date), 40066, 70014, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72139, CAST(N'2022-02-23' AS Date), 40067, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72140, CAST(N'2022-01-12' AS Date), 40001, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72141, CAST(N'2022-02-20' AS Date), 40002, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72142, CAST(N'2022-02-25' AS Date), 40003, 70018, 3, 11, 33)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72143, CAST(N'2022-02-12' AS Date), 40004, 70012, 3, 17, 51)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72144, CAST(N'2022-03-09' AS Date), 40005, 70001, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72145, CAST(N'2022-02-02' AS Date), 40006, 70015, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72146, CAST(N'2022-02-23' AS Date), 40007, 70014, 4, 14, 56)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72147, CAST(N'2022-01-10' AS Date), 40008, 70019, 2, 10, 20)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72148, CAST(N'2022-01-13' AS Date), 40009, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72149, CAST(N'2022-02-08' AS Date), 40010, 70013, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72150, CAST(N'2022-01-12' AS Date), 40011, 70011, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72151, CAST(N'2022-01-30' AS Date), 40012, 70020, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72152, CAST(N'2022-02-01' AS Date), 40013, 70003, 4, 9, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72153, CAST(N'2022-02-23' AS Date), 40014, 70006, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72154, CAST(N'2022-02-12' AS Date), 40015, 70007, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72155, CAST(N'2022-03-07' AS Date), 40016, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72156, CAST(N'2022-02-02' AS Date), 40017, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72157, CAST(N'2022-01-20' AS Date), 40018, 70008, 2, 11, 22)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72158, CAST(N'2022-02-26' AS Date), 40019, 70003, 3, 9, 27)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72159, CAST(N'2022-02-06' AS Date), 40020, 70013, 2, 14, 28)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72160, CAST(N'2022-02-26' AS Date), 40021, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72161, CAST(N'2022-02-22' AS Date), 40022, 70010, 5, 15, 75)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72162, CAST(N'2022-01-04' AS Date), 40023, 70014, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72163, CAST(N'2022-01-09' AS Date), 40024, 70018, 5, 11, 55)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72164, CAST(N'2022-03-01' AS Date), 40025, 70001, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72165, CAST(N'2022-02-03' AS Date), 40026, 70007, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72166, CAST(N'2022-03-08' AS Date), 40027, 70009, 4, 12, 48)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72167, CAST(N'2022-02-04' AS Date), 40028, 70013, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72168, CAST(N'2022-03-10' AS Date), 40029, 70003, 1, 9, 9)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72169, CAST(N'2022-02-01' AS Date), 40030, 70019, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72170, CAST(N'2022-02-24' AS Date), 40031, 70009, 8, 12, 96)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72171, CAST(N'2022-01-06' AS Date), 40032, 70013, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72172, CAST(N'2022-01-09' AS Date), 40033, 70009, 6, 12, 72)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72173, CAST(N'2022-02-03' AS Date), 40034, 70016, 3, 14, 42)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72174, CAST(N'2022-02-27' AS Date), 40035, 70010, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72175, CAST(N'2022-02-27' AS Date), 40036, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72176, CAST(N'2022-01-06' AS Date), 40037, 70001, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72177, CAST(N'2022-01-11' AS Date), 40038, 70005, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72178, CAST(N'2022-02-15' AS Date), 40039, 70005, 6, 15, 90)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72179, CAST(N'2022-01-01' AS Date), 40040, 70019, 6, 10, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72180, CAST(N'2022-02-25' AS Date), 40041, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72181, CAST(N'2022-02-08' AS Date), 40042, 70014, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72182, CAST(N'2022-02-03' AS Date), 40043, 70003, 5, 9, 45)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72183, CAST(N'2022-02-12' AS Date), 40044, 70017, 4, 10, 40)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72184, CAST(N'2022-02-10' AS Date), 40045, 70014, 8, 14, 112)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72185, CAST(N'2022-02-18' AS Date), 40046, 70015, 4, 15, 60)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72186, CAST(N'2022-02-13' AS Date), 40047, 70010, 7, 15, 105)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72187, CAST(N'2022-02-08' AS Date), 40048, 70006, 8, 15, 120)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72188, CAST(N'2022-02-16' AS Date), 40049, 70001, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72189, CAST(N'2022-01-01' AS Date), 40050, 70011, 5, 14, 70)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72190, CAST(N'2022-01-29' AS Date), 40051, 70016, 6, 14, 84)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72191, CAST(N'2022-02-27' AS Date), 40052, 70019, 1, 10, 10)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72192, CAST(N'2022-02-07' AS Date), 40053, 70019, 8, 10, 80)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72193, CAST(N'2022-01-26' AS Date), 40054, 70009, 3, 12, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72194, CAST(N'2022-03-08' AS Date), 40055, 70008, 4, 11, 44)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72195, CAST(N'2022-01-15' AS Date), 40056, 70005, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72196, CAST(N'2022-01-07' AS Date), 40057, 70007, 1, 15, 15)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72197, CAST(N'2022-02-11' AS Date), 40058, 70011, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72198, CAST(N'2022-01-23' AS Date), 40059, 70012, 4, 17, 68)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72199, CAST(N'2022-01-17' AS Date), 40060, 70019, 5, 10, 50)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72200, CAST(N'2022-02-18' AS Date), 40061, 70011, 4, 14, 56)
GO
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72201, CAST(N'2022-01-28' AS Date), 40062, 70002, 2, 9, 18)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72202, CAST(N'2022-01-26' AS Date), 40063, 70020, 1, 11, 11)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72203, CAST(N'2022-03-01' AS Date), 40064, 70009, 3, 12, 36)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72204, CAST(N'2022-03-04' AS Date), 40065, 70003, 7, 9, 63)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72205, CAST(N'2022-01-10' AS Date), 40066, 70014, 1, 14, 14)
INSERT [dbo].[DailySales] ([SalesID], [SalesDate], [ConnectionID], [ProductID], [Quantity], [SellingUnitPrice], [TotalPrice]) VALUES (72206, CAST(N'2022-03-01' AS Date), 40067, 70018, 1, 11, 11)
GO
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80001, N'Axe')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80002, N'Rake')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80003, N'Pruning Saw')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80004, N'Shavel')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80005, N'Hedge Shear')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80006, N'Gardening Fork')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80007, N'Pruning Shears')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80008, N'Garden Trowel')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80009, N'Boots')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80010, N'Wheelbarrow')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80011, N'Lawn Mover')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80012, N'Watering Can')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (80013, N'Gardening Horse')
GO
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81001, 80006, 1, CAST(N'2022-02-27' AS Date), 30006)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81002, 80012, 14, CAST(N'2021-04-11' AS Date), 30009)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81003, 80007, 6, CAST(N'2021-01-10' AS Date), 30004)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81004, 80010, 8, CAST(N'2021-12-13' AS Date), 30004)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81005, 80011, 9, CAST(N'2021-09-17' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81006, 80008, 11, CAST(N'2022-02-14' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81007, 80012, 3, CAST(N'2022-02-08' AS Date), 30002)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81008, 80006, 9, CAST(N'2022-02-19' AS Date), 30002)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81009, 80001, 6, CAST(N'2021-12-25' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81010, 80010, 14, CAST(N'2021-05-17' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81011, 80007, 2, CAST(N'2021-06-05' AS Date), 30007)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81012, 80005, 3, CAST(N'2021-11-05' AS Date), 30006)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81013, 80009, 12, CAST(N'2021-08-11' AS Date), 30001)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81014, 80009, 5, CAST(N'2021-06-18' AS Date), 30002)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81015, 80004, 5, CAST(N'2021-10-31' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81016, 80004, 1, CAST(N'2021-06-14' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81017, 80011, 14, CAST(N'2022-02-20' AS Date), 30003)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81018, 80003, 15, CAST(N'2021-08-12' AS Date), 30002)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81019, 80002, 9, CAST(N'2021-02-01' AS Date), 30004)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81020, 80004, 12, CAST(N'2021-01-28' AS Date), 30003)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81021, 80009, 12, CAST(N'2021-03-05' AS Date), 30004)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81022, 80011, 8, CAST(N'2021-04-15' AS Date), 30007)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81023, 80009, 7, CAST(N'2022-01-30' AS Date), 30009)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81024, 80013, 4, CAST(N'2021-07-29' AS Date), 30003)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81025, 80012, 7, CAST(N'2021-07-19' AS Date), 30002)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81026, 80005, 11, CAST(N'2021-04-15' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81027, 80001, 4, CAST(N'2021-11-30' AS Date), 30007)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81028, 80002, 12, CAST(N'2021-08-13' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81029, 80001, 6, CAST(N'2021-10-25' AS Date), 30003)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81030, 80002, 6, CAST(N'2021-03-20' AS Date), 30001)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81031, 80002, 11, CAST(N'2021-01-09' AS Date), 30003)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81032, 80013, 4, CAST(N'2021-07-14' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81033, 80010, 11, CAST(N'2021-01-15' AS Date), 30006)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81034, 80006, 8, CAST(N'2021-01-20' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81035, 80007, 2, CAST(N'2021-04-29' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81036, 80002, 3, CAST(N'2021-10-25' AS Date), 30003)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81037, 80008, 14, CAST(N'2021-08-11' AS Date), 30008)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81038, 80004, 10, CAST(N'2021-03-06' AS Date), 30009)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81039, 80010, 6, CAST(N'2021-12-29' AS Date), 30007)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81040, 80002, 10, CAST(N'2022-02-14' AS Date), 30004)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81041, 80004, 14, CAST(N'2021-04-10' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81042, 80006, 12, CAST(N'2021-08-28' AS Date), 30006)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81043, 80008, 8, CAST(N'2021-01-07' AS Date), 30001)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81044, 80005, 4, CAST(N'2021-04-30' AS Date), 30001)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81045, 80010, 13, CAST(N'2021-06-22' AS Date), 30001)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81046, 80008, 14, CAST(N'2021-10-22' AS Date), 30009)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81047, 80013, 9, CAST(N'2022-02-27' AS Date), 30002)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81048, 80001, 5, CAST(N'2021-04-22' AS Date), 30005)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81049, 80011, 12, CAST(N'2022-02-02' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81050, 80007, 3, CAST(N'2022-01-24' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81051, 80009, 3, CAST(N'2021-09-16' AS Date), 30007)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81052, 80002, 9, CAST(N'2021-10-22' AS Date), 30009)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81053, 80005, 11, CAST(N'2022-02-03' AS Date), 30006)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81054, 80013, 9, CAST(N'2022-01-17' AS Date), 30004)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81055, 80006, 6, CAST(N'2021-08-26' AS Date), 30003)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81056, 80008, 4, CAST(N'2021-01-02' AS Date), 30006)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81057, 80007, 4, CAST(N'2021-06-30' AS Date), 30009)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81058, 80010, 1, CAST(N'2021-07-28' AS Date), 30007)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81059, 80006, 3, CAST(N'2021-10-23' AS Date), 30001)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81060, 80010, 8, CAST(N'2021-04-16' AS Date), 30006)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81061, 80007, 13, CAST(N'2021-03-28' AS Date), 30001)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81062, 80013, 6, CAST(N'2021-10-09' AS Date), 30009)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81063, 80002, 3, CAST(N'2021-08-13' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81064, 80005, 7, CAST(N'2022-01-22' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81065, 80004, 12, CAST(N'2021-11-02' AS Date), 30010)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81066, 80013, 15, CAST(N'2021-06-10' AS Date), 30007)
INSERT [dbo].[EquipmentRegistry] ([EquipmentRegID], [EquipmentID], [EquipmentQuantity], [PurchaseDate], [LandID]) VALUES (81067, 80002, 4, CAST(N'2021-10-04' AS Date), 30008)
GO
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91001, 90011, 1, CAST(N'2021-09-03' AS Date), 30001)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91002, 90003, 15, CAST(N'2021-09-12' AS Date), 30004)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91003, 90007, 8, CAST(N'2021-12-17' AS Date), 30002)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91004, 90009, 13, CAST(N'2021-08-27' AS Date), 30003)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91005, 90004, 6, CAST(N'2022-01-02' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91006, 90005, 1, CAST(N'2021-04-08' AS Date), 30004)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91007, 90004, 9, CAST(N'2021-11-24' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91008, 90011, 13, CAST(N'2021-04-08' AS Date), 30001)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91009, 90003, 10, CAST(N'2021-11-11' AS Date), 30002)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91010, 90008, 10, CAST(N'2021-04-14' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91011, 90008, 2, CAST(N'2021-10-21' AS Date), 30003)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91012, 90007, 3, CAST(N'2021-10-26' AS Date), 30002)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91013, 90003, 3, CAST(N'2021-09-19' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91014, 90002, 5, CAST(N'2022-01-20' AS Date), 30010)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91015, 90002, 1, CAST(N'2021-12-17' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91016, 90001, 9, CAST(N'2021-01-05' AS Date), 30003)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91017, 90003, 11, CAST(N'2021-05-02' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91018, 90004, 12, CAST(N'2021-09-21' AS Date), 30010)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91019, 90008, 8, CAST(N'2021-04-14' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91020, 90002, 2, CAST(N'2022-01-01' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91021, 90006, 8, CAST(N'2021-09-21' AS Date), 30010)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91022, 90006, 3, CAST(N'2021-12-21' AS Date), 30004)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91023, 90011, 12, CAST(N'2021-03-25' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91024, 90007, 4, CAST(N'2021-11-13' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91025, 90004, 7, CAST(N'2021-08-02' AS Date), 30001)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91026, 90003, 12, CAST(N'2021-04-07' AS Date), 30006)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91027, 90001, 9, CAST(N'2022-01-15' AS Date), 30010)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91028, 90009, 3, CAST(N'2022-01-02' AS Date), 30007)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91029, 90001, 9, CAST(N'2022-02-24' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91030, 90003, 2, CAST(N'2021-03-02' AS Date), 30007)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91031, 90007, 13, CAST(N'2022-01-23' AS Date), 30001)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91032, 90011, 4, CAST(N'2021-05-18' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91033, 90011, 3, CAST(N'2021-03-04' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91034, 90001, 9, CAST(N'2021-10-30' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91035, 90004, 2, CAST(N'2021-01-15' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91036, 90004, 2, CAST(N'2021-01-29' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91037, 90011, 12, CAST(N'2021-02-16' AS Date), 30010)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91038, 90001, 5, CAST(N'2021-02-06' AS Date), 30006)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91039, 90009, 12, CAST(N'2021-09-13' AS Date), 30001)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91040, 90008, 12, CAST(N'2022-02-01' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91041, 90005, 3, CAST(N'2021-05-16' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91042, 90009, 7, CAST(N'2021-10-04' AS Date), 30010)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91043, 90005, 1, CAST(N'2021-04-16' AS Date), 30004)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91044, 90008, 2, CAST(N'2021-10-20' AS Date), 30006)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91045, 90010, 1, CAST(N'2021-08-04' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91046, 90008, 14, CAST(N'2022-03-02' AS Date), 30002)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91047, 90009, 10, CAST(N'2021-03-13' AS Date), 30001)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91048, 90006, 10, CAST(N'2021-09-18' AS Date), 30003)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91049, 90001, 2, CAST(N'2021-12-07' AS Date), 30003)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91050, 90011, 11, CAST(N'2021-12-04' AS Date), 30002)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91051, 90006, 7, CAST(N'2021-02-24' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91052, 90008, 4, CAST(N'2021-07-08' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91053, 90011, 3, CAST(N'2021-06-21' AS Date), 30006)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91054, 90006, 2, CAST(N'2021-08-18' AS Date), 30001)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91055, 90002, 11, CAST(N'2021-03-16' AS Date), 30003)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91056, 90008, 3, CAST(N'2021-05-07' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91057, 90001, 15, CAST(N'2021-09-28' AS Date), 30007)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91058, 90007, 5, CAST(N'2021-08-30' AS Date), 30005)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91059, 90007, 2, CAST(N'2021-12-13' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91060, 90010, 1, CAST(N'2022-01-31' AS Date), 30004)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91061, 90004, 1, CAST(N'2021-04-11' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91062, 90002, 13, CAST(N'2021-02-20' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91063, 90009, 3, CAST(N'2021-07-20' AS Date), 30008)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91064, 90011, 4, CAST(N'2021-07-07' AS Date), 30002)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91065, 90004, 15, CAST(N'2022-01-16' AS Date), 30007)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91066, 90005, 6, CAST(N'2021-10-06' AS Date), 30004)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91067, 90003, 1, CAST(N'2021-06-02' AS Date), 30009)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91068, 90006, 4, CAST(N'2022-01-09' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91069, 90008, 12, CAST(N'2022-01-06' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91070, 90007, 4, CAST(N'2021-01-22' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91071, 90002, 8, CAST(N'2021-12-14' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91072, 90006, 8, CAST(N'2021-05-11' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91073, 90011, 15, CAST(N'2021-01-05' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91074, 90003, 13, CAST(N'2021-02-09' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91075, 90010, 9, CAST(N'2021-08-25' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91076, 90010, 11, CAST(N'2022-02-02' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91077, 90010, 7, CAST(N'2021-11-21' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91078, 90007, 14, CAST(N'2021-06-26' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91079, 90010, 12, CAST(N'2021-12-20' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91080, 90003, 13, CAST(N'2021-06-16' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91081, 90009, 12, CAST(N'2021-02-20' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91082, 90009, 5, CAST(N'2021-08-15' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91083, 90003, 14, CAST(N'2021-01-28' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91084, 90011, 1, CAST(N'2021-05-28' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91085, 90004, 1, CAST(N'2021-04-21' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91086, 90006, 10, CAST(N'2021-06-01' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91087, 90008, 8, CAST(N'2021-06-13' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91088, 90007, 2, CAST(N'2021-07-12' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91089, 90001, 6, CAST(N'2021-05-11' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91090, 90011, 3, CAST(N'2021-04-25' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91091, 90011, 6, CAST(N'2021-05-27' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91092, 90005, 2, CAST(N'2021-06-16' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91093, 90009, 4, CAST(N'2021-04-30' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91094, 90008, 7, CAST(N'2022-01-11' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91095, 90001, 12, CAST(N'2021-02-01' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91096, 90011, 9, CAST(N'2021-09-11' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91097, 90011, 6, CAST(N'2022-02-21' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91098, 90010, 13, CAST(N'2021-05-05' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91099, 90002, 2, CAST(N'2021-03-24' AS Date), NULL)
INSERT [dbo].[FertilizerRegistry] ([FertilizerRegID], [FetilizerID], [FertilizerQuantity], [PurchasedDate], [LandID]) VALUES (91100, 90002, 8, CAST(N'2021-12-15' AS Date), NULL)
GO
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90001, N'Ammonium Nitrate')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90002, N'Calcium Ammonium Nitrate')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90003, N'Urea Ammonium Nitrate')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90004, N'Ammonium Sulphate')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90005, N'Ammonium Sulphate Nitrate')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90006, N'Single Superphosphate')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90007, N'Di-ammonium Phosphate')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90008, N'Ammonium Polyphosphate Liquid')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90009, N'Potassium Chloride')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90010, N'Potassium Sulphate ')
INSERT [dbo].[Fertilizers] ([FertilizerID], [FertilizerName]) VALUES (90011, N'Sulphate of Potash')
GO
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51001, N'Green Apple')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51002, N'Guava')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51003, N'Mandarin')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51004, N'Strawberries')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51005, N'Kiwifruit')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51006, N'Dragonfruit')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51007, N'Watermelon')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51008, N'Mango')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51009, N'Red Apple')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51010, N'Papaya')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51011, N'Passion fruit')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51012, N'Banana')
INSERT [dbo].[Fruits] ([FruitID], [FruitName]) VALUES (51013, N'Avacado')
GO
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30001, 30, N'Dry', N'Smith Wills', 3743839, N'Edinburgh')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30002, 45, N'Dry', N'Kelli Wilks', 3439494, N'Edinburgh')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30003, 100, N'Wet', N'Peter Thompson', 4839400, N'St. Andrews')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30004, 150, N'Dry', N'Kamal Hassan', 3849394, N'Aberdeen')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30005, 140, N'Wet', N'Toni Briggs', 3949384, N'Stirling')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30006, 80, N'Wet', N'Ivan Smith', 303043, N'Inverness')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30007, 90, N'Dry', N'Kinsley Bags', 2930383, N'Aberdeen')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30008, 135, N'Dry', N'Kelli Wilks', 3439494, N'Edinburgh')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30009, 70, N'Dry', N'Kinsley Bags', 39303, N'Aberdeen')
INSERT [dbo].[Lands] ([LandID], [LandSizeHec], [LandType], [LandOwner], [LandContact], [LandLocation]) VALUES (30010, 56, N'Wet', N'Kaysey Dilpe', 3930303, N'Stirling')
GO
INSERT [dbo].[NutritionType] ([NutritionID], [NutritionDescription]) VALUES (60001, N'Low Calories')
INSERT [dbo].[NutritionType] ([NutritionID], [NutritionDescription]) VALUES (60002, N'Medium Calories')
INSERT [dbo].[NutritionType] ([NutritionID], [NutritionDescription]) VALUES (60003, N'High Calories')
GO
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70001, N'Low Calories Mix 1', 51003, 52009, 60001, N'Bag', 0, 7)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70002, N'Low Calories Mix 2', 51002, 52005, 60001, N'Bag', 0, 6)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70003, N'Low Calories Mix 3', 51004, 52002, 60001, N'Bag', 0, 6)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70004, N'Low Calories Mix 4', 51005, 52009, 60001, N'Bag', 0, 9)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70005, N'Low Calories Mix 5', 51003, 52009, 60001, N'Bag', 0, 9)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70006, N'Low Calories Mix 6', 51001, 52007, 60001, N'Bag', 0, 9)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70007, N'Low Calories Mix 6', 51003, 52009, 60001, N'Bag', 0, 9)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70008, N'Medium Calories Mix 1', 51009, 52002, 60002, N'Bag', 0, 7)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70009, N'Medium Calories Mix 2', 51008, 52009, 60002, N'Bag', 0, 7)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70010, N'Medium Calories Mix 3', 51008, 52006, 60002, N'Bag', 0, 9)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70011, N'Medium Calories Mix 4', 51007, 52002, 60002, N'Bag', 0, 8)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70012, N'Medium Calories Mix 5', 51009, 52002, 60002, N'Bag', 0, 8)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70013, N'Medium Calories Mix 6', 51008, 52001, 60002, N'Bag', 0, 8)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70014, N'High Calories Mix 1', 51012, 52007, 60003, N'Bag', 0, 8)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70015, N'High Calories Mix 2', 51013, 52005, 60003, N'Bag', 0, 8)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70016, N'High Calories Mix 3', 51013, 52001, 60003, N'Bag', 0, 8)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70017, N'High Calories Mix 4', 51013, 52007, 60003, N'Bag', 0, 7)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70018, N'Random Mix 1', 51003, 52007, 60001, N'Bag', 0, 7)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70019, N'Random Mix 2', 51007, 52007, 60002, N'Bag', 0, 6)
INSERT [dbo].[Products] ([ProductID], [ProductDescription], [FruitID], [VegitableID], [NutritionID], [UOM], [WeightKG], [AVGCost]) VALUES (70020, N'Random Mix 3', 51008, 52005, 60003, N'Bag', 0, 7)
GO
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10001, N'Raf Neils', 36, N'09 Waidya RD', N'Aberdeen')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10002, N'Waldon Crinage', 48, N'78145 Monica Road', N'St. Andrews')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10003, N'Christopher Slany', 53, N'4887 Lillian Park', N'Aberdeen')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10004, N'Saw Royce', 33, N'9 Columbus Way', N'Edinburgh')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10005, N'Lindsay Walkington', 45, N'4364 Manley Court', N'Stirling')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10006, N'Nicolas Slowgrove', 35, N'43480 Summit Plaza', N'Edinburgh')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10007, N'Stoddard Whales', 55, N'89 Thackeray Pass', N'St. Andrews')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10008, N'Isabel Bloore', 59, N'06 Muir Drive', N'Edinburgh')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10009, N'Sherilyn Ekless', 35, N'8 Tennyson Center', N'Aberdeen')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10010, N'Claudian Purseglove', 61, N'0 Arapahoe Pass', N'Inverness')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10011, N'Juliana Trime', 57, N'18 Sachs Pass', N'Edinburgh')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10012, N'Paton Everest', 60, N'70614 Loeprich Alley', N'Stirling')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10013, N'Nananne Norsister', 42, N'9224 Sherman Court', N'St. Andrews')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10014, N'Toni Brettle', 40, N'7 Warner Drive', N'Edinburgh')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10015, N'Dominga Iacovino', 56, N'4391 Oxford Alley', N'Aberdeen')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10016, N'Britney Sandars', 50, N'0560 Hanover Trail', N'Aberdeen')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10017, N'Alisun Hollington', 65, N'388 Briar Crest Parkway', N'Edinburgh')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10018, N'Markos Worshall', 53, N'07177 Mockingbird Crossing', N'Stirling')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10019, N'Kally Bromilow', 31, N'510 Union Way', N'St. Andrews')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10020, N'Clovis Daverin', 47, N'1615 Tomscot Circle', N'Stirling')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10021, N'Karmen Goodoune', 50, N'810 Sunbrook Street', N'Inverness')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10022, N'Thurstan Heyns', 54, N'1 Burning Wood Circle', N'Stirling')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10023, N'Corri Beviss', 65, N'6420 Carey Trail', N'Aberdeen')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10024, N'Virgina Lightwing', 38, N'881 Arapahoe Road', N'Inverness')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (10025, N'Paxon Smith', 48, N'09 Browning Point', N'Inverness')
INSERT [dbo].[Residents] ([ResidentID], [ResidentName], [ResidentAge], [Address], [City]) VALUES (12112, N'Alfred Wiley', 45, N'12, Ontarion Place Triangle ', N'Aberdeen')
GO
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52001, N'Salad Leaves')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52002, N'Radishes')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52003, N'Potatoes')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52004, N'Peas')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52005, N'Spring Onion')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52006, N'Broad Beans')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52007, N'Runner Beans')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52008, N'Garlic')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52009, N'Tomatoes')
INSERT [dbo].[Vegitables] ([VegitableID], [VegitableName]) VALUES (52010, N'Beetroots')
GO
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20001, N'Nissie Gipp', 23, N'19 Pine View Road', N'St. Andrews')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20002, N'Sansone Sedgemond', 23, N'45 Sloan Pass', N'Aberdeen')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20003, N'Geoffrey Searle', 23, N'29 Evergreen Park', N'Edinburgh')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20004, N'Danica Escoffrey', 18, N'1579 Maywood Avenue', N'Stirling')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20005, N'Nero Mathis', 21, N'1648 Luster Drive', N'Edinburgh')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20006, N'Wilt Eales', 19, N'686 Eastwood Road', N'St. Andrews')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20007, N'Lalo Teall', 18, N'97 Dexter Avenue', N'Edinburgh')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20008, N'Windy Laborde', 20, N'0 Independence Circle', N'Aberdeen')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20009, N'Harriot Sowle', 23, N'16 Meadow Vale Street', N'Inverness')
INSERT [dbo].[Volunteers] ([VolunteerID], [VolunteerName], [VolunteerAge], [VolunteerAddress], [VolunteerCity]) VALUES (20010, N'Lazar Vedmore', 18, N'19 Havey Way', N'Edinburgh')
GO
ALTER TABLE [dbo].[ConnectionRegistry]  WITH CHECK ADD  CONSTRAINT [FK_ConnectionRegistry_Lands] FOREIGN KEY([LandID])
REFERENCES [dbo].[Lands] ([LandID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[ConnectionRegistry] CHECK CONSTRAINT [FK_ConnectionRegistry_Lands]
GO
ALTER TABLE [dbo].[ConnectionRegistry]  WITH CHECK ADD  CONSTRAINT [FK_ConnectionRegistry_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[ConnectionRegistry] CHECK CONSTRAINT [FK_ConnectionRegistry_Products]
GO
ALTER TABLE [dbo].[ConnectionRegistry]  WITH CHECK ADD  CONSTRAINT [FK_ConnectionRegistry_Residents] FOREIGN KEY([ResidentID])
REFERENCES [dbo].[Residents] ([ResidentID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[ConnectionRegistry] CHECK CONSTRAINT [FK_ConnectionRegistry_Residents]
GO
ALTER TABLE [dbo].[ConnectionRegistry]  WITH CHECK ADD  CONSTRAINT [FK_ConnectionRegistry_Volunteers] FOREIGN KEY([VolunteerID])
REFERENCES [dbo].[Volunteers] ([VolunteerID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[ConnectionRegistry] CHECK CONSTRAINT [FK_ConnectionRegistry_Volunteers]
GO
ALTER TABLE [dbo].[DailySales]  WITH CHECK ADD  CONSTRAINT [FK_DailySales_ConnectionRegistry] FOREIGN KEY([ConnectionID])
REFERENCES [dbo].[ConnectionRegistry] ([ConnectionID])
GO
ALTER TABLE [dbo].[DailySales] CHECK CONSTRAINT [FK_DailySales_ConnectionRegistry]
GO
ALTER TABLE [dbo].[DailySales]  WITH CHECK ADD  CONSTRAINT [FK_DailySales_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[DailySales] CHECK CONSTRAINT [FK_DailySales_Products]
GO
ALTER TABLE [dbo].[EquipmentRegistry]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentRegistry_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[EquipmentRegistry] CHECK CONSTRAINT [FK_EquipmentRegistry_Equipment]
GO
ALTER TABLE [dbo].[EquipmentRegistry]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentRegistry_Lands] FOREIGN KEY([LandID])
REFERENCES [dbo].[Lands] ([LandID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[EquipmentRegistry] CHECK CONSTRAINT [FK_EquipmentRegistry_Lands]
GO
ALTER TABLE [dbo].[FertilizerRegistry]  WITH CHECK ADD  CONSTRAINT [FK_FertilizerRegistry_Fertilizers] FOREIGN KEY([FetilizerID])
REFERENCES [dbo].[Fertilizers] ([FertilizerID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[FertilizerRegistry] CHECK CONSTRAINT [FK_FertilizerRegistry_Fertilizers]
GO
ALTER TABLE [dbo].[FertilizerRegistry]  WITH CHECK ADD  CONSTRAINT [FK_FertilizerRegistry_Lands] FOREIGN KEY([LandID])
REFERENCES [dbo].[Lands] ([LandID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[FertilizerRegistry] CHECK CONSTRAINT [FK_FertilizerRegistry_Lands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Fruits] FOREIGN KEY([FruitID])
REFERENCES [dbo].[Fruits] ([FruitID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Fruits]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_NutritionType] FOREIGN KEY([NutritionID])
REFERENCES [dbo].[NutritionType] ([NutritionID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_NutritionType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Vegitables] FOREIGN KEY([VegitableID])
REFERENCES [dbo].[Vegitables] ([VegitableID])
ON UPDATE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Vegitables]
GO
/****** Object:  StoredProcedure [dbo].[ConnectedResidentsVolunteers]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ConnectedResidentsVolunteers] AS
SELECT
A.ConncectedDate,A.ResidentID,B.ResidentName,A.VolunteerID,C.VolunteerName
FROM ConnectionRegistry AS A
INNER JOIN Residents AS B ON A.ResidentID =B.ResidentID
INNER JOIN Volunteers AS C ON A.VolunteerID = C.VolunteerID
GO
/****** Object:  StoredProcedure [dbo].[ProductSalesProfit]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProductSalesProfit] AS
	SELECT 
	D.ProductID,B.ProductDescription, 
	D.Quantity,D.SellingUnitPrice, 
	B.AVGCost, 
	D.Quantity*D.SellingUnitPrice - D.Quantity*B.AVGCost AS Profit 
	FROM [dbo].[DailySales] AS D
	INNER JOIN [dbo].[Products] AS B ON D.ProductID = B.ProductID
GO
/****** Object:  StoredProcedure [dbo].[ResidentLocations]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ResidentLocations] @City varchar(150) 
AS
SELECT * FROM [dbo].[Residents] WHERE City = @City -- Get all the residents, @Location is the parameter 
GO
/****** Object:  StoredProcedure [dbo].[spGetSubQueryResidents]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetSubQueryResidents] @City varchar(150)
AS
SELECT * FROM [dbo].[Residents] --Select all the residents
WHERE ResidentID IN (SELECT ResidentID FROM dbo.Residents
						WHERE City = @City)
GO
/****** Object:  StoredProcedure [dbo].[spGetUnionVolunteer]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetUnionVolunteer] @VolunteerCity varchar(150), @City varchar(150)
AS
SELECT ResidentID,ResidentName FROM [dbo].[Residents] --Select all volunteers from Resident table
WHERE City = @City
UNION
SELECT VolunteerID,VolunteerCity FROM [dbo].[Volunteers] --Select all volunteerids from Volunteer table
WHERE VolunteerCity = @VolunteerCity
GO
/****** Object:  StoredProcedure [dbo].[spGetUnionVolunteerLocation]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetUnionVolunteerLocation] @VolunteerCity varchar(150), @City varchar(150)
AS
SELECT ResidentID,ResidentName,City FROM [dbo].[Residents] --Select all volunteers from Resident table
WHERE City = @City
UNION
SELECT VolunteerID,VolunteerName,VolunteerCity FROM [dbo].[Volunteers] --Select all volunteerids from Volunteer table
WHERE VolunteerCity = @VolunteerCity
GO
/****** Object:  StoredProcedure [dbo].[spGetVolunteerLocation]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetVolunteerLocation] @VolunteerCity VARCHAR(150)
AS
SELECT * FROM [dbo].[Volunteers] WHERE VolunteerCity = @VolunteerCity
GO
/****** Object:  StoredProcedure [dbo].[spInsertResident]    Script Date: 3/13/2022 10:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spInsertResident] (@ResidentID			INT,
								@ResidentName		varchar(150),
								@ResidentAge		int,
								@Address			varchar(150),
								@City				varchar(150)) --These are parameters for user has to insert
AS
		BEGIN
			INSERT INTO [dbo].[Residents]
					(ResidentID,
					ResidentName,
					ResidentAge,
					Address,
					City) -- These are the columns of the table
			VALUES (@ResidentID, 
					@ResidentName,
					@ResidentAge,
					@Address,
					@City) -- Paramters are added here as values to be added.
		END
GO
USE [master]
GO
ALTER DATABASE [XCommunityProj2] SET  READ_WRITE 
GO
