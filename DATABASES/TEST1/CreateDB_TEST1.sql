﻿/****** Object:  Database [TEST1]    Script Date: 12/22/2017 6:12:53 PM ******/
CREATE DATABASE [TEST1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEST1', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TEST1.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TEST1_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TEST1.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TEST1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEST1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEST1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEST1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEST1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEST1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEST1] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEST1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TEST1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEST1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEST1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEST1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEST1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEST1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEST1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEST1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEST1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TEST1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEST1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEST1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEST1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEST1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEST1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEST1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEST1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TEST1] SET  MULTI_USER 
GO
ALTER DATABASE [TEST1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEST1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEST1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEST1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString3]    Script Date: 12/22/2017 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitString3]
(
    @s NVARCHAR(MAX)
)
RETURNS @t TABLE
(
    [Order] INT,
    [Item] NCHAR(1)
)
AS
BEGIN
    DECLARE @i INT;
    SET @i = 1;
    WHILE @i <= LEN(@s)
    BEGIN
        INSERT @t SELECT @i, SUBSTRING(@s, @i, 1);
        SET @i = @i + 1;
    END
    RETURN;
END
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 12/22/2017 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[EntityName] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[selectEntities]    Script Date: 12/22/2017 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[selectEntities] AS SELECT * FROM Entity
GO
/****** Object:  StoredProcedure [dbo].[getEntity]    Script Date: 12/22/2017 6:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[getEntity]
    @param1 /*parameter name*/ int /*datatype_for_param1*/ = 0, /*default_value_for_param1*/
    @param2 /*parameter name*/ int /*datatype_for_param1*/ = 0 /*default_value_for_param2*/
-- add more stored procedure parameters here
AS
    -- body of the stored procedure
    SELECT @param1, @param2
GO
ALTER DATABASE [TEST1] SET  READ_WRITE 
GO
