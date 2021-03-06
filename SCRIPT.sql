USE [master]
GO
/****** Object:  Database [ProjectManagement]    Script Date: 3/25/2017 4:07:12 PM ******/
CREATE DATABASE [ProjectManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProjectManagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectManagement]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/25/2017 4:07:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] NOT NULL,
	[AdminName] [varchar](10) NOT NULL,
	[AdminPassword] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AllProject]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllProject](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[ProjectNameAll] [varchar](50) NULL,
	[CompanyId] [int] NULL,
 CONSTRAINT [PK_AllProject] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BugMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BugMaster](
	[BugId] [int] IDENTITY(1,1) NOT NULL,
	[BugName] [varchar](20) NULL,
	[EmpId] [int] NULL,
	[TaskId] [int] NULL,
	[BugDate] [datetime] NULL,
	[Solution] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[BugId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CityMaster](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](10) NULL,
	[StateId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](20) NULL,
	[Addres] [varchar](50) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[MobileNo] [varchar](12) NULL,
	[Phone] [varchar](10) NULL,
	[FaxNo] [varchar](10) NULL,
	[Email] [varchar](20) NULL,
	[Website] [varchar](20) NULL,
	[Photo] [varchar](250) NULL,
	[EmpStrenght] [int] NULL,
	[RegDate] [datetime] NULL,
	[CompanyTypeId] [int] NULL,
	[pwd] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyTypeMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyTypeMaster](
	[CompanytypeId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyType] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanytypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactUs](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[ComapanyName] [varchar](20) NULL,
	[Addres] [varchar](50) NULL,
	[MobileNo] [varchar](12) NULL,
	[Phone] [varchar](10) NULL,
	[FaxNo] [varchar](10) NULL,
	[Email] [varchar](10) NULL,
	[Website] [varchar](20) NULL,
	[LocationUrl] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DesignationMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DesignationMaster](
	[DegId] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DegId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeMaster](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](10) NULL,
	[MName] [varchar](10) NULL,
	[LName] [varchar](10) NULL,
	[Addres] [varchar](50) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[MobileNo] [varchar](12) NULL,
	[Email] [varchar](80) NULL,
	[Passwrd] [varchar](18) NULL,
	[Photo] [nvarchar](max) NULL,
	[DegId] [int] NULL,
	[Dob] [varchar](50) NULL,
	[JoinDate] [varchar](50) NULL,
	[CompanyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EventMaster](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventDate] [date] NULL,
	[EventName] [varchar](20) NULL,
	[Company Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HolidayMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HolidayMaster](
	[HolidayId] [int] IDENTITY(1,1) NOT NULL,
	[HolidayName] [varchar](10) NULL,
	[HolidayDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[HolidayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LeaveMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LeaveMaster](
	[LeaveId] [int] IDENTITY(1,1) NOT NULL,
	[LeaveReason] [varchar](20) NULL,
	[LeaveDate] [datetime] NULL,
	[StartLeaveDate] [datetime] NULL,
	[EndLeaveDate] [datetime] NULL,
	[LeaveStatus] [varchar](20) NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsMaster](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[News] [varchar](100) NULL,
	[NewsDate] [date] NULL,
	[CompanyId] [int] NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectCompletion]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectCompletion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Completion] [float] NULL,
	[Month] [int] NULL,
	[ProjectId] [int] NULL,
	[Empld] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectMaster](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Discription] [varchar](50) NULL,
	[ProjectDate] [datetime] NULL,
	[EmpId] [int] NULL,
	[StartDate] [datetime] NULL,
	[Enddate] [datetime] NULL,
	[No_Of_Days] [int] NULL,
	[CompanyId] [int] NULL,
	[Pid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StateMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StateMaster](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Project_Completion] [float] NULL,
	[Month] [int] NULL,
	[ProjectId] [int] NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskMaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaskMaster](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [varchar](20) NULL,
	[ProjectId] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[TaskStatus] [varchar](30) NULL,
	[TaskDate] [date] NULL,
	[EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[TaskMaster] SET (LOCK_ESCALATION = AUTO)
GO
INSERT [dbo].[Admin] ([AdminId], [AdminName], [AdminPassword]) VALUES (1, N'Sarav', N'007')
SET IDENTITY_INSERT [dbo].[AllProject] ON 

INSERT [dbo].[AllProject] ([Pid], [ProjectNameAll], [CompanyId]) VALUES (1, N'Test', 5)
INSERT [dbo].[AllProject] ([Pid], [ProjectNameAll], [CompanyId]) VALUES (2, N'tejas', 5)
INSERT [dbo].[AllProject] ([Pid], [ProjectNameAll], [CompanyId]) VALUES (5, N'E-Commerce', 5)
INSERT [dbo].[AllProject] ([Pid], [ProjectNameAll], [CompanyId]) VALUES (6, N'Test11', 6)
INSERT [dbo].[AllProject] ([Pid], [ProjectNameAll], [CompanyId]) VALUES (7, N'Webdesign', 8)
SET IDENTITY_INSERT [dbo].[AllProject] OFF
SET IDENTITY_INSERT [dbo].[BugMaster] ON 

INSERT [dbo].[BugMaster] ([BugId], [BugName], [EmpId], [TaskId], [BugDate], [Solution]) VALUES (2, N'ty', 25, 8, CAST(N'2017-03-11 15:54:29.553' AS DateTime), N'try this code')
INSERT [dbo].[BugMaster] ([BugId], [BugName], [EmpId], [TaskId], [BugDate], [Solution]) VALUES (3, N'error', 27, 8, CAST(N'2017-03-14 16:58:42.330' AS DateTime), N'Apply this')
INSERT [dbo].[BugMaster] ([BugId], [BugName], [EmpId], [TaskId], [BugDate], [Solution]) VALUES (4, N'Coding', 25, 8, CAST(N'2017-03-16 00:28:50.267' AS DateTime), N'Do that thing')
INSERT [dbo].[BugMaster] ([BugId], [BugName], [EmpId], [TaskId], [BugDate], [Solution]) VALUES (5, N'wjfwkjfkjnj', 27, 1006, CAST(N'2017-03-21 13:14:12.910' AS DateTime), N'Pending')
SET IDENTITY_INSERT [dbo].[BugMaster] OFF
SET IDENTITY_INSERT [dbo].[CityMaster] ON 

INSERT [dbo].[CityMaster] ([CityId], [CityName], [StateId]) VALUES (2, N'Surat', 1006)
INSERT [dbo].[CityMaster] ([CityId], [CityName], [StateId]) VALUES (4, N'Ahmedabad', 1007)
SET IDENTITY_INSERT [dbo].[CityMaster] OFF
SET IDENTITY_INSERT [dbo].[CompanyMaster] ON 

INSERT [dbo].[CompanyMaster] ([CompanyId], [CompanyName], [Addres], [CityId], [StateId], [MobileNo], [Phone], [FaxNo], [Email], [Website], [Photo], [EmpStrenght], [RegDate], [CompanyTypeId], [pwd]) VALUES (5, N'ss', N'asdsa', 2, 1007, N'4343', N'3434', N'4343', N'h@gmail.com', N'asdasd', N'~/img1/copatechno.png', 34, CAST(N'2017-03-11 11:06:43.123' AS DateTime), 2, N'1234')
INSERT [dbo].[CompanyMaster] ([CompanyId], [CompanyName], [Addres], [CityId], [StateId], [MobileNo], [Phone], [FaxNo], [Email], [Website], [Photo], [EmpStrenght], [RegDate], [CompanyTypeId], [pwd]) VALUES (6, N'hemali', N'dfghh', 2, 1007, N'12345', N'123', N'345', N'jm@gmail.c', N'qwewer', N'~/img1/copa.png', 50, CAST(N'2017-03-11 11:15:13.980' AS DateTime), 2, N'1234')
INSERT [dbo].[CompanyMaster] ([CompanyId], [CompanyName], [Addres], [CityId], [StateId], [MobileNo], [Phone], [FaxNo], [Email], [Website], [Photo], [EmpStrenght], [RegDate], [CompanyTypeId], [pwd]) VALUES (7, N'asd', N'aada', 2, 1007, N'24455', N'23232', N'234', N's@gmail.co', N'sddsf', N'~/admin/photo/Capture.PNG', 23, CAST(N'2017-03-11 11:24:03.450' AS DateTime), 2, N'123')
INSERT [dbo].[CompanyMaster] ([CompanyId], [CompanyName], [Addres], [CityId], [StateId], [MobileNo], [Phone], [FaxNo], [Email], [Website], [Photo], [EmpStrenght], [RegDate], [CompanyTypeId], [pwd]) VALUES (8, N'Patel Ente', N'dariapur, ', 4, 1007, N'9227205556', N'98980', N'22161656', N'patel5556@gmail.com', N'patelentr', N'~/img1/5.png', 5, CAST(N'2017-03-12 22:56:26.113' AS DateTime), 4, N'123')
SET IDENTITY_INSERT [dbo].[CompanyMaster] OFF
SET IDENTITY_INSERT [dbo].[CompanyTypeMaster] ON 

INSERT [dbo].[CompanyTypeMaster] ([CompanytypeId], [CompanyType]) VALUES (2, N'Technical')
INSERT [dbo].[CompanyTypeMaster] ([CompanytypeId], [CompanyType]) VALUES (4, N'Non-Technical')
SET IDENTITY_INSERT [dbo].[CompanyTypeMaster] OFF
SET IDENTITY_INSERT [dbo].[DesignationMaster] ON 

INSERT [dbo].[DesignationMaster] ([DegId], [Designation]) VALUES (1, N'Manager')
INSERT [dbo].[DesignationMaster] ([DegId], [Designation]) VALUES (3, N'C.E.O')
INSERT [dbo].[DesignationMaster] ([DegId], [Designation]) VALUES (4, N'H.R')
INSERT [dbo].[DesignationMaster] ([DegId], [Designation]) VALUES (5, N'H.O.D')
SET IDENTITY_INSERT [dbo].[DesignationMaster] OFF
SET IDENTITY_INSERT [dbo].[EmployeeMaster] ON 

INSERT [dbo].[EmployeeMaster] ([EmpId], [FName], [MName], [LName], [Addres], [CityId], [StateId], [MobileNo], [Email], [Passwrd], [Photo], [DegId], [Dob], [JoinDate], [CompanyId]) VALUES (25, N'Sarav', N'A', N'Patel', N'asas', 2, 1007, N'434', N's@gmail.com', N'1111', N'~/img1/1.png', 1, N'2017-03-03', N'2017-03-04', 5)
INSERT [dbo].[EmployeeMaster] ([EmpId], [FName], [MName], [LName], [Addres], [CityId], [StateId], [MobileNo], [Email], [Passwrd], [Photo], [DegId], [Dob], [JoinDate], [CompanyId]) VALUES (27, N'hemali', N'A', N'parekh', N'sgsfsfs', 4, 1007, N'32423423432', N'sa@gmail.com', N'1234', N'~/img1/', 1, N'2017-03-01', N'2017-03-11', 5)
INSERT [dbo].[EmployeeMaster] ([EmpId], [FName], [MName], [LName], [Addres], [CityId], [StateId], [MobileNo], [Email], [Passwrd], [Photo], [DegId], [Dob], [JoinDate], [CompanyId]) VALUES (1025, N'hemali', N'A', N'parekh', N'sdsdasda', 4, 1007, N'123334', N'h@gmail.com', N'1234', N'img1/backgroung.jpg', 3, N'2017-03-01', N'Mar  8 2017  3:57PM', 6)
INSERT [dbo].[EmployeeMaster] ([EmpId], [FName], [MName], [LName], [Addres], [CityId], [StateId], [MobileNo], [Email], [Passwrd], [Photo], [DegId], [Dob], [JoinDate], [CompanyId]) VALUES (2025, N'Sarav', N'V', N'Patel', N'Thaltej', 4, 1007, N'731823781', N'sarav8297@gmail.com', N'sarav', N'img1/bg1.jpg', 5, N'2017-03-02', N'Mar 16 2017  9:35AM', 7)
INSERT [dbo].[EmployeeMaster] ([EmpId], [FName], [MName], [LName], [Addres], [CityId], [StateId], [MobileNo], [Email], [Passwrd], [Photo], [DegId], [Dob], [JoinDate], [CompanyId]) VALUES (2026, N'hhkjhjkh', N'A', N'parekh', N'df', 2, 1007, N'45454', N'nk@gmail.com', N'123', N'img1/download.png', 1, N'2017-03-03', N'Mar 21 2017 12:01PM', 5)
INSERT [dbo].[EmployeeMaster] ([EmpId], [FName], [MName], [LName], [Addres], [CityId], [StateId], [MobileNo], [Email], [Passwrd], [Photo], [DegId], [Dob], [JoinDate], [CompanyId]) VALUES (3026, N'Roy', N'F', N'Lobo', N'ahmedabad', 2, 1006, N'0000000000', N'r@gmail.com', N'0000', N'img1/bg1.jpg', 1, N'2016-07-01', N'Mar 23 2017  5:38PM', 8)
SET IDENTITY_INSERT [dbo].[EmployeeMaster] OFF
SET IDENTITY_INSERT [dbo].[EventMaster] ON 

INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1006, CAST(N'2017-01-14' AS Date), N'Uttrayan', NULL)
INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1007, CAST(N'2017-10-02' AS Date), N'Gandhi Jayanti', NULL)
INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1008, CAST(N'2017-03-17' AS Date), N'Holi', NULL)
INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1016, CAST(N'2017-03-29' AS Date), N'Milang', NULL)
INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1018, CAST(N'2017-03-01' AS Date), N'Diwali', NULL)
INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1019, CAST(N'2017-03-01' AS Date), N'wsssf', NULL)
INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1024, CAST(N'2017-03-13' AS Date), N'TM', 8)
INSERT [dbo].[EventMaster] ([EventId], [EventDate], [EventName], [Company Id]) VALUES (1025, CAST(N'2017-03-10' AS Date), N'test', 5)
SET IDENTITY_INSERT [dbo].[EventMaster] OFF
SET IDENTITY_INSERT [dbo].[LeaveMaster] ON 

