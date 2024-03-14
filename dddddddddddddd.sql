USE [master]
GO
/****** Object:  Database [VegetablesAndFruits]    Script Date: 14.03.2024 17:56:12 ******/
CREATE DATABASE [VegetablesAndFruits]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VegetablesAndFruits', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VegetablesAndFruits.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VegetablesAndFruits_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VegetablesAndFruits_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VegetablesAndFruits] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VegetablesAndFruits].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VegetablesAndFruits] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET ARITHABORT OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VegetablesAndFruits] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VegetablesAndFruits] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VegetablesAndFruits] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VegetablesAndFruits] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET RECOVERY FULL 
GO
ALTER DATABASE [VegetablesAndFruits] SET  MULTI_USER 
GO
ALTER DATABASE [VegetablesAndFruits] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VegetablesAndFruits] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VegetablesAndFruits] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VegetablesAndFruits] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VegetablesAndFruits] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VegetablesAndFruits] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VegetablesAndFruits', N'ON'
GO
ALTER DATABASE [VegetablesAndFruits] SET QUERY_STORE = ON
GO
ALTER DATABASE [VegetablesAndFruits] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VegetablesAndFruits]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 14.03.2024 17:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
	[Color] [nvarchar](20) NOT NULL,
	[Calories] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ItemID], [Name], [Type], [Color], [Calories]) VALUES (1, N'Яблоко', N'фрукт', N'Красный', 52)
INSERT [dbo].[Items] ([ItemID], [Name], [Type], [Color], [Calories]) VALUES (4, N'Морковь', N'овощ', N'Оранжевый', 41)
INSERT [dbo].[Items] ([ItemID], [Name], [Type], [Color], [Calories]) VALUES (5, N'Помидор', N'овощ', N'Красный', 18)
INSERT [dbo].[Items] ([ItemID], [Name], [Type], [Color], [Calories]) VALUES (6, N'Огурец', N'овощ', N'Зеленый', 15)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
USE [master]
GO
ALTER DATABASE [VegetablesAndFruits] SET  READ_WRITE 
GO
