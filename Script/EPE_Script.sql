USE [master]
GO
/****** Object:  Database [EPE]    Script Date: 4/1/2024 3:03:57 PM ******/
CREATE DATABASE [EPE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EPE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EPE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EPE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EPE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EPE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EPE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EPE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EPE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EPE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EPE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EPE] SET ARITHABORT OFF 
GO
ALTER DATABASE [EPE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EPE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EPE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EPE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EPE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EPE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EPE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EPE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EPE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EPE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EPE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EPE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EPE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EPE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EPE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EPE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EPE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EPE] SET RECOVERY FULL 
GO
ALTER DATABASE [EPE] SET  MULTI_USER 
GO
ALTER DATABASE [EPE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EPE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EPE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EPE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EPE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EPE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EPE', N'ON'
GO
ALTER DATABASE [EPE] SET QUERY_STORE = ON
GO
ALTER DATABASE [EPE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EPE]
GO
/****** Object:  Table [dbo].[Area_of_Evaluation]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area_of_Evaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[dep_id] [int] IDENTITY(1,1) NOT NULL,
	[Department_name] [varchar](255) NOT NULL,
	[status_id] [int] NOT NULL,
	[manufactured] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[dep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Empl_id] [int] IDENTITY(1,1) NOT NULL,
	[User_id] [int] NOT NULL,
	[Full_name] [varchar](255) NOT NULL,
	[Department_id] [int] NOT NULL,
	[Designation_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Empl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_id] [int] NOT NULL,
	[Metric_id] [int] NOT NULL,
	[rating] [decimal](5, 2) NULL,
	[DateOfEvaluation] [date] NOT NULL,
	[Remarks] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Final_Evaluation]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Final_Evaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_id] [int] NOT NULL,
	[overall_points] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupEmployee]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupEmployee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Group_id] [int] NOT NULL,
	[Employee_id] [int] NOT NULL,
	[DateJoined] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupEvaluation]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupEvaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Group_id] [int] NOT NULL,
	[Metric_id] [int] NOT NULL,
	[rating] [decimal](5, 2) NULL,
	[DateOfEvaluation] [date] NOT NULL,
	[Remarks] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupFinalEvaluation]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFinalEvaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Group_id] [int] NOT NULL,
	[OverallPoints] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Department_id] [int] NOT NULL,
	[Supervisor_id] [int] NULL,
	[DateCreated] [date] NOT NULL,
	[Status_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LookUpTable]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LookUpTable](
	[LookUp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](255) NOT NULL,
	[Category] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LookUp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metrics]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Metrics](
	[Met_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[AOF_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Met_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Username] [varchar](50) NOT NULL,
	[Address] [text] NULL,
	[Region] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[CNIC] [varchar](50) NULL,
	[Status] [int] NULL,
	[FatherName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CNIC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisor](
	[Supervisor_id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Supervisor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupervisorEvaluation]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupervisorEvaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Supervisor_id] [int] NOT NULL,
	[Metric_id] [int] NOT NULL,
	[rating] [decimal](5, 2) NULL,
	[DateOfEvaluation] [date] NOT NULL,
	[Remarks] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupervisorFinalEvaluation]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupervisorFinalEvaluation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Supervisor_id] [int] NOT NULL,
	[OverallPoints] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weightage]    Script Date: 4/1/2024 3:03:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weightage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Metric_id] [int] NOT NULL,
	[Look_up_id] [int] NOT NULL,
	[Department_id] [int] NOT NULL,
	[Percentage] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Groups] ADD  DEFAULT ((1)) FOR [Status_id]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[LookUpTable] ([LookUp_ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Department_id])
REFERENCES [dbo].[Department] ([dep_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Designation_id])
REFERENCES [dbo].[LookUpTable] ([LookUp_ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([User_id])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([Employee_id])
REFERENCES [dbo].[Employee] ([Empl_id])
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([Metric_id])
REFERENCES [dbo].[Metrics] ([Met_id])
GO
ALTER TABLE [dbo].[Final_Evaluation]  WITH CHECK ADD FOREIGN KEY([Employee_id])
REFERENCES [dbo].[Employee] ([Empl_id])
GO
ALTER TABLE [dbo].[GroupEmployee]  WITH CHECK ADD FOREIGN KEY([Group_id])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[GroupEvaluation]  WITH CHECK ADD FOREIGN KEY([Group_id])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[GroupEvaluation]  WITH CHECK ADD FOREIGN KEY([Metric_id])
REFERENCES [dbo].[Metrics] ([Met_id])
GO
ALTER TABLE [dbo].[GroupFinalEvaluation]  WITH CHECK ADD FOREIGN KEY([Group_id])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([Department_id])
REFERENCES [dbo].[Department] ([dep_id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([Supervisor_id])
REFERENCES [dbo].[Supervisor] ([Supervisor_id])
GO
ALTER TABLE [dbo].[Metrics]  WITH CHECK ADD FOREIGN KEY([AOF_id])
REFERENCES [dbo].[Area_of_Evaluation] ([id])
GO
ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD FOREIGN KEY([Employee_id])
REFERENCES [dbo].[Employee] ([Empl_id])
GO
ALTER TABLE [dbo].[SupervisorEvaluation]  WITH CHECK ADD FOREIGN KEY([Metric_id])
REFERENCES [dbo].[Metrics] ([Met_id])
GO
ALTER TABLE [dbo].[SupervisorEvaluation]  WITH CHECK ADD FOREIGN KEY([Supervisor_id])
REFERENCES [dbo].[Supervisor] ([Supervisor_id])
GO
ALTER TABLE [dbo].[SupervisorFinalEvaluation]  WITH CHECK ADD FOREIGN KEY([Supervisor_id])
REFERENCES [dbo].[Supervisor] ([Supervisor_id])
GO
ALTER TABLE [dbo].[Weightage]  WITH CHECK ADD FOREIGN KEY([Department_id])
REFERENCES [dbo].[Department] ([dep_id])
GO
ALTER TABLE [dbo].[Weightage]  WITH CHECK ADD FOREIGN KEY([Look_up_id])
REFERENCES [dbo].[LookUpTable] ([LookUp_ID])
GO
ALTER TABLE [dbo].[Weightage]  WITH CHECK ADD FOREIGN KEY([Metric_id])
REFERENCES [dbo].[Metrics] ([Met_id])
GO
USE [master]
GO
ALTER DATABASE [EPE] SET  READ_WRITE 
GO