INSERT [dbo].[LeaveMaster] ([LeaveId], [LeaveReason], [LeaveDate], [StartLeaveDate], [EndLeaveDate], [LeaveStatus], [EmpId]) VALUES (9, N'Person Reason', CAST(N'2017-03-21 18:51:17.907' AS DateTime), CAST(N'2017-03-21 18:51:17.907' AS DateTime), CAST(N'2017-03-21 18:51:17.907' AS DateTime), N'Approve', 2026)
INSERT [dbo].[LeaveMaster] ([LeaveId], [LeaveReason], [LeaveDate], [StartLeaveDate], [EndLeaveDate], [LeaveStatus], [EmpId]) VALUES (11, N'Tav avo', CAST(N'2017-03-21 18:34:10.380' AS DateTime), CAST(N'2017-03-21 18:34:10.380' AS DateTime), CAST(N'2017-03-21 18:34:10.380' AS DateTime), N'Approve', 1025)
INSERT [dbo].[LeaveMaster] ([LeaveId], [LeaveReason], [LeaveDate], [StartLeaveDate], [EndLeaveDate], [LeaveStatus], [EmpId]) VALUES (12, N'qewqewe', CAST(N'2017-03-21 18:33:40.640' AS DateTime), CAST(N'2017-03-21 18:33:40.640' AS DateTime), CAST(N'2017-03-21 18:33:40.640' AS DateTime), N'Approve', 1025)
INSERT [dbo].[LeaveMaster] ([LeaveId], [LeaveReason], [LeaveDate], [StartLeaveDate], [EndLeaveDate], [LeaveStatus], [EmpId]) VALUES (13, N'sfdf', CAST(N'2017-03-21 18:41:48.737' AS DateTime), CAST(N'2017-03-21 18:41:48.737' AS DateTime), CAST(N'2017-03-21 18:41:48.737' AS DateTime), N'Approve', 1025)
INSERT [dbo].[LeaveMaster] ([LeaveId], [LeaveReason], [LeaveDate], [StartLeaveDate], [EndLeaveDate], [LeaveStatus], [EmpId]) VALUES (14, N'erew', CAST(N'2017-03-21 18:46:45.273' AS DateTime), CAST(N'2017-03-21 18:46:45.273' AS DateTime), CAST(N'2017-03-21 18:46:45.273' AS DateTime), N'Approve', 27)
SET IDENTITY_INSERT [dbo].[LeaveMaster] OFF
SET IDENTITY_INSERT [dbo].[NewsMaster] ON 

