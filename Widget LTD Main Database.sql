USE [master]
GO
/****** Object:  Database [WIDGET_DEPARTMENT]    Script Date: 02/10/2023 21:59:49 ******/
CREATE DATABASE [WIDGET_DEPARTMENT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WIDGET_DEPARTMENT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WIDGET_DEPARTMENT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WIDGET_DEPARTMENT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WIDGET_DEPARTMENT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WIDGET_DEPARTMENT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET ARITHABORT OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET  MULTI_USER 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET QUERY_STORE = ON
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WIDGET_DEPARTMENT]
GO
/****** Object:  User [LDMS]    Script Date: 02/10/2023 21:59:49 ******/
CREATE USER [LDMS] FOR LOGIN [LDMS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[DEPARTMENT_NAME]    Script Date: 02/10/2023 21:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTMENT_NAME](
	[DEPARTMENT_ID] [int] IDENTITY(1,1) NOT NULL,
	[DEPARTMENT_NAME] [varchar](50) NOT NULL,
	[LOCATION] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DEPARTMENT_NAME_1] PRIMARY KEY CLUSTERED 
(
	[DEPARTMENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEES]    Script Date: 02/10/2023 21:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEES](
	[EMPLOYEE_ID] [int] NOT NULL,
	[EMPLOYEE_NAME] [varchar](50) NOT NULL,
	[JOB_TITLE] [varchar](50) NOT NULL,
	[MANAGER_ID] [int] NULL,
	[DATE_HIRED] [date] NOT NULL,
	[SALARY] [decimal](18, 0) NOT NULL,
	[DEPARTMENT_ID] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEES] PRIMARY KEY CLUSTERED 
(
	[EMPLOYEE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EMPLOYEES_BY_DEPARTMENT]    Script Date: 02/10/2023 21:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EMPLOYEES_BY_DEPARTMENT]
AS
SELECT    dbo.EMPLOYEES.EMPLOYEE_NAME, dbo.DEPARTMENT_NAME.DEPARTMENT_NAME, dbo.EMPLOYEES.DEPARTMENT_ID
FROM       dbo.EMPLOYEES INNER JOIN
               dbo.DEPARTMENT_NAME ON dbo.EMPLOYEES.DEPARTMENT_ID = dbo.DEPARTMENT_NAME.DEPARTMENT_ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[5] 2[38] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -990
      End
      Begin Tables = 
         Begin Table = "EMPLOYEES"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 209
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DEPARTMENT_NAME"
            Begin Extent = 
               Top = 6
               Left = 323
               Bottom = 179
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2625
         Width = 3495
         Width = 2490
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2310
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EMPLOYEES_BY_DEPARTMENT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EMPLOYEES_BY_DEPARTMENT'
GO
USE [master]
GO
ALTER DATABASE [WIDGET_DEPARTMENT] SET  READ_WRITE 
GO
