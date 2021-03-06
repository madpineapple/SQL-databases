USE [master]
GO
/****** Object:  Database [Twisted metal]    Script Date: 1/16/2019 8:46:19 PM ******/
CREATE DATABASE [Twisted metal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Twisted metal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Twisted metal.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Twisted metal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Twisted metal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Twisted metal] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Twisted metal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Twisted metal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Twisted metal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Twisted metal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Twisted metal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Twisted metal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Twisted metal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Twisted metal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Twisted metal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Twisted metal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Twisted metal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Twisted metal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Twisted metal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Twisted metal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Twisted metal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Twisted metal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Twisted metal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Twisted metal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Twisted metal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Twisted metal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Twisted metal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Twisted metal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Twisted metal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Twisted metal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Twisted metal] SET  MULTI_USER 
GO
ALTER DATABASE [Twisted metal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Twisted metal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Twisted metal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Twisted metal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Twisted metal] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Twisted metal]
GO
/****** Object:  Table [dbo].[DriverInfo]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DriverInfo](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[DOB] [date] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[EmployeeNum] [varchar](10) NOT NULL,
	[DOH] [date] NOT NULL,
	[CDL] [varchar](10) NOT NULL,
 CONSTRAINT [PK_DriverInfo] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HaulManif]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HaulManif](
	[ManifID] [int] IDENTITY(1,1) NOT NULL,
	[ItemDescr] [varchar](50) NOT NULL,
	[ItemWPU] [int] NOT NULL,
	[Quant] [int] NOT NULL,
	[Haul_HaulID] [int] NOT NULL,
 CONSTRAINT [PK_HaulManif] PRIMARY KEY CLUSTERED 
(
	[ManifID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HaulRec]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HaulRec](
	[HaulID] [int] IDENTITY(1,1) NOT NULL,
	[Client] [varchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[DHB] [date] NOT NULL,
	[DHE] [date] NOT NULL,
	[Mileage] [int] NOT NULL,
	[TruckID] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
 CONSTRAINT [PK_HaulRec] PRIMARY KEY CLUSTERED 
(
	[HaulID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HaulType]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HaulType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Cargo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_HaulType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaintCode]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaintCode](
	[CodeID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](30) NOT NULL,
 CONSTRAINT [PK_MaintCode] PRIMARY KEY CLUSTERED 
(
	[CodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaintInfo]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintInfo](
	[MaintID] [int] IDENTITY(1,1) NOT NULL,
	[TruckID] [int] NOT NULL,
	[MSD] [date] NOT NULL,
	[MED] [date] NOT NULL,
	[CodeID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_MaintInfo] PRIMARY KEY CLUSTERED 
(
	[MaintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaintType]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaintType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[MaintType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MaintType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrailerInfo]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrailerInfo](
	[TrailerID] [int] IDENTITY(1,1) NOT NULL,
	[TrailerCap] [varchar](10) NOT NULL,
	[TrailMil] [int] NOT NULL,
	[TruckID] [int] NOT NULL,
	[TrailID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TrailerType]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TrailerType](
	[TrailID] [int] IDENTITY(1,1) NOT NULL,
	[TrailType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TrailerType] PRIMARY KEY CLUSTERED 
(
	[TrailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TruckInfo]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TruckInfo](
	[TruckID] [int] IDENTITY(1,1) NOT NULL,
	[TruckType] [varchar](10) NOT NULL,
	[TruckBodyType] [varchar](50) NOT NULL,
	[TruckNUM] [varchar](10) NOT NULL,
	[TCM] [int] NOT NULL,
	[Truck_DriverID] [int] NOT NULL,
 CONSTRAINT [PK_TruckInfo] PRIMARY KEY CLUSTERED 
(
	[TruckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DriverInfo] ON 

INSERT [dbo].[DriverInfo] ([DriverID], [DOB], [Name], [EmployeeNum], [DOH], [CDL]) VALUES (1, CAST(N'1978-02-03' AS Date), N'Needles', N'2010-02-03', CAST(N'1111-01-01' AS Date), N'Y')
INSERT [dbo].[DriverInfo] ([DriverID], [DOB], [Name], [EmployeeNum], [DOH], [CDL]) VALUES (2, CAST(N'1979-02-04' AS Date), N'Sue', N'321', CAST(N'2010-02-04' AS Date), N'Y')
INSERT [dbo].[DriverInfo] ([DriverID], [DOB], [Name], [EmployeeNum], [DOH], [CDL]) VALUES (3, CAST(N'1980-03-05' AS Date), N'Joey', N'456', CAST(N'2010-03-05' AS Date), N'Y')
INSERT [dbo].[DriverInfo] ([DriverID], [DOB], [Name], [EmployeeNum], [DOH], [CDL]) VALUES (4, CAST(N'1981-03-06' AS Date), N'Stacy', N'654', CAST(N'2010-03-06' AS Date), N'Y')
SET IDENTITY_INSERT [dbo].[DriverInfo] OFF
SET IDENTITY_INSERT [dbo].[HaulManif] ON 

INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (1, N'Bombs', 120, 40, 1)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (2, N'Napalm', 140, 50, 2)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (3, N'Zombies', 200, 60, 3)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (4, N'Bullets', 500, 41000, 4)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (5, N'Missles', 121, 45, 5)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (6, N'Mines', 120, 40, 6)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (7, N'Milk', 130, 50, 2)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (8, N'Acid', 141, 50, 2)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (9, N'Zombies', 200, 60, 9)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (10, N'Zombies', 200, 60, 10)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (11, N'Arrows', 500, 41000, 11)
INSERT [dbo].[HaulManif] ([ManifID], [ItemDescr], [ItemWPU], [Quant], [Haul_HaulID]) VALUES (12, N'Big Bullets', 500, 41000, 12)
SET IDENTITY_INSERT [dbo].[HaulManif] OFF
SET IDENTITY_INSERT [dbo].[HaulRec] ON 

INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (1, N'Dime Doz', 1, CAST(N'2017-06-06' AS Date), CAST(N'2017-06-07' AS Date), 5000, 1, 1)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (2, N'Piggly Wiggly', 2, CAST(N'2017-07-06' AS Date), CAST(N'2017-07-07' AS Date), 6000, 2, 2)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (3, N'Happy Larry', 3, CAST(N'2017-08-06' AS Date), CAST(N'2017-08-07' AS Date), 7000, 3, 3)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (4, N'Da Fez', 4, CAST(N'2017-08-06' AS Date), CAST(N'2017-08-07' AS Date), 8000, 4, 4)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (5, N'Dime Doz', 1, CAST(N'2017-07-06' AS Date), CAST(N'2017-07-07' AS Date), 5000, 1, 1)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (6, N'Dime Doz', 1, CAST(N'2017-08-06' AS Date), CAST(N'2017-08-07' AS Date), 5000, 1, 1)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (7, N'Piggly Wiggly', 2, CAST(N'2017-09-06' AS Date), CAST(N'2017-09-07' AS Date), 6000, 2, 2)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (8, N'Piggly Wiggly', 2, CAST(N'2017-09-08' AS Date), CAST(N'2017-09-09' AS Date), 6000, 2, 2)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (9, N'Happy Larry', 3, CAST(N'2017-09-06' AS Date), CAST(N'2017-09-07' AS Date), 7000, 3, 3)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (10, N'Happy Larry', 3, CAST(N'2017-10-06' AS Date), CAST(N'2017-10-07' AS Date), 7000, 3, 3)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (11, N'Da Fez', 4, CAST(N'2017-09-06' AS Date), CAST(N'2017-09-07' AS Date), 8000, 4, 4)
INSERT [dbo].[HaulRec] ([HaulID], [Client], [TypeID], [DHB], [DHE], [Mileage], [TruckID], [DriverID]) VALUES (12, N'Da Fez', 4, CAST(N'2017-10-06' AS Date), CAST(N'2017-10-07' AS Date), 8000, 4, 4)
SET IDENTITY_INSERT [dbo].[HaulRec] OFF
SET IDENTITY_INSERT [dbo].[HaulType] ON 

INSERT [dbo].[HaulType] ([TypeID], [Cargo]) VALUES (1, N'Hazardous')
INSERT [dbo].[HaulType] ([TypeID], [Cargo]) VALUES (2, N'Liquid')
INSERT [dbo].[HaulType] ([TypeID], [Cargo]) VALUES (3, N'Refrigerated')
INSERT [dbo].[HaulType] ([TypeID], [Cargo]) VALUES (4, N'Standard')
INSERT [dbo].[HaulType] ([TypeID], [Cargo]) VALUES (5, N'Other')
SET IDENTITY_INSERT [dbo].[HaulType] OFF
SET IDENTITY_INSERT [dbo].[MaintCode] ON 

INSERT [dbo].[MaintCode] ([CodeID], [Code]) VALUES (1, N'Routine')
INSERT [dbo].[MaintCode] ([CodeID], [Code]) VALUES (2, N'Unscheduled')
SET IDENTITY_INSERT [dbo].[MaintCode] OFF
SET IDENTITY_INSERT [dbo].[MaintInfo] ON 

INSERT [dbo].[MaintInfo] ([MaintID], [TruckID], [MSD], [MED], [CodeID], [TypeID]) VALUES (1, 1, CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), 1, 1)
INSERT [dbo].[MaintInfo] ([MaintID], [TruckID], [MSD], [MED], [CodeID], [TypeID]) VALUES (2, 2, CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), 1, 2)
INSERT [dbo].[MaintInfo] ([MaintID], [TruckID], [MSD], [MED], [CodeID], [TypeID]) VALUES (3, 3, CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), 2, 3)
INSERT [dbo].[MaintInfo] ([MaintID], [TruckID], [MSD], [MED], [CodeID], [TypeID]) VALUES (4, 4, CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), 2, 4)
SET IDENTITY_INSERT [dbo].[MaintInfo] OFF
SET IDENTITY_INSERT [dbo].[MaintType] ON 

INSERT [dbo].[MaintType] ([TypeID], [MaintType]) VALUES (1, N'Transmission')
INSERT [dbo].[MaintType] ([TypeID], [MaintType]) VALUES (2, N'Tires')
INSERT [dbo].[MaintType] ([TypeID], [MaintType]) VALUES (3, N'Body')
INSERT [dbo].[MaintType] ([TypeID], [MaintType]) VALUES (4, N'Electric')
INSERT [dbo].[MaintType] ([TypeID], [MaintType]) VALUES (5, N'Hydraulic')
INSERT [dbo].[MaintType] ([TypeID], [MaintType]) VALUES (6, N'Pneumatic')
SET IDENTITY_INSERT [dbo].[MaintType] OFF
SET IDENTITY_INSERT [dbo].[TrailerInfo] ON 

INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerCap], [TrailMil], [TruckID], [TrailID]) VALUES (1, N'1000', 2000, 3, 1)
INSERT [dbo].[TrailerInfo] ([TrailerID], [TrailerCap], [TrailMil], [TruckID], [TrailID]) VALUES (2, N'2000', 2000, 4, 3)
SET IDENTITY_INSERT [dbo].[TrailerInfo] OFF
SET IDENTITY_INSERT [dbo].[TrailerType] ON 

INSERT [dbo].[TrailerType] ([TrailID], [TrailType]) VALUES (1, N'Trailer')
INSERT [dbo].[TrailerType] ([TrailID], [TrailType]) VALUES (2, N' Flat Bed')
INSERT [dbo].[TrailerType] ([TrailID], [TrailType]) VALUES (3, N'Box')
INSERT [dbo].[TrailerType] ([TrailID], [TrailType]) VALUES (4, N'Refrigerated)')
SET IDENTITY_INSERT [dbo].[TrailerType] OFF
SET IDENTITY_INSERT [dbo].[TruckInfo] ON 

INSERT [dbo].[TruckInfo] ([TruckID], [TruckType], [TruckBodyType], [TruckNUM], [TCM], [Truck_DriverID]) VALUES (1, N'Long', N'Single Unit', N'123', 1000, 1)
INSERT [dbo].[TruckInfo] ([TruckID], [TruckType], [TruckBodyType], [TruckNUM], [TCM], [Truck_DriverID]) VALUES (2, N'Long', N'Single Unit', N'321', 1000, 2)
INSERT [dbo].[TruckInfo] ([TruckID], [TruckType], [TruckBodyType], [TruckNUM], [TCM], [Truck_DriverID]) VALUES (3, N'Short', N'Trailer', N'456', 1000, 3)
INSERT [dbo].[TruckInfo] ([TruckID], [TruckType], [TruckBodyType], [TruckNUM], [TCM], [Truck_DriverID]) VALUES (4, N'Short', N'Trailer', N'654', 1000, 4)
SET IDENTITY_INSERT [dbo].[TruckInfo] OFF
ALTER TABLE [dbo].[HaulManif]  WITH CHECK ADD  CONSTRAINT [FK_HaulManif_HaulRec] FOREIGN KEY([Haul_HaulID])
REFERENCES [dbo].[HaulRec] ([HaulID])
GO
ALTER TABLE [dbo].[HaulManif] CHECK CONSTRAINT [FK_HaulManif_HaulRec]
GO
ALTER TABLE [dbo].[HaulRec]  WITH CHECK ADD  CONSTRAINT [FK_HaulRec_TruckInfo] FOREIGN KEY([TruckID])
REFERENCES [dbo].[TruckInfo] ([TruckID])
GO
ALTER TABLE [dbo].[HaulRec] CHECK CONSTRAINT [FK_HaulRec_TruckInfo]
GO
ALTER TABLE [dbo].[MaintInfo]  WITH CHECK ADD  CONSTRAINT [FK_MaintInfo_TruckInfo] FOREIGN KEY([TruckID])
REFERENCES [dbo].[TruckInfo] ([TruckID])
GO
ALTER TABLE [dbo].[MaintInfo] CHECK CONSTRAINT [FK_MaintInfo_TruckInfo]
GO
ALTER TABLE [dbo].[TruckInfo]  WITH CHECK ADD  CONSTRAINT [FK_TruckInfo_DriverInfo] FOREIGN KEY([Truck_DriverID])
REFERENCES [dbo].[DriverInfo] ([DriverID])
GO
ALTER TABLE [dbo].[TruckInfo] CHECK CONSTRAINT [FK_TruckInfo_DriverInfo]
GO
/****** Object:  StoredProcedure [dbo].[DriverResponsible]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DriverResponsible] (@DriID int,@BeginDate date, @EndDate date)
as
begin
select a.Name, b.Client from DriverInfo as a

join HaulRec as b
on a.DriverID = b.DriverID

where a.DriverID = @DriID and b.DHB between @BeginDate and @EndDate
End
GO
/****** Object:  StoredProcedure [dbo].[HaulInventory]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[HaulInventory] (@TruID int,@BeginDate date, @EndDate date)
as
begin
select a.TruckNum, b.Client, c.Cargo, d.ItemDescr, d.ItemWPU,d.Quant from TruckInfo as a

join HaulRec as b
on a.TruckID =b.TruckID
join HaulType as c
on b.TypeID = c.TypeID
join HaulManif as d
on b.HaulID = d.Haul_HaulID

where a.TruckID = @TruID and b.DHB between @BeginDate and @EndDate
End
GO
/****** Object:  StoredProcedure [dbo].[HaulRecord]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[HaulRecord] (@TruID int,@BeginDate date, @EndDate date)
as
begin
select a.TruckNum, b.Client from TruckInfo as a

join HaulRec as b
on a.TruckID =b.TruckID

where a.TruckID = @TruID and b.DHB between @BeginDate and @EndDate
End
GO
/****** Object:  StoredProcedure [dbo].[TruckMaintenance]    Script Date: 1/16/2019 8:46:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[TruckMaintenance](@TruID int,@BeginDate date, @EndDate date)
as
begin
select a.TruckNum, a.TruckType, b.TypeID, c.MaintType as "Pertinent Truck Information" from TruckInfo as a 

join MaintInfo as b
on a.TruckID = b.TruckID
join MaintType as c 
on b.TypeID = c.TypeID

where a.TruckID = @TruID and b.MSD between @BeginDate and @EndDate
End

GO
USE [master]
GO
ALTER DATABASE [Twisted metal] SET  READ_WRITE 
GO
