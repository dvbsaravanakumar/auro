USE [master]
GO
/****** Object:  Database [testdb]    Script Date: 12/20/2019 7:35:23 PM ******/
CREATE DATABASE [testdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\testdb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'testdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\testdb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [testdb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [testdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [testdb] SET  MULTI_USER 
GO
ALTER DATABASE [testdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [testdb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [testdb]
GO
/****** Object:  Table [dbo].[tblBookingDetails]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBookingDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BOOKINGID] [varchar](50) NOT NULL,
	[ROOMID] [int] NOT NULL,
	[STARTDATE] [date] NOT NULL,
	[ENDDATE] [date] NOT NULL,
	[BOOKEDBY] [int] NOT NULL,
	[STATUS] [varchar](25) NOT NULL,
	[NOOFMALE] [int] NULL,
	[NOOFFEMALE] [int] NULL,
	[BOTH] [int] NULL,
	[CREATEDDATE] [date] NOT NULL,
 CONSTRAINT [PK_tblBookingDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCity](
	[CITYID] [int] IDENTITY(1,1) NOT NULL,
	[CITYNAME] [varchar](50) NOT NULL,
	[STATEID] [int] NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CITYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCountry](
	[COUNTRYID] [int] IDENTITY(1,1) NOT NULL,
	[COUNTRYNAME] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[COUNTRYID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGuestDestails]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblGuestDestails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BOOKINGID] [int] NOT NULL,
	[ROOMID] [int] NOT NULL,
	[GUESTID] [int] NULL,
	[CHECKINDATE] [date] NULL,
	[CHECKOUTDATE] [date] NULL,
	[STATUS] [varchar](25) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoomDetails]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoomDetails](
	[ROOMID] [int] IDENTITY(1,1) NOT NULL,
	[ROOMNUMBER] [int] NOT NULL,
	[ROOMTYPEID] [int] NOT NULL,
	[ADDRESS1] [varchar](500) NULL,
	[ADDRESS2] [varchar](200) NULL,
	[CITYID] [int] NOT NULL,
	[STATEID] [int] NOT NULL,
	[COUNTRYID] [int] NOT NULL,
	[AMENITIES] [varchar](1000) NULL,
	[STATUS] [varchar](25) NOT NULL,
	[PARAM0] [varchar](50) NULL,
	[PARAM1] [date] NULL,
 CONSTRAINT [PK_tblRoomDetails] PRIMARY KEY CLUSTERED 
(
	[ROOMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoomType]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoomType](
	[TYPEID] [int] IDENTITY(1,1) NOT NULL,
	[ROOMTYPE] [varchar](50) NOT NULL,
	[GUESTTYPE] [varchar](50) NOT NULL,
	[MALEALLOWED] [int] NULL,
	[FEMALEALLOWED] [int] NULL,
	[BOTH] [int] NULL,
	[GUESTALLOWED] [int] NULL,
 CONSTRAINT [PK_tblRoomType] PRIMARY KEY CLUSTERED 
(
	[TYPEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblState](
	[STATEID] [int] IDENTITY(1,1) NOT NULL,
	[STATENAME] [varchar](50) NOT NULL,
	[COUNTRYID] [int] NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[STATEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/20/2019 7:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRSTNAME] [varchar](100) NOT NULL,
	[LASTNAME] [varbinary](100) NULL,
	[EMAILID] [nvarchar](150) NULL,
	[SEX] [varchar](10) NULL,
	[DOB] [date] NULL,
	[ADDRESS1] [varchar](500) NULL,
	[ADDRESS2] [varchar](200) NULL,
	[CITY] [int] NULL,
	[STATE] [int] NULL,
	[COUNTRY] [int] NULL,
	[CONTACTNO] [varchar](50) NULL,
	[CREATEDDT] [date] NOT NULL,
	[ROLE] [varchar](10) NOT NULL,
	[PARAM0] [varchar](100) NULL,
	[PARAM1] [date] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblBookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDetails_tblRoomDetails] FOREIGN KEY([ROOMID])
REFERENCES [dbo].[tblRoomDetails] ([ROOMID])
GO
ALTER TABLE [dbo].[tblBookingDetails] CHECK CONSTRAINT [FK_tblBookingDetails_tblRoomDetails]
GO
ALTER TABLE [dbo].[tblRoomDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblRoomDetails_tblRoomDetails] FOREIGN KEY([ROOMID])
REFERENCES [dbo].[tblRoomDetails] ([ROOMID])
GO
ALTER TABLE [dbo].[tblRoomDetails] CHECK CONSTRAINT [FK_tblRoomDetails_tblRoomDetails]
GO
ALTER TABLE [dbo].[tblRoomDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblRoomDetails_tblRoomType] FOREIGN KEY([ROOMTYPEID])
REFERENCES [dbo].[tblRoomType] ([TYPEID])
GO
ALTER TABLE [dbo].[tblRoomDetails] CHECK CONSTRAINT [FK_tblRoomDetails_tblRoomType]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblCity] FOREIGN KEY([CITY])
REFERENCES [dbo].[tblCity] ([CITYID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblCity]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblCountry] FOREIGN KEY([COUNTRY])
REFERENCES [dbo].[tblCountry] ([COUNTRYID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblCountry]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblState] FOREIGN KEY([STATE])
REFERENCES [dbo].[tblState] ([STATEID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblState]
GO
USE [master]
GO
ALTER DATABASE [testdb] SET  READ_WRITE 
GO
CREATE PROCEDURE prGetRooms
@CountryID nvarchar(30),
@StateID nvarchar(30),
@CityID nvarchar(30),
@RoomType nvarchar(30),
@GuestType nvarchar(30)
AS
BEGIN

DECLARE @statement NVARCHAR(4000)

set @statement = 'SELECT DISTINCT RD.ROOMID, RT.ROOMTYPE,RT.GUESTTYPE, RD.ADDRESS1, RD.ADDRESS2, CN.COUNTRYNAME, ST.STATENAME, CT.CITYNAME, RD.AMENITIES, RD.STATUS
		 FROM tblRoomDetails RD 
		LEFT JOIN tblRoomType RT ON RD.ROOMTYPEID = RT.TYPEID
		LEFT JOIN tblCOUNTRY CN ON RD.COUNTRYID = CN.COUNTRYID
		LEFT JOIN tblSTATE ST ON RD.STATEID = ST.STATEID
		LEFT JOIN tblCITY CT ON RD.CITYID = CT.CITYID '

		if @CountryID <> 0 OR @StateID <> 0 OR @CityID <> 0 OR @RoomType <> 0 OR @GuestType <> 0
		begin
			set @statement = @statement + ' WHERE' 
			if @CountryID <> 0
			begin
				set @statement = @statement + ' RD.COUNTRYID = ' + @CountryID
			end

			if @StateID <> 0
			begin
				set @statement = @statement + ' AND RD.STATEID = ' + @StateID
			end

			if @CityID <> 0
			begin
				set @statement = @statement + ' AND RD.CITYID = ' + @CityID
			end

			if @RoomType <> 0
			begin
				set @statement = @statement + ' AND RT.ROOMTYPE = ' + @RoomType
			end

			if @GuestType <> 0
			begin
				set @statement = @statement + ' AND RT.GUESTTYPE = ' + @GuestType
			end
		end

      set @statement = @statement + ' ORDER BY RT.ROOMTYPE'
	   print @statement;

EXECUTE sp_executesql @statement
END
GO