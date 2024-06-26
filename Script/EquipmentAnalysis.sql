USE [master]
GO
/****** Object:  Database [PMAS]    Script Date: 5/13/2024 1:05:17 AM ******/
CREATE DATABASE [PMAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PMAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PMAS.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PMAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PMAS_log.ldf' , SIZE = 532480KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PMAS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PMAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PMAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PMAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PMAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PMAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PMAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PMAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PMAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PMAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PMAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PMAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PMAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PMAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PMAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PMAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PMAS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PMAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PMAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PMAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PMAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PMAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PMAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PMAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PMAS] SET RECOVERY FULL 
GO
ALTER DATABASE [PMAS] SET  MULTI_USER 
GO
ALTER DATABASE [PMAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PMAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PMAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PMAS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PMAS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PMAS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PMAS', N'ON'
GO
ALTER DATABASE [PMAS] SET QUERY_STORE = ON
GO
ALTER DATABASE [PMAS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PMAS]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[company_id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [varchar](255) NOT NULL,
	[company_description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerResponse]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerResponse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_id] [int] NULL,
	[customer_id] [int] NULL,
	[customer_points] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipment_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_name] [varchar](255) NOT NULL,
	[company_id] [int] NULL,
	[model] [int] NULL,
	[installment_date] [date] NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluateSensor]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluateSensor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NULL,
	[result] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultyCompany]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultyCompany](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
	[count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthCenterWithCategory]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthCenterWithCategory](
	[id] [int] NOT NULL,
	[Equipment_model] [int] NULL,
	[health_points] [int] NULL,
	[Category] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](255) NOT NULL,
	[value] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceAlert]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceAlert](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sensor_serial_id] [int] NULL,
	[sensor_reading] [decimal](10, 2) NULL,
	[unit] [varchar](50) NULL,
	[alert] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor](
	[sensor_serial_id] [int] IDENTITY(1,1) NOT NULL,
	[sensor_id] [int] NULL,
	[equipment_id] [int] NULL,
	[description] [varchar](255) NULL,
	[units] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sensor_serial_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrder]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Equipment_id] [int] NULL,
	[deduction] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerResponse]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[CustomerResponse]  WITH CHECK ADD FOREIGN KEY([equipment_id])
REFERENCES [dbo].[Equipment] ([equipment_id])
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([company_id])
REFERENCES [dbo].[Companies] ([company_id])
GO
ALTER TABLE [dbo].[EvaluateSensor]  WITH CHECK ADD FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[FaultyCompany]  WITH CHECK ADD FOREIGN KEY([company_id])
REFERENCES [dbo].[Companies] ([company_id])
GO
ALTER TABLE [dbo].[HealthCenterWithCategory]  WITH CHECK ADD FOREIGN KEY([Category])
REFERENCES [dbo].[Lookup] ([id])
GO
ALTER TABLE [dbo].[MaintenanceAlert]  WITH CHECK ADD FOREIGN KEY([sensor_serial_id])
REFERENCES [dbo].[Sensor] ([sensor_serial_id])
GO
ALTER TABLE [dbo].[Sensor]  WITH CHECK ADD FOREIGN KEY([equipment_id])
REFERENCES [dbo].[Equipment] ([equipment_id])
GO
ALTER TABLE [dbo].[Sensor]  WITH CHECK ADD FOREIGN KEY([sensor_id])
REFERENCES [dbo].[Lookup] ([id])
GO
ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD FOREIGN KEY([Equipment_id])
REFERENCES [dbo].[Equipment] ([equipment_id])
GO
/****** Object:  StoredProcedure [dbo].[GenerateEquipmentData]    Script Date: 5/13/2024 1:05:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GenerateEquipmentData]
AS
BEGIN
    DECLARE @model INT;
    DECLARE @installment_date DATE;
    DECLARE @price DECIMAL(10, 2);
    DECLARE @equipment_name VARCHAR(255);
    DECLARE @Counter INT;
    DECLARE @company_id INT;

    SET @Counter = 1;

    WHILE @Counter <= 500
    BEGIN
        SELECT TOP 1 @company_id = company_id FROM Companies ORDER BY NEWID(); -- Random company_id
        
        SET @model = ROUND(RAND() * 999, 0); -- Random model number between 1 and 999
        SET @installment_date = DATEADD(day, -ROUND(RAND() * 365 * 5, 0), GETDATE()); -- Random installment date within the last 5 years
        SET @price = ROUND(RAND() * 2000 + 500, 2); -- Random price between 500 and 2500
        SET @equipment_name = CASE ROUND(RAND() * 42, 0)
                                    WHEN 0 THEN 'Mobile Phone'
                                    WHEN 1 THEN 'Laptop'
                                    WHEN 2 THEN 'TV'
                                    WHEN 3 THEN 'Smartwatch'
                                    WHEN 4 THEN 'Tablet'
                                    WHEN 5 THEN 'Desktop Computer'
                                    WHEN 6 THEN 'Printer'
                                    WHEN 7 THEN 'Scanner'
                                    WHEN 8 THEN 'Camera'
                                    WHEN 9 THEN 'Projector'
                                    WHEN 10 THEN 'Headphones'
                                    WHEN 11 THEN 'Speakers'
                                    WHEN 12 THEN 'Microphone'
                                    WHEN 13 THEN 'Router'
                                    WHEN 14 THEN 'Switch'
                                    WHEN 15 THEN 'Server'
                                    WHEN 16 THEN 'Storage Device'
                                    WHEN 17 THEN 'Monitor'
                                    WHEN 18 THEN 'Keyboard'
                                    WHEN 19 THEN 'Mouse'
                                    WHEN 20 THEN 'Gaming Console'
                                    WHEN 21 THEN 'Smart Home Device'
                                    WHEN 22 THEN 'Wearable Device'
                                    WHEN 23 THEN 'Chemical Reactor'
                                    WHEN 24 THEN 'Distillation Apparatus'
                                    WHEN 25 THEN 'Laboratory Scale'
                                    WHEN 26 THEN 'Centrifuge'
                                    WHEN 27 THEN 'Spectrophotometer'
                                    WHEN 28 THEN 'Chromatography System'
                                    WHEN 29 THEN 'Incubator'
                                    WHEN 30 THEN 'Microscope'
                                    WHEN 31 THEN 'Autoclave'
                                    WHEN 32 THEN 'Bioreactor'
                                    WHEN 33 THEN 'Chemical Analyzer'
                                    WHEN 34 THEN 'Networking Cable'
                                    WHEN 35 THEN 'Router'
                                    WHEN 36 THEN 'Switch'
                                    WHEN 37 THEN 'Firewall'
                                    WHEN 38 THEN 'Access Point'
                                    WHEN 39 THEN 'Network Attached Storage (NAS)'
                                    WHEN 40 THEN 'Modem'
                                    WHEN 41 THEN 'Ethernet Hub'
                                    ELSE 'Other'
                               END;

        INSERT INTO Equipment (equipment_name, company_id, model, installment_date, price)
        VALUES (@equipment_name, @company_id, @model, @installment_date, @price);

        SET @Counter = @Counter + 1;
    END;
END;
GO
USE [master]
GO
ALTER DATABASE [PMAS] SET  READ_WRITE 
GO