INSERT [dbo].[NewsMaster] ([NewsId], [News], [NewsDate], [CompanyId], [Flag]) VALUES (1, N'mitting at 5.00 ', CAST(N'2017-03-12' AS Date), 5, 1)
INSERT [dbo].[NewsMaster] ([NewsId], [News], [NewsDate], [CompanyId], [Flag]) VALUES (3, N'mitting at 5.00 ', CAST(N'2017-03-12' AS Date), 5, 1)
INSERT [dbo].[NewsMaster] ([NewsId], [News], [NewsDate], [CompanyId], [Flag]) VALUES (4, N'mitting at 5.00 ', CAST(N'2017-03-12' AS Date), 5, 1)
INSERT [dbo].[NewsMaster] ([NewsId], [News], [NewsDate], [CompanyId], [Flag]) VALUES (5, N'mitting at 5.00 ', CAST(N'2017-03-12' AS Date), 5, 1)
INSERT [dbo].[NewsMaster] ([NewsId], [News], [NewsDate], [CompanyId], [Flag]) VALUES (6, N'mitting at 5.00 ', CAST(N'2017-03-12' AS Date), 6, 1)
INSERT [dbo].[NewsMaster] ([NewsId], [News], [NewsDate], [CompanyId], [Flag]) VALUES (7, N'mitting at 5.00 ', CAST(N'2017-03-12' AS Date), 6, 1)
INSERT [dbo].[NewsMaster] ([NewsId], [News], [NewsDate], [CompanyId], [Flag]) VALUES (22, N'presentaion ', CAST(N'2017-03-20' AS Date), 7, 1)
SET IDENTITY_INSERT [dbo].[NewsMaster] OFF
SET IDENTITY_INSERT [dbo].[ProjectCompletion] ON 

