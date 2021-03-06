USE [master]
GO
/****** Object:  Database [payroll]    Script Date: 5/5/2019 7:59:50 PM ******/
CREATE DATABASE [payroll]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'payroll', FILENAME = N'D:\CS Bridge\CS552 Database Management Systems\Project\Payroll Management System\Database\payroll.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'payroll_log', FILENAME = N'D:\CS Bridge\CS552 Database Management Systems\Project\Payroll Management System\Database\payroll_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [payroll] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [payroll].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [payroll] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [payroll] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [payroll] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [payroll] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [payroll] SET ARITHABORT OFF 
GO
ALTER DATABASE [payroll] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [payroll] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [payroll] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [payroll] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [payroll] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [payroll] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [payroll] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [payroll] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [payroll] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [payroll] SET  DISABLE_BROKER 
GO
ALTER DATABASE [payroll] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [payroll] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [payroll] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [payroll] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [payroll] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [payroll] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [payroll] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [payroll] SET RECOVERY FULL 
GO
ALTER DATABASE [payroll] SET  MULTI_USER 
GO
ALTER DATABASE [payroll] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [payroll] SET DB_CHAINING OFF 
GO
ALTER DATABASE [payroll] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [payroll] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [payroll] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'payroll', N'ON'
GO
ALTER DATABASE [payroll] SET QUERY_STORE = OFF
GO
USE [payroll]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/5/2019 7:59:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[LevelID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Levels]    Script Date: 5/5/2019 7:59:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[LevelID] [int] NULL,
	[BasicSalary] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5/5/2019 7:59:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[MessageFrom] [varchar](50) NULL,
	[MessageTo] [varchar](50) NULL,
	[Message] [varchar](5000) NULL,
	[EmployeeID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payslips]    Script Date: 5/5/2019 7:59:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payslips](
	[PayslipID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[Month] [int] NULL,
	[MonthName] [varchar](20) NULL,
	[Year] [int] NULL,
	[GeneratedOn] [datetime] NULL,
	[BasicSalary] [decimal](18, 2) NULL,
	[NoOfLeaves] [int] NULL,
	[SalaryPerDay] [decimal](18, 2) NULL,
	[DeductionForLeaves] [decimal](18, 2) NULL,
	[NetSalary] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Payslips] PRIMARY KEY CLUSTERED 
(
	[PayslipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_Active]  DEFAULT ((1)) FOR [Active]
GO
USE [master]
GO
ALTER DATABASE [payroll] SET  READ_WRITE 
GO