INSERT [dbo].[ProjectCompletion] ([Id], [Project_Completion], [Month], [ProjectId], [Empld]) VALUES (1, 50, 5, 1002, 25)
INSERT [dbo].[ProjectCompletion] ([Id], [Project_Completion], [Month], [ProjectId], [Empld]) VALUES (2, 60, 6, 1002, 25)
INSERT [dbo].[ProjectCompletion] ([Id], [Project_Completion], [Month], [ProjectId], [Empld]) VALUES (3, 80, 7, 1002, 25)
INSERT [dbo].[ProjectCompletion] ([Id], [Project_Completion], [Month], [ProjectId], [Empld]) VALUES (4, 40, 8, 1003, 27)
INSERT [dbo].[ProjectCompletion] ([Id], [Project_Completion], [Month], [ProjectId], [Empld]) VALUES (5, 68, 9, 1003, 27)
SET IDENTITY_INSERT [dbo].[ProjectCompletion] OFF
SET IDENTITY_INSERT [dbo].[ProjectMaster] ON 

INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (1002, N'ghgfhgfhfgh', CAST(N'2017-03-08 00:00:00.000' AS DateTime), 25, CAST(N'2017-03-08 00:00:00.000' AS DateTime), CAST(N'2017-03-08 00:00:00.000' AS DateTime), 4, 5, 1)
INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (1003, N'kjhkhkjhk', CAST(N'2017-03-08 00:00:00.000' AS DateTime), 2026, CAST(N'2017-03-08 00:00:00.000' AS DateTime), CAST(N'2017-03-08 00:00:00.000' AS DateTime), 6, 5, 2)
INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (1005, N'ffff ', CAST(N'2017-03-18 00:00:00.000' AS DateTime), 1025, CAST(N'2017-03-04 00:00:00.000' AS DateTime), CAST(N'2017-03-11 00:00:00.000' AS DateTime), 7, 6, 1)
INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (3005, N'fsfsdfsdfsdfsdfwRWERHFS', CAST(N'2017-02-28 00:00:00.000' AS DateTime), 1025, CAST(N'2017-03-01 00:00:00.000' AS DateTime), CAST(N'2017-03-03 00:00:00.000' AS DateTime), 4, 7, 2)
INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (3007, N'fdsffsd', CAST(N'2017-03-10 00:00:00.000' AS DateTime), 27, CAST(N'2017-03-02 00:00:00.000' AS DateTime), CAST(N'2017-03-04 00:00:00.000' AS DateTime), 4, 5, 2)
INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (3010, N'fadfadsa', CAST(N'2017-03-01 00:00:00.000' AS DateTime), 25, CAST(N'2017-03-04 00:00:00.000' AS DateTime), CAST(N'2017-03-10 00:00:00.000' AS DateTime), 0, 5, 5)
INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (3014, N'dkagsdyaydusdg', CAST(N'2017-03-09 00:00:00.000' AS DateTime), 1025, CAST(N'2017-03-03 00:00:00.000' AS DateTime), CAST(N'2017-03-04 00:00:00.000' AS DateTime), 0, 6, 6)
INSERT [dbo].[ProjectMaster] ([ProjectId], [Discription], [ProjectDate], [EmpId], [StartDate], [Enddate], [No_Of_Days], [CompanyId], [Pid]) VALUES (3016, N'gersgz', CAST(N'2017-03-10 00:00:00.000' AS DateTime), 3026, CAST(N'2017-03-03 00:00:00.000' AS DateTime), CAST(N'2017-03-04 00:00:00.000' AS DateTime), 0, 8, 7)
SET IDENTITY_INSERT [dbo].[ProjectMaster] OFF
SET IDENTITY_INSERT [dbo].[StateMaster] ON 

INSERT [dbo].[StateMaster] ([StateId], [StateName]) VALUES (1005, N'Nepal')
INSERT [dbo].[StateMaster] ([StateId], [StateName]) VALUES (1006, N'maharastra')
INSERT [dbo].[StateMaster] ([StateId], [StateName]) VALUES (1007, N'gujarat')
SET IDENTITY_INSERT [dbo].[StateMaster] OFF
SET IDENTITY_INSERT [dbo].[Table] ON 

INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (1, 50, 5, 1002, 25)
INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (2, 60, 6, 1002, 25)
INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (3, 80, 7, 1002, 25)
INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (4, 40, 8, 1003, 27)
INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (5, 68, 9, 1003, 27)
INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (6, 80, 10, 1005, 25)
INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (7, 80, 10, 1005, 25)
INSERT [dbo].[Table] ([Id], [Project_Completion], [Month], [ProjectId], [EmpId]) VALUES (8, 20, 0, 3007, 27)
SET IDENTITY_INSERT [dbo].[Table] OFF
SET IDENTITY_INSERT [dbo].[TaskMaster] ON 

INSERT [dbo].[TaskMaster] ([TaskId], [TaskName], [ProjectId], [StartDate], [EndDate], [TaskStatus], [TaskDate], [EmpId]) VALUES (8, N'Design', 1002, CAST(N'2017-03-08' AS Date), CAST(N'2017-03-08' AS Date), N'Done', CAST(N'2017-03-11' AS Date), NULL)
INSERT [dbo].[TaskMaster] ([TaskId], [TaskName], [ProjectId], [StartDate], [EndDate], [TaskStatus], [TaskDate], [EmpId]) VALUES (1006, N'Coding', 1005, CAST(N'2017-03-08' AS Date), CAST(N'2017-03-08' AS Date), N'idkffff', CAST(N'2017-03-02' AS Date), NULL)
INSERT [dbo].[TaskMaster] ([TaskId], [TaskName], [ProjectId], [StartDate], [EndDate], [TaskStatus], [TaskDate], [EmpId]) VALUES (1007, N'Testing', 3010, CAST(N'2017-03-08' AS Date), CAST(N'2017-03-08' AS Date), N'Done', CAST(N'2017-03-01' AS Date), NULL)
INSERT [dbo].[TaskMaster] ([TaskId], [TaskName], [ProjectId], [StartDate], [EndDate], [TaskStatus], [TaskDate], [EmpId]) VALUES (1009, N'Network Managment', 1003, CAST(N'2017-03-02' AS Date), CAST(N'2017-03-03' AS Date), N'Pending', CAST(N'2017-03-04' AS Date), NULL)
INSERT [dbo].[TaskMaster] ([TaskId], [TaskName], [ProjectId], [StartDate], [EndDate], [TaskStatus], [TaskDate], [EmpId]) VALUES (1010, N'Analysis', 3010, CAST(N'2017-03-02' AS Date), CAST(N'2017-03-04' AS Date), N'Pending', CAST(N'2017-03-07' AS Date), NULL)
INSERT [dbo].[TaskMaster] ([TaskId], [TaskName], [ProjectId], [StartDate], [EndDate], [TaskStatus], [TaskDate], [EmpId]) VALUES (1011, N'Testing', 3014, CAST(N'2017-03-02' AS Date), CAST(N'2017-03-03' AS Date), N'Pending', CAST(N'2017-03-04' AS Date), NULL)
INSERT [dbo].[TaskMaster] ([TaskId], [TaskName], [ProjectId], [StartDate], [EndDate], [TaskStatus], [TaskDate], [EmpId]) VALUES (1012, N'Design', 3016, CAST(N'2017-03-03' AS Date), CAST(N'2017-03-04' AS Date), N'Pending', CAST(N'2017-03-11' AS Date), 3026)
SET IDENTITY_INSERT [dbo].[TaskMaster] OFF
ALTER TABLE [dbo].[AllProject]  WITH CHECK ADD  CONSTRAINT [FK_AllProject_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[AllProject] CHECK CONSTRAINT [FK_AllProject_CompanyMaster]
GO
ALTER TABLE [dbo].[BugMaster]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[EmployeeMaster] ([EmpId])
GO
ALTER TABLE [dbo].[BugMaster]  WITH CHECK ADD FOREIGN KEY([TaskId])
REFERENCES [dbo].[TaskMaster] ([TaskId])
GO
ALTER TABLE [dbo].[CityMaster]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[StateMaster] ([StateId])
GO
ALTER TABLE [dbo].[CompanyMaster]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[CompanyMaster]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[StateMaster] ([StateId])
GO
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD FOREIGN KEY([DegId])
REFERENCES [dbo].[DesignationMaster] ([DegId])
GO
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[StateMaster] ([StateId])
GO
ALTER TABLE [dbo].[EmployeeMaster]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeMaster_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[EmployeeMaster] CHECK CONSTRAINT [FK_EmployeeMaster_CompanyMaster]
GO
ALTER TABLE [dbo].[EventMaster]  WITH CHECK ADD  CONSTRAINT [FK_EventMaster_CompanyMaster] FOREIGN KEY([Company Id])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[EventMaster] CHECK CONSTRAINT [FK_EventMaster_CompanyMaster]
GO
ALTER TABLE [dbo].[LeaveMaster]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[EmployeeMaster] ([EmpId])
GO
ALTER TABLE [dbo].[NewsMaster]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[ProjectCompletion]  WITH CHECK ADD  CONSTRAINT [FK__ProjectCo__Proje__540C7B00] FOREIGN KEY([Empld])
REFERENCES [dbo].[EmployeeMaster] ([EmpId])
GO
ALTER TABLE [dbo].[ProjectCompletion] CHECK CONSTRAINT [FK__ProjectCo__Proje__540C7B00]
GO
ALTER TABLE [dbo].[ProjectMaster]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[EmployeeMaster] ([EmpId])
GO
ALTER TABLE [dbo].[ProjectMaster]  WITH CHECK ADD FOREIGN KEY([Pid])
REFERENCES [dbo].[AllProject] ([Pid])
GO
ALTER TABLE [dbo].[ProjectMaster]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMaster_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([CompanyId])
GO
ALTER TABLE [dbo].[ProjectMaster] CHECK CONSTRAINT [FK_ProjectMaster_CompanyMaster]
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD FOREIGN KEY([EmpId])
REFERENCES [dbo].[EmployeeMaster] ([EmpId])
GO
ALTER TABLE [dbo].[Table]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[ProjectMaster] ([ProjectId])
GO
ALTER TABLE [dbo].[TaskMaster]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[ProjectMaster] ([ProjectId])
GO
ALTER TABLE [dbo].[TaskMaster]  WITH CHECK ADD  CONSTRAINT [FK_TaskMaster_EmployeeMaster] FOREIGN KEY([EmpId])
REFERENCES [dbo].[EmployeeMaster] ([EmpId])
GO
ALTER TABLE [dbo].[TaskMaster] CHECK CONSTRAINT [FK_TaskMaster_EmployeeMaster]
GO
/****** Object:  StoredProcedure [dbo].[manage_Allproject]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_Allproject]
@pid int,
@ProjectNameAll varchar(50)='',
@CompanyId int,
@type int
as
begin 
if(@type=1)
begin
insert into AllProject values(@ProjectNameAll,@CompanyId)
end
if(@type=2)
begin
update AllProject set ProjectNameAll=@ProjectNameAll,CompanyId=@CompanyId where Pid=@pid
end
if(@type=3)
begin
delete from AllProject where Pid=@pid
end
if(@type=4)
begin
select * from AllProject
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_Allproject1]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_Allproject1]
@pid int,
@ProjectNameAll varchar(50)='',
@CompanyId int,
@type int
as
begin 
if(@type=1)
begin
insert into AllProject values(@ProjectNameAll,@CompanyId)
end
if(@type=2)
begin
update AllProject set ProjectNameAll=@ProjectNameAll,CompanyId=@CompanyId where Pid=@pid
end
if(@type=3)
begin
delete from AllProject where Pid=@pid
end
if(@type=4)
begin
select * from AllProject
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_bug]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[manage_bug]
@bugid int=0,
@bugname varchar(20)='',
@empid int=0,
@taskid int=0,
@solution varchar(150),
@type int
as
begin 
if(@type=1)
begin
insert into BugMaster values(@bugname,@empid,@taskid,GETDATE(),@solution)
end
if(@type=2)
begin
update BugMaster set BugName=@bugname,EmpId=@empid,TaskId=@taskid,BugDate=GETDATE(),Solution=@solution where BugId=@bugid
end
if(@type=3)
begin
delete from BugMaster where BugId=@bugid
end
if(@type=4)
begin
select e.*,b.*,t.* from BugMaster b inner join EmployeeMaster e on e.EmpId=b.EmpId inner join TaskMaster t on  t.TaskId=b.TaskId
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_city]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_city]
@cid int=0,
@cname varchar(10)='',
@sid int=0,
@type int
as
begin 
if(@type=1)
begin
insert into CityMaster values(@cname,@sid)
end
if(@type=2)
begin
update CityMaster set CityName=@cname,StateId=@sid where CityId=@cid
end
if(@type=3)
begin
delete from CityMaster where CityId=@cid
end
if(@type=4)
begin
select c.*,s.StateName from CityMaster c inner join StateMaster s on s.StateId=c.StateId
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_company1]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_company1]
@companyid int=0,
@companyname varchar(20)='',
@address varchar(50),
@cid int=0,
@sid int=0,
@mobileno varchar(12),  
@phone varchar(10),
@faxno varchar(20),
@email varchar(20),
@website varchar(20),
@photo varchar(250),
@empstrenght int=0,
@companytypeid int=0,
@pwd varchar(10),
@type int
as
begin 
if(@type=1)
begin
insert into CompanyMaster values(@companyname,@address,@cid,@sid,@mobileno,@phone,@faxno,@email,@website,@photo,@empstrenght,GETDATE(),@companytypeid,@pwd)
end
if(@type=2)
begin
update CompanyMaster set CompanyName=@companyname,Addres=@address,CityId=@cid,StateId=@sid,MobileNo=@mobileno,Phone=@phone,FaxNo=@faxno,Email=@email,Website=@website,Photo=@photo,EmpStrenght=@empstrenght,CompanyTypeId=@companytypeid,RegDate=GETDATE() where CompanyId=@companyid
end
if(@type=3)
begin
delete from CompanyMaster where CompanyId=@companyid
end
if(@type=4)
begin
select c.*,cm.*,ct.*,s.* from CompanyMaster cm inner join CityMaster c on c.CityId=cm.CityId inner join StateMaster s on  s.StateId=cm.StateId inner join CompanyTypeMaster ct on ct.CompanytypeId=cm.CompanyTypeId 
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_companytypemaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_companytypemaster]
@companytypeid int,
@companytype varchar(20)='',
@type int
as
begin 
if(@type=1)
begin
insert into CompanyTypeMaster values(@companytype)
end
if(@type=2)
begin
update CompanyTypeMaster set CompanyType=@companytype where CompanytypeId=@companytypeid
end
if(@type=3)
begin
delete from CompanyTypeMaster where CompanytypeId=@companytypeid
end
if(@type=4)
begin
select * from CompanyTypeMaster
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_contactus]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[manage_contactus]
@companyid int,
@companyname varchar(20)='',
@address varchar(50),
@mobileno varchar(12),
@phone varchar(10),
@faxno varchar(10),
@email varchar(10),
@website varchar(20),
@location varchar(20),
@type int
as
begin 
if(@type=1)
begin
insert into ContactUs values(@companyname,@address,@mobileno,@phone,@faxno,@email,@website,@location)
end
if(@type=2)
begin
update ContactUs set ComapanyName=@companyname,MobileNo=@mobileno,Addres=@address,Phone=@phone,FaxNo=@faxno,Email=@email,Website=@website,LocationUrl=@location where CId=@companyid
end
if(@type=3)
begin
delete from ContactUs where CId=@companyid
end
if(@type=4)
begin
select * from ContactUs
end
end


GO
/****** Object:  StoredProcedure [dbo].[manage_designationmaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_designationmaster]
@degid int,
@designation varchar(20)='',
@type int
as
begin 
if(@type=1)
begin
insert into DesignationMaster values(@designation)
end
if(@type=2)
begin
update DesignationMaster set Designation=@designation where DegId=@degid
end
if(@type=3)
begin
delete from DesignationMaster where DegId=@degid
end
if(@type=4)
begin
select * from DesignationMaster
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_employee]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_employee]
@empid int=0,
@fname varchar(10)='',
@mname varchar(10)='',
@lname varchar(10)='',
@address varchar(50),
@cid int=0,
@sid int=0,
@mobileno varchar(12),
@email varchar(20),
@password varchar(8),
@photo nvarchar(max),
@degid int=0,
@dob varchar(50),
@jdate varchar(50),
@coid int,
@type int
as
begin 
if(@type=1)
begin
insert into EmployeeMaster values(@fname,@mname,@lname,@address,@cid,@sid,@mobileno,@email,@password,@photo,@degid,@dob,@jdate,@coid)
end
if(@type=2)
begin
update EmployeeMaster set FName=@fname,MName=@mname,LName=@lname,Addres=@address,CityId=@cid,StateId=@sid,MobileNo=@mobileno,Email=@email,Passwrd=@password,Photo=@photo,DegId=@degid,Dob=@dob,JoinDate=@jdate,CompanyId=@coid where EmpId=@empid
end
if(@type=3)
begin
delete from EmployeeMaster where EmpId=@empid 
end
if(@type=4)
begin
select e.*,c.*,s.*,d.* from EmployeeMaster e inner join CityMaster c on c.CityId=e.CityId inner join StateMaster s on  s.StateId=e.StateId inner join DesignationMaster d on d.DegId=e.DegId
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_employee1]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_employee1]
@fname varchar(10)='',
@mname varchar(10)='',
@lname varchar(10)='',
@address varchar(50),
@cid int=0,
@sid int=0,
@mobileno varchar(12)='',
@email varchar(80)='',
@password varchar(18)='',
@photo nvarchar(max)='',
@degid int=0,
@dob varchar(50)='',
@coid int

as
begin
insert into EmployeeMaster values(@fname,@mname,@lname,@address,@cid,@sid,@mobileno,@email,@password,@photo,@degid,@dob,GETDATE(),@coid)
end
GO
/****** Object:  StoredProcedure [dbo].[manage_eventmaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_eventmaster]
@eventid int,
@eventdate date,
@eventname varchar(20)='',
@cid int,
@type int
as
begin 
if(@type=1)
begin
insert into EventMaster values(@eventdate,@eventname,@cid)
end
if(@type=2)
begin
update EventMaster set  EventDate=@eventdate,EventName=@eventname,[Company Id]=@cid where EventId=@eventid
end
if(@type=3)
begin
delete from EventMaster where EventId=@eventid
end
if(@type=4)
begin
select * from EventMaster
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_holidaymaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[manage_holidaymaster]
@holidayid int,
@holidayname varchar(10)='',
@type int
as
begin 
if(@type=1)
begin
insert into HolidayMaster values(@holidayname,GETDATE())
end
if(@type=2)
begin
update HolidayMaster set HolidayName=@holidayname,HolidayDate=GETDATE() where HolidayId=@holidayid
end
if(@type=3)
begin
delete from HolidayMaster where HolidayId=@holidayid
end
if(@type=4)
begin
select * from HolidayMaster
end
end


GO
/****** Object:  StoredProcedure [dbo].[manage_leavemaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_leavemaster]
@leaveid int,
@leavereason varchar(20)='',
@leavestatus varchar(20)=' ',
@empid int,
@type int
as
begin 
if(@type=1)
begin
insert into LeaveMaster values(@leavereason,GETDATE(),GETDATE(),GETDATE(),@leavestatus,@empid)
end
if(@type=2)
begin
update LeaveMaster set LeaveReason=@leavereason,LeaveDate=GETDATE(),StartLeaveDate=GETDATE(),EndLeaveDate=GETDATE(),LeaveStatus=@leavestatus,EmpId=@empid where LeaveId=@leaveid
end
if(@type=3)
begin
delete from LeaveMaster where LeaveId=@leaveid
end
if(@type=4)
begin
select l.*,e.* from LeaveMaster l inner join EmployeeMaster e on e.EmpId=l.EmpId 
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_newsmaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_newsmaster]
@newsid int,
@news varchar(100)='',
@companyid int,
@flag bit='',
@type int
as
begin 
if(@type=1)
begin
insert into NewsMaster values(@news,GETDATE(),@companyid,@flag)
end
if(@type=2)
begin
update NewsMaster set News=@news,NewsDate=GETDATE(),CompanyId=@companyid,Flag=@flag where NewsId=@newsid
end
if(@type=3)
begin
delete from NewsMaster where NewsId=@newsid
end
if(@type=4)
begin
select * from NewsMaster where CompanyId=@companyid
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_projectmaster]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_projectmaster]
@projectid int,
@projectname varchar(10)='',
@discription varchar(50),
@pdate date,
@empid int,
@sdate date,
@edate date,
@cid int,
@type int
as
begin 
if(@type=1)
begin
insert into ProjectMaster values(@projectname,@discription,@pdate,@empid,@sdate,@edate,(select DIFFERENCE(@sdate,@edate)),@cid)
end
if(@type=2)
begin
update ProjectMaster set ProjectName=@projectname, Discription=@discription,ProjectDate=@pdate,EmpId=@empid,StartDate=@sdate,Enddate=@edate,CompanyId=@cid where ProjectId=@projectid
end
if(@type=3)
begin
delete from ProjectMaster where ProjectId=@projectid
end
if(@type=4)
begin
select p.*,e.* from ProjectMaster p inner join EmployeeMaster e on e.EmpId=p.EmpId 
end
end
GO
/****** Object:  StoredProcedure [dbo].[manage_pwd]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[manage_pwd]
@id varchar(20),
@pwd varchar(8),
@type int
AS

begin 
if(@type=1)
begin
update Admin set AdminPassword=@pwd where AdminName=@id
end
if(@type=2)
begin
update CompanyMaster set pwd=@pwd where Email=@id
end
if(@type=3)
begin
update EmployeeMaster set Passwrd=@pwd where Email=@id
end
end

GO
/****** Object:  StoredProcedure [dbo].[manage_state]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[manage_state]
@sid int=0,
@sname varchar(10)='',
@type int
as
begin 
if(@type=1)
begin
insert into StateMaster values(@sname)
end
if(@type=2)
begin
update StateMaster set StateName=@sname where StateId=@sid
end
if(@type=3)
begin
delete from StateMaster where StateId=@sid
end
if(@type=4)
begin
select * from StateMaster
end
end


GO
/****** Object:  StoredProcedure [dbo].[manage_taskmaster11]    Script Date: 3/25/2017 4:07:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[manage_taskmaster11]
@taskid int=0,
@taskname varchar(20)='',
@projectid int,
@sdate date='',
@edate date='',
@taskstatus varchar(30)='',
@tdate date='',
@EmpId int,
@type int=''
as
begin 
if(@type=1)
begin
insert into TaskMaster values(@taskname,@projectid,@sdate,@edate,@taskstatus,@tdate,@EmpId)
end
if(@type=2)
begin
update TaskMaster set TaskName=@taskname,ProjectId=@projectid,StartDate=@sdate,EndDate=@edate,TaskStatus=@taskstatus,TaskDate=@tdate,EmpId=@EmpId where TaskId=@taskid
end
if(@type=3)
begin
delete from TaskMaster where TaskId=@taskid
end
if(@type=4)
begin
select t.*,p.*,a.* from TaskMaster t inner join ProjectMaster p  on p.ProjectId=t.ProjectId inner join AllProject a  on a.Pid=p.Pid 
end
end
GO
USE [master]
GO
ALTER DATABASE [ProjectManagement] SET  READ_WRITE 
GO
