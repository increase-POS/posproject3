USE [incprogramsdb]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_users1]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_users]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_programs]
GO
ALTER TABLE [dbo].[programs] DROP CONSTRAINT [FK_programs_users1]
GO
ALTER TABLE [dbo].[programs] DROP CONSTRAINT [FK_programs_users]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [FK_posSerials_users1]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [FK_posSerials_users]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [FK_posSerials_packageUser]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [FK_packageUser_users2]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [FK_packageUser_users1]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [FK_packageUser_users]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [FK_packageUser_packages]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [FK_packageUser_customers]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [FK_packages_versions]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [FK_packages_users1]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [FK_packages_users]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [FK_packages_programs]
GO
ALTER TABLE [dbo].[objects] DROP CONSTRAINT [FK_objects_users1]
GO
ALTER TABLE [dbo].[objects] DROP CONSTRAINT [FK_objects_users]
GO
ALTER TABLE [dbo].[objects] DROP CONSTRAINT [FK_objects_objects]
GO
ALTER TABLE [dbo].[groups] DROP CONSTRAINT [FK_groups_users2]
GO
ALTER TABLE [dbo].[groups] DROP CONSTRAINT [FK_groups_users1]
GO
ALTER TABLE [dbo].[groupObject] DROP CONSTRAINT [FK_groupObject_users1]
GO
ALTER TABLE [dbo].[groupObject] DROP CONSTRAINT [FK_groupObject_users]
GO
ALTER TABLE [dbo].[groupObject] DROP CONSTRAINT [FK_groupObject_objects]
GO
ALTER TABLE [dbo].[groupObject] DROP CONSTRAINT [FK_groupObject_groups]
GO
ALTER TABLE [dbo].[error] DROP CONSTRAINT [FK_error_users]
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_users1]
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_users]
GO
ALTER TABLE [dbo].[cities] DROP CONSTRAINT [FK_cities_countriesCodes]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [DF_versions_isActive]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF_users_balance]
GO
ALTER TABLE [dbo].[programs] DROP CONSTRAINT [DF_programs_isActive]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [DF_posSerials_isActive]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [DF_posSerials_isBooked]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_isBooked]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_islimitDate_1]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_storeCount]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_isActive]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_salesInvCount]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_itemCount]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_customerCount]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_vendorCount]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_userCount]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_posCount]
GO
ALTER TABLE [dbo].[packages] DROP CONSTRAINT [DF_packages_branchCount]
GO
ALTER TABLE [dbo].[countriesCodes] DROP CONSTRAINT [DF_countriesCodes_isDefault]
GO
/****** Object:  Table [dbo].[versions]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[versions]') AND type in (N'U'))
DROP TABLE [dbo].[versions]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[programs]') AND type in (N'U'))
DROP TABLE [dbo].[programs]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posSerials]') AND type in (N'U'))
DROP TABLE [dbo].[posSerials]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packageUser]') AND type in (N'U'))
DROP TABLE [dbo].[packageUser]
GO
/****** Object:  Table [dbo].[packages]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packages]') AND type in (N'U'))
DROP TABLE [dbo].[packages]
GO
/****** Object:  Table [dbo].[objects]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objects]') AND type in (N'U'))
DROP TABLE [dbo].[objects]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
DROP TABLE [dbo].[groups]
GO
/****** Object:  Table [dbo].[groupObject]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groupObject]') AND type in (N'U'))
DROP TABLE [dbo].[groupObject]
GO
/****** Object:  Table [dbo].[error]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[error]') AND type in (N'U'))
DROP TABLE [dbo].[error]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
DROP TABLE [dbo].[customers]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesCodes]') AND type in (N'U'))
DROP TABLE [dbo].[countriesCodes]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 2021-11-18 3:32:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cities]') AND type in (N'U'))
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[cityCode] [nvarchar](50) NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countriesCodes](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[currency] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[isDefault] [tinyint] NOT NULL,
 CONSTRAINT [PK_countriesCodes] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[custId] [int] IDENTITY(1,1) NOT NULL,
	[custname] [nvarchar](500) NOT NULL,
	[lastName] [nchar](10) NULL,
	[company] [nchar](10) NULL,
	[email] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
	[mobile] [nvarchar](500) NULL,
	[fax] [nvarchar](500) NULL,
	[address] [nvarchar](500) NULL,
	[custlevel] [nvarchar](500) NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[custCode] [nvarchar](500) NULL,
	[image] [ntext] NULL,
	[notes] [nvarchar](500) NULL,
	[balance] [decimal](18, 3) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[isActive] [int] NULL,
	[hashCode] [nvarchar](500) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[custId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[error](
	[errorId] [int] IDENTITY(1,1) NOT NULL,
	[num] [nvarchar](200) NULL,
	[msg] [ntext] NULL,
	[stackTrace] [ntext] NULL,
	[targetSite] [ntext] NULL,
	[createDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
 CONSTRAINT [PK_error] PRIMARY KEY CLUSTERED 
(
	[errorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupObject]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groupObject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupId] [int] NULL,
	[objectId] [int] NULL,
	[notes] [ntext] NULL,
	[addOb] [tinyint] NOT NULL,
	[updateOb] [tinyint] NOT NULL,
	[deleteOb] [tinyint] NOT NULL,
	[showOb] [tinyint] NOT NULL,
	[reportOb] [tinyint] NOT NULL,
	[levelOb] [tinyint] NOT NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_groupObject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups](
	[groupId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[notes] [ntext] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[isActive] [int] NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[groupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objects]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objects](
	[objectId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[note] [ntext] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[isActive] [int] NULL,
	[parentObjectId] [int] NULL,
	[objectType] [nvarchar](10) NULL,
 CONSTRAINT [PK_objects] PRIMARY KEY CLUSTERED 
(
	[objectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[packages]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[packages](
	[packageId] [int] IDENTITY(1,1) NOT NULL,
	[packageName] [nvarchar](500) NOT NULL,
	[details] [nvarchar](500) NULL,
	[branchCount] [int] NOT NULL,
	[posCount] [int] NOT NULL,
	[userCount] [int] NOT NULL,
	[vendorCount] [int] NOT NULL,
	[customerCount] [int] NOT NULL,
	[itemCount] [int] NOT NULL,
	[salesInvCount] [int] NOT NULL,
	[programId] [int] NULL,
	[verId] [int] NULL,
	[price] [decimal](18, 3) NULL,
	[isActive] [int] NOT NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[packageCode] [nvarchar](500) NOT NULL,
	[storeCount] [int] NOT NULL,
	[islimitDate] [bit] NOT NULL,
	[endDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[hashCode] [nvarchar](500) NULL,
 CONSTRAINT [PK_packageSpec] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[packageUser](
	[packageUserId] [int] IDENTITY(1,1) NOT NULL,
	[packageId] [int] NULL,
	[userId] [int] NULL,
	[packageSaleCode] [nvarchar](500) NULL,
	[packageNumber] [nvarchar](500) NULL,
	[customerId] [int] NULL,
	[customerServerCode] [nvarchar](500) NULL,
	[isBooked] [bit] NOT NULL,
	[notes] [nvarchar](500) NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[bookDate] [datetime2](7) NULL,
	[isActive] [int] NULL,
	[expireDate] [datetime2](7) NULL,
	[isOnlineServer] [bit] NULL,
 CONSTRAINT [PK_spesAgent] PRIMARY KEY CLUSTERED 
(
	[packageUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posSerials](
	[serialId] [int] IDENTITY(1,1) NOT NULL,
	[serial] [nvarchar](500) NULL,
	[posDeviceCode] [nvarchar](500) NULL,
	[packageUserId] [int] NULL,
	[isBooked] [bit] NOT NULL,
	[isActive] [int] NOT NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[apikey] [nvarchar](500) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_posSerials] PRIMARY KEY CLUSTERED 
(
	[serialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programs](
	[programId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[details] [nvarchar](500) NULL,
	[isActive] [int] NOT NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[programCode] [nvarchar](500) NOT NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[hashCode] [nvarchar](500) NULL,
 CONSTRAINT [PK_packages] PRIMARY KEY CLUSTERED 
(
	[programId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[AccountName] [nvarchar](500) NOT NULL,
	[lastName] [nvarchar](500) NULL,
	[company] [nvarchar](500) NULL,
	[email] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
	[mobile] [nvarchar](500) NULL,
	[fax] [nvarchar](500) NULL,
	[address] [nvarchar](500) NULL,
	[agentLevel] [nvarchar](500) NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[password] [nvarchar](500) NULL,
	[type] [nvarchar](10) NULL,
	[image] [ntext] NULL,
	[notes] [nvarchar](500) NULL,
	[balance] [decimal](20, 3) NOT NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[isActive] [int] NULL,
	[code] [nvarchar](500) NULL,
	[hashCode] [nvarchar](500) NULL,
	[isAdmin] [bit] NULL,
	[groupId] [int] NULL,
	[balanceType] [tinyint] NULL,
	[job] [nvarchar](100) NULL,
	[isOnline] [tinyint] NULL,
 CONSTRAINT [PK_agents] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[versions]    Script Date: 2021-11-18 3:32:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[versions](
	[verId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[details] [nvarchar](500) NULL,
	[isActive] [int] NOT NULL,
	[versionscode] [nvarchar](500) NOT NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[programId] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[hashCode] [nvarchar](500) NULL,
 CONSTRAINT [PK_versions] PRIMARY KEY CLUSTERED 
(
	[verId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cities] ON 

INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (1, N'1', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (2, N'2', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (3, N'3', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (4, N'4', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (5, N'6', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (6, N'7', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (7, N'2', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (8, N'3', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (9, N'4', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (10, N'6', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (11, N'7', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (12, N'9', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (13, N'1', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (14, N'21', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (15, N'23', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (16, N'24', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (17, N'25', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (18, N'30', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (19, N'32', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (20, N'33', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (21, N'36', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (22, N'37', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (23, N'40', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (24, N'42', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (25, N'50', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (26, N'53', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (27, N'60', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (28, N'62', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (29, N'66', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (30, N'1', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (31, N'4', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (32, N'5', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (33, N'6', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (34, N'7', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (35, N'8', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (36, N'9', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (37, N'11', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (38, N'21', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (39, N'22', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (40, N'23', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (41, N'31', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (42, N'33', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (43, N'34', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (44, N'41', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (45, N'43', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (46, N'51', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (47, N'52', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (48, N'14', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (49, N'15', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (50, N'16', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (51, N'1', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (52, N'2', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (53, N'3', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (54, N'4', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (55, N'5', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (56, N'6', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (57, N'2', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (58, N'5', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (59, N'6', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (60, N'8', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (61, N'21', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (62, N'24', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (63, N'25', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (64, N'26', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (65, N'27', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (66, N'29', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (67, N'31', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (68, N'32', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (69, N'33', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (70, N'34', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (71, N'35', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (72, N'36', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (73, N'37', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (74, N'38', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (75, N'41', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (76, N'43', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (77, N'45', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (78, N'46', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (79, N'48', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (80, N'49', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (81, N'2', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (82, N'3', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (83, N'40', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (84, N'45', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (85, N'48', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (86, N'50', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (87, N'55', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (88, N'62', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (89, N'64', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (90, N'66', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (91, N'68', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (92, N'82', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (93, N'84', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (94, N'86', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (95, N'88', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (96, N'93', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (97, N'95', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (98, N'96', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (99, N'97', 13)
GO
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (100, N'71', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (101, N'72', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (103, N'73', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (104, N'74', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (105, N'75', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (106, N'77', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (107, N'21', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (108, N'51', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (109, N'57', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (110, N'61', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (111, N'87', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (112, N'521', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (113, N'652', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (114, N'727', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (115, N'212', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (116, N'216', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (117, N'222', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (118, N'224', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (119, N'232', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (120, N'236', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (121, N'242', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (122, N'246', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (123, N'256', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (124, N'258', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (125, N'266', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (126, N'272', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (127, N'274', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (128, N'276', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (129, N'284', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (130, N'312', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (131, N'322', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (132, N'332', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (134, N'338', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (135, N'342', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (136, N'346', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (137, N'352', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (138, N'358', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (139, N'362', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (140, N'364', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (141, N'366', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (142, N'382', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (143, N'412', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (144, N'414', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (145, N'416', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (146, N'422', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (147, N'424', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (148, N'432', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (149, N'442', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (150, N'452', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (151, N'462', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (152, N'472', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (153, N'482', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (154, N'488', 19)
SET IDENTITY_INSERT [dbo].[cities] OFF
GO
SET IDENTITY_INSERT [dbo].[countriesCodes] ON 

INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (1, N'+965', N'KWD', N'Kuwait', 1)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (2, N'+966', N'SAR', N'Saudi Arabia', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (3, N'+968', N'OMR', N'Oman', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (4, N'+971', N'AED', N'United Arab Emirates', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (5, N'+974', N'QAR', N'Qatar', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (6, N'+973', N'BHD', N'Bahrain', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (7, N'+964', N'IQD', N'Iraq', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (8, N'+961', N'LBP', N'Lebanon', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (9, N'+963', N'SYP', N'Syria', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (10, N'+967', N'YER', N'Yemen', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (11, N'+962', N'JOD', N'Jordan', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (12, N'+213', N'DZD', N'Algeria', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (13, N'+20', N'EGP', N'Egypt', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (14, N'+216', N'TND', N'Tunisia', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (15, N'+249', N'SDG', N'Sudan', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (16, N'+212', N'MAD', N'Morocco', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (17, N'+218', N'LYD', N'Libya', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (18, N'+252', N'SOS', N'Somalia', 0)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault]) VALUES (19, N'+90', N'TRY', N'Turkey', 0)
SET IDENTITY_INSERT [dbo].[countriesCodes] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [hashCode]) VALUES (7, N'Mahmoud', N'hamed     ', N'mahmoud   ', N'', NULL, N'+965-295959596', NULL, N'', N'Vip', CAST(N'2021-11-07T13:33:30.0809329' AS DateTime2), CAST(N'2021-11-07T13:33:30.0809329' AS DateTime2), N'C-000001', NULL, N'', NULL, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[error] ON 

INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (45, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PackageUser.<GetAll>d__77.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 64rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_packageUser.<RefreshPackageUserList>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_packageUser.xaml.cs:line 328rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_packageUser.<Tgl_isActive_Checked>d__15.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_packageUser.xaml.cs:line 237', N'Void MoveNext()', CAST(N'2021-11-07T17:18:59.2069030' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (46, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 284rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'Void MoveNext()', CAST(N'2021-11-08T02:46:06.1491552' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (47, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 284rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'Void MoveNext()', CAST(N'2021-11-08T02:47:09.0769661' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (48, N'-2146233088', N'Error converting value 0 to type ''AdministratorApp.ApiClasses.SendDetailstr''. Path '''', line 1, position 1.', N'   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.EnsureType(JsonReader reader, Object value, CultureInfo culture, JsonContract contract, Type targetType)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object EnsureType(Newtonsoft.Json.JsonReader, System.Object, System.Globalization.CultureInfo, Newtonsoft.Json.Serialization.JsonContract, System.Type)', CAST(N'2021-11-08T02:52:11.9676967' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (49, N'-2146233088', N'Error converting value 0 to type ''AdministratorApp.ApiClasses.SendDetailstr''. Path '''', line 1, position 1.', N'   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.EnsureType(JsonReader reader, Object value, CultureInfo culture, JsonContract contract, Type targetType)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object EnsureType(Newtonsoft.Json.JsonReader, System.Object, System.Globalization.CultureInfo, Newtonsoft.Json.Serialization.JsonContract, System.Type)', CAST(N'2021-11-08T02:52:30.2998377' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (50, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PackageUser.<GetAll>d__77.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 116rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_packageUser.<RefreshPackageUserList>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_packageUser.xaml.cs:line 328rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_packageUser.<Tgl_isActive_Checked>d__15.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_packageUser.xaml.cs:line 237', N'Void MoveNext()', CAST(N'2021-11-08T03:01:15.6811470' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (51, N'-2146233088', N'Error converting value 0 to type ''AdministratorApp.ApiClasses.SendDetailstr''. Path '''', line 1, position 1.', N'   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.EnsureType(JsonReader reader, Object value, CultureInfo culture, JsonContract contract, Type targetType)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object EnsureType(Newtonsoft.Json.JsonReader, System.Object, System.Globalization.CultureInfo, Newtonsoft.Json.Serialization.JsonContract, System.Type)', CAST(N'2021-11-08T03:04:05.9440505' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (52, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PosSerials.<GetAll>d__53.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPosSerials.cs:line 52rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<RefreshPosSerialsList>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 305rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Tgl_isActive_Checked>d__15.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 216', N'Void MoveNext()', CAST(N'2021-11-08T12:32:58.1396072' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (53, N'-2146233088', N'Unexpected character encountered while parsing value: [. Path ''PosSerialSendList'', line 1, position 22.', N'   at Newtonsoft.Json.JsonTextReader.ReadStringValue(ReadType readType)rn   at Newtonsoft.Json.JsonTextReader.ReadAsString()rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.ReadForType(JsonReader reader, JsonContract contract, Boolean hasConverter)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object ReadStringValue(Newtonsoft.Json.ReadType)', CAST(N'2021-11-08T12:35:58.3932276' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (54, N'-2146233088', N'Unexpected character encountered while parsing value: [. Path ''PosSerialSendList'', line 1, position 22.', N'   at Newtonsoft.Json.JsonTextReader.ReadStringValue(ReadType readType)rn   at Newtonsoft.Json.JsonTextReader.ReadAsString()rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.ReadForType(JsonReader reader, JsonContract contract, Boolean hasConverter)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object ReadStringValue(Newtonsoft.Json.ReadType)', CAST(N'2021-11-08T12:37:01.6856197' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (55, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PosSerials.<GetAll>d__53.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPosSerials.cs:line 52rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<RefreshPosSerialsList>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 305rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 70', N'Void MoveNext()', CAST(N'2021-11-08T12:45:32.3406949' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (56, N'-2146233088', N'Unexpected character encountered while parsing value: {. Path '''', line 1, position 1.', N'   at Newtonsoft.Json.JsonTextReader.ReadStringValue(ReadType readType)rn   at Newtonsoft.Json.JsonTextReader.ReadAsString()rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.ReadForType(JsonReader reader, JsonContract contract, Boolean hasConverter)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object ReadStringValue(Newtonsoft.Json.ReadType)', CAST(N'2021-11-08T12:46:14.4067423' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (57, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PosSerials.<GetAll>d__53.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPosSerials.cs:line 52rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<RefreshPosSerialsList>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 305rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Tgl_isActive_Checked>d__15.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 216', N'Void MoveNext()', CAST(N'2021-11-08T13:42:12.4593875' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (58, N'-2146233088', N'Unexpected character encountered while parsing value: {. Path '''', line 1, position 1.', N'   at Newtonsoft.Json.JsonTextReader.ReadStringValue(ReadType readType)rn   at Newtonsoft.Json.JsonTextReader.ReadAsString()rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.ReadForType(JsonReader reader, JsonContract contract, Boolean hasConverter)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value)rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 293rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object ReadStringValue(Newtonsoft.Json.ReadType)', CAST(N'2021-11-08T13:58:56.8329841' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (59, N'-2146233076', N'There was an error deserializing the object of type AdministratorApp.ApiClasses.SendDetail. DateTime content ''2022-01-01T00:00:00'' does not start with ''/Date('' and end with '')/'' as required for JSON.', N'   at System.Runtime.Serialization.XmlObjectSerializer.ReadObjectHandleExceptions(XmlReaderDelegator reader, Boolean verifyObjectName, DataContractResolver dataContractResolver)rn   at System.Runtime.Serialization.Json.DataContractJsonSerializer.ReadObject(XmlDictionaryReader reader)rn   at System.Runtime.Serialization.Json.DataContractJsonSerializer.ReadObject(Stream stream)rn   at AdministratorApp.ApiClasses.APIResult.Deserialize[T](String jsonString) in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesAPIResult.cs:line 415rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 285rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object ReadObjectHandleExceptions(System.Runtime.Serialization.XmlReaderDelegator, Boolean, System.Runtime.Serialization.DataContractResolver)', CAST(N'2021-11-08T14:45:29.5346275' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (60, N'-2146233076', N'There was an error deserializing the object of type AdministratorApp.ApiClasses.SendDetail. DateTime content ''2022-01-01T00:00:00'' does not start with ''/Date('' and end with '')/'' as required for JSON.', N'   at System.Runtime.Serialization.XmlObjectSerializer.ReadObjectHandleExceptions(XmlReaderDelegator reader, Boolean verifyObjectName, DataContractResolver dataContractResolver)rn   at System.Runtime.Serialization.Json.DataContractJsonSerializer.ReadObject(XmlDictionaryReader reader)rn   at System.Runtime.Serialization.Json.DataContractJsonSerializer.ReadObject(Stream stream)rn   at AdministratorApp.ApiClasses.APIResult.Deserialize[T](String jsonString) in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesAPIResult.cs:line 415rn   at AdministratorApp.ApiClasses.PackageUser.<Activateserver>d__82.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackageUser.cs:line 285rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 139', N'System.Object ReadObjectHandleExceptions(System.Runtime.Serialization.XmlReaderDelegator, Boolean, System.Runtime.Serialization.DataContractResolver)', CAST(N'2021-11-08T14:47:20.4109106' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (61, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.PosSerials.<GetAll>d__53.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPosSerials.cs:line 52rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<RefreshPosSerialsList>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 305rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_posSerials.xaml.cs:line 70', N'Void MoveNext()', CAST(N'2021-11-08T15:27:37.3046235' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[error] OFF
GO
SET IDENTITY_INSERT [dbo].[packages] ON 

INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [price], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [islimitDate], [endDate], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (32, N'POS-small-v1', N'', 5, 2, 5, 2, 10, 3, 3, 20, 19, CAST(500.000 AS Decimal(18, 3)), 1, CAST(N'2021-11-07T17:56:59.2659233' AS DateTime2), CAST(N'2021-11-07T17:56:59.2659233' AS DateTime2), N'pos-small-v1', 5, 0, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), 1, 1, N'', NULL)
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [price], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [islimitDate], [endDate], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (33, N'pos-v1', N'', 50, 50, 150, 150, 200, 200, 500, 20, 19, CAST(200.000 AS Decimal(18, 3)), 1, CAST(N'2021-11-07T17:58:09.9456503' AS DateTime2), CAST(N'2021-11-18T11:49:58.3480492' AS DateTime2), N'pk-0000009', 50, 0, NULL, 1, 1, N'', NULL)
SET IDENTITY_INSERT [dbo].[packages] OFF
GO
SET IDENTITY_INSERT [dbo].[packageUser] ON 

INSERT [dbo].[packageUser] ([packageUserId], [packageId], [userId], [packageSaleCode], [packageNumber], [customerId], [customerServerCode], [isBooked], [notes], [createDate], [updateDate], [createUserId], [updateUserId], [bookDate], [isActive], [expireDate], [isOnlineServer]) VALUES (21, 33, 33, N'fHmGS3Sp6uPdHeRk', N'pos12', 7, N'', 0, NULL, CAST(N'2021-11-18T11:51:17.4242789' AS DateTime2), CAST(N'2021-11-18T13:35:48.8765065' AS DateTime2), 1, 1, CAST(N'2021-11-18T13:35:48.8734954' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[packageUser] ([packageUserId], [packageId], [userId], [packageSaleCode], [packageNumber], [customerId], [customerServerCode], [isBooked], [notes], [createDate], [updateDate], [createUserId], [updateUserId], [bookDate], [isActive], [expireDate], [isOnlineServer]) VALUES (22, 33, 33, N'zN7vh7yH6ULaXmac', N'pos12', 7, NULL, 0, NULL, CAST(N'2021-11-18T11:51:17.9750518' AS DateTime2), CAST(N'2021-11-18T11:51:17.9750518' AS DateTime2), 1, 1, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[packageUser] OFF
GO
SET IDENTITY_INSERT [dbo].[posSerials] ON 

INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (10, N'C9C2Cz14NKT2NJ3F', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.5768687' AS DateTime2), CAST(N'2021-11-18T11:51:17.5768687' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (11, N'0Yo3XEqfBN60CH4I', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.6831947' AS DateTime2), CAST(N'2021-11-18T11:51:17.6831947' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (12, N'7gkPFMcHUuKlwmKh', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.6926020' AS DateTime2), CAST(N'2021-11-18T11:51:17.6926020' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (13, N'tB7B6gdfmhu4CbwT', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.6978517' AS DateTime2), CAST(N'2021-11-18T11:51:17.6978517' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (14, N'IdoIInRTHpLIW1RM', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7048369' AS DateTime2), CAST(N'2021-11-18T11:51:17.7048369' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (15, N'AGBFRojZwEcJBEob', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7096579' AS DateTime2), CAST(N'2021-11-18T11:51:17.7096579' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (16, N'OLJhbcUApyD60S6e', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7136169' AS DateTime2), CAST(N'2021-11-18T11:51:17.7136169' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (17, N'boM03fxckJ9jFZeW', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7200524' AS DateTime2), CAST(N'2021-11-18T11:51:17.7200524' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (18, N'NNC9hRxhCmFj6WjX', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7245081' AS DateTime2), CAST(N'2021-11-18T11:51:17.7245081' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (19, N'6r1s2opGJ4xYUTwm', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7293734' AS DateTime2), CAST(N'2021-11-18T11:51:17.7293734' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (20, N'CJHWpZSEerr20sni', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7357253' AS DateTime2), CAST(N'2021-11-18T11:51:17.7357253' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (21, N'vbUByPtiAUbM1eWv', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7399843' AS DateTime2), CAST(N'2021-11-18T11:51:17.7399843' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (22, N'33osqRo6kjJ296DC', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7446694' AS DateTime2), CAST(N'2021-11-18T11:51:17.7446694' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (23, N'gAJCzYSdtbl7d7TM', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7509862' AS DateTime2), CAST(N'2021-11-18T11:51:17.7509862' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (24, N'loY7bDdVSHErdPIz', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7557025' AS DateTime2), CAST(N'2021-11-18T11:51:17.7557025' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (25, N's7qYXKh1DaaJv77L', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7610568' AS DateTime2), CAST(N'2021-11-18T11:51:17.7610568' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (26, N'lsKlGAcgPYreCsoD', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7680419' AS DateTime2), CAST(N'2021-11-18T11:51:17.7680419' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (27, N'CLNjgdhzHTqb4bIA', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7730332' AS DateTime2), CAST(N'2021-11-18T11:51:17.7730332' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (28, N'3uds31em9uxPKlzT', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7783308' AS DateTime2), CAST(N'2021-11-18T11:51:17.7783308' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (29, N'4qoI4044uKV21G7F', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7863098' AS DateTime2), CAST(N'2021-11-18T11:51:17.7863098' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (30, N'jaG6XRQADVPP469P', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7916599' AS DateTime2), CAST(N'2021-11-18T11:51:17.7916599' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (31, N'm9122RIiutxde0hD', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.7976483' AS DateTime2), CAST(N'2021-11-18T11:51:17.7976483' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (32, N'LMDvN9auG06hDHWS', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8032756' AS DateTime2), CAST(N'2021-11-18T11:51:17.8032756' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (33, N'vVcYSpvh3rDtrBRC', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8082654' AS DateTime2), CAST(N'2021-11-18T11:51:17.8082654' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (34, N'6EL4VGCU7OBaAfR0', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8142510' AS DateTime2), CAST(N'2021-11-18T11:51:17.8142510' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (35, N'COKvcYDOpRSN6NfS', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8197073' AS DateTime2), CAST(N'2021-11-18T11:51:17.8197073' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (36, N'oof1HcgkrixkJEKh', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8256939' AS DateTime2), CAST(N'2021-11-18T11:51:17.8256939' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (37, N'CmhKGwB0CHDt0JW2', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8306811' AS DateTime2), CAST(N'2021-11-18T11:51:17.8306811' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (38, N'knwSJnLDQsPlRS3x', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8371806' AS DateTime2), CAST(N'2021-11-18T11:51:17.8371806' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (39, N'rDi1WdA2Yj3wEPOF', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8424598' AS DateTime2), CAST(N'2021-11-18T11:51:17.8424598' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (40, N'3StjuiSirJzCFOHE', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8474506' AS DateTime2), CAST(N'2021-11-18T11:51:17.8474506' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (41, N'fY61K01nK0HPewAG', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8534467' AS DateTime2), CAST(N'2021-11-18T11:51:17.8534467' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (42, N'10kkgLXaQdmLl3i2', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8592324' AS DateTime2), CAST(N'2021-11-18T11:51:17.8592324' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (43, N'T91rgWbgJPM79gkj', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8642204' AS DateTime2), CAST(N'2021-11-18T11:51:17.8642204' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (44, N'LqWl9s3bhSf1agK3', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8711997' AS DateTime2), CAST(N'2021-11-18T11:51:17.8711997' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (45, N'CAU6MpnYOFM3Cks2', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8771887' AS DateTime2), CAST(N'2021-11-18T11:51:17.8771887' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (46, N'qkE49oFjGEPrBYDW', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8844794' AS DateTime2), CAST(N'2021-11-18T11:51:17.8844794' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (47, N'e1FjPsnInAsFnq0g', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8919552' AS DateTime2), CAST(N'2021-11-18T11:51:17.8919552' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (48, N'oaBU7HLW60FPN0UI', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.8978346' AS DateTime2), CAST(N'2021-11-18T11:51:17.8978346' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (49, N'zGyAjLgn23BRjhVc', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9046493' AS DateTime2), CAST(N'2021-11-18T11:51:17.9046493' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (50, N'GCRHBsDJXgQgL9XE', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9108471' AS DateTime2), CAST(N'2021-11-18T11:51:17.9108471' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (51, N'tIydoXi2YiUeJskl', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9179264' AS DateTime2), CAST(N'2021-11-18T11:51:17.9179264' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (52, N'iPSNJDx9dc4RRGl7', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9240344' AS DateTime2), CAST(N'2021-11-18T11:51:17.9240344' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (53, N'E76YHAw7b1pvfWoC', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9299653' AS DateTime2), CAST(N'2021-11-18T11:51:17.9299653' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (54, N'hli9atbxdYgBlh72', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9373519' AS DateTime2), CAST(N'2021-11-18T11:51:17.9373519' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (55, N'zK9E1ErsclTqleKB', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9430787' AS DateTime2), CAST(N'2021-11-18T11:51:17.9430787' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (56, N'HDhzkSZ4JoyOXA9C', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9481610' AS DateTime2), CAST(N'2021-11-18T11:51:17.9481610' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (57, N'3maWqFKdLpe6J2nZ', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9553910' AS DateTime2), CAST(N'2021-11-18T11:51:17.9553910' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (58, N'ZEoIURHSKpQwZJrq', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9608144' AS DateTime2), CAST(N'2021-11-18T11:51:17.9608144' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (59, N'f64TLqaXsezYo1mP', NULL, 21, 0, 1, CAST(N'2021-11-18T11:51:17.9687263' AS DateTime2), CAST(N'2021-11-18T11:51:17.9687263' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (60, N'YNuxxb6eFdxPbg69', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:17.9862632' AS DateTime2), CAST(N'2021-11-18T11:51:17.9862632' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (61, N'3Nqelvk6FDB0NuHy', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:17.9925484' AS DateTime2), CAST(N'2021-11-18T11:51:17.9925484' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (62, N'YRqHiCALmrQ69hAL', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:17.9995314' AS DateTime2), CAST(N'2021-11-18T11:51:17.9995314' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (63, N'ry9isKOnL3n4vy7q', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0064366' AS DateTime2), CAST(N'2021-11-18T11:51:18.0064366' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (64, N'hlfCXV7G76ccssbv', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0130648' AS DateTime2), CAST(N'2021-11-18T11:51:18.0130648' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (65, N'J0Q9X1DjrpC39Pv1', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0199481' AS DateTime2), CAST(N'2021-11-18T11:51:18.0199481' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (66, N'AYwY0tSGBv3Ss04R', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0257446' AS DateTime2), CAST(N'2021-11-18T11:51:18.0257446' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (67, N'o2N4Do6ORT7f297l', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0323791' AS DateTime2), CAST(N'2021-11-18T11:51:18.0323791' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (68, N'CQtwiZiE99h3Ifl1', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0391068' AS DateTime2), CAST(N'2021-11-18T11:51:18.0391068' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (69, N'nKY3X3DFJ17iH3uU', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0471120' AS DateTime2), CAST(N'2021-11-18T11:51:18.0471120' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (70, N'9OEaTfnvG6eFCp4m', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0538627' AS DateTime2), CAST(N'2021-11-18T11:51:18.0538627' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (71, N'eBcGjvai0jkVK9qg', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0599329' AS DateTime2), CAST(N'2021-11-18T11:51:18.0599329' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (72, N'6B4FRkMJpJHO3LbW', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0657434' AS DateTime2), CAST(N'2021-11-18T11:51:18.0657434' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (73, N'Ap43sEaNHoHkLEoT', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0720986' AS DateTime2), CAST(N'2021-11-18T11:51:18.0720986' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (74, N'HS43apFuJhKOpukF', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0792909' AS DateTime2), CAST(N'2021-11-18T11:51:18.0792909' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (75, N'htavlYCN7ZtWEek7', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0864850' AS DateTime2), CAST(N'2021-11-18T11:51:18.0864850' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (76, N'2fE3YdO47wnrVnks', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0931812' AS DateTime2), CAST(N'2021-11-18T11:51:18.0931812' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (77, N'uMYk4CVcJyQZ4xHD', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.0997258' AS DateTime2), CAST(N'2021-11-18T11:51:18.0997258' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (78, N'zdiSVCHdTefCuqZO', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1067017' AS DateTime2), CAST(N'2021-11-18T11:51:18.1067017' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (79, N'xKMYMsjlMV2v272J', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1133087' AS DateTime2), CAST(N'2021-11-18T11:51:18.1133087' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (80, N'IBeiJGHrtOAVCe4u', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1203676' AS DateTime2), CAST(N'2021-11-18T11:51:18.1203676' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (81, N'3RfqcW9SKdgIhWp0', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1267192' AS DateTime2), CAST(N'2021-11-18T11:51:18.1267192' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (82, N'PDfLFTHtWN3HCZuo', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1330497' AS DateTime2), CAST(N'2021-11-18T11:51:18.1330497' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (83, N'ytBdwBIv3mVvBvG7', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1397116' AS DateTime2), CAST(N'2021-11-18T11:51:18.1397116' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (84, N'WyK2MddcLqMAuIIp', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1458667' AS DateTime2), CAST(N'2021-11-18T11:51:18.1458667' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (85, N'ymndrWmO0Ek9UqXS', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1531065' AS DateTime2), CAST(N'2021-11-18T11:51:18.1531065' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (86, N'Ct1OVfesRAna7hq6', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1588829' AS DateTime2), CAST(N'2021-11-18T11:51:18.1588829' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (87, N'B0EW4kCfuMY2tsdR', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1643586' AS DateTime2), CAST(N'2021-11-18T11:51:18.1643586' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (88, N'z9x49jnET9m9DBeX', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1723525' AS DateTime2), CAST(N'2021-11-18T11:51:18.1723525' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (89, N'dVHygoF4XhQIcbz1', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1781850' AS DateTime2), CAST(N'2021-11-18T11:51:18.1781850' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (90, N'h7hTjcEetOun1vVK', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1857261' AS DateTime2), CAST(N'2021-11-18T11:51:18.1857261' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (91, N'347UYGmbflogzCzD', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1917940' AS DateTime2), CAST(N'2021-11-18T11:51:18.1917940' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (92, N'WR3kY6oOodpyI2H0', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.1976173' AS DateTime2), CAST(N'2021-11-18T11:51:18.1976173' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (93, N'oHdqLnP9r0KbCOCz', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2046630' AS DateTime2), CAST(N'2021-11-18T11:51:18.2046630' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (94, N'dvpC1rzXvaMI0Jgg', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2101753' AS DateTime2), CAST(N'2021-11-18T11:51:18.2101753' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (95, N'ickDSiiDzDeDHc7V', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2171647' AS DateTime2), CAST(N'2021-11-18T11:51:18.2171647' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (96, N'SxEJZYnnyfZJaaKD', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2236800' AS DateTime2), CAST(N'2021-11-18T11:51:18.2236800' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (97, N'BPCdza4ArDSOwAAV', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2297008' AS DateTime2), CAST(N'2021-11-18T11:51:18.2297008' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (98, N'wjn9ZIgf4BGUkU9o', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2363276' AS DateTime2), CAST(N'2021-11-18T11:51:18.2363276' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (99, N'J69krjf3Flk1gzf4', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2426281' AS DateTime2), CAST(N'2021-11-18T11:51:18.2426281' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (100, N'AG49Zdj4MOEY2jkP', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2504716' AS DateTime2), CAST(N'2021-11-18T11:51:18.2504716' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (101, N'4ZAP66tvCe0rH9Cz', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2561078' AS DateTime2), CAST(N'2021-11-18T11:51:18.2561078' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (102, N'0f9oLJTD0mBJ2JjL', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2631930' AS DateTime2), CAST(N'2021-11-18T11:51:18.2631930' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (103, N'ANX1NG366BDGXxSg', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2696258' AS DateTime2), CAST(N'2021-11-18T11:51:18.2696258' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (104, N'RZHNiEOtWweIGUWm', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2760529' AS DateTime2), CAST(N'2021-11-18T11:51:18.2760529' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (105, N'XDfSqCfvKFI1siNl', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2818361' AS DateTime2), CAST(N'2021-11-18T11:51:18.2818361' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (106, N'uHuh2sGdJh3EdoSb', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2885932' AS DateTime2), CAST(N'2021-11-18T11:51:18.2885932' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (107, N'uRBQebedIUHmArWI', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.2943586' AS DateTime2), CAST(N'2021-11-18T11:51:18.2943586' AS DateTime2), NULL, 1, 1, NULL)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (108, N'IvEYhXpb1rXToDj9', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.3028788' AS DateTime2), CAST(N'2021-11-18T11:51:18.3028788' AS DateTime2), NULL, 1, 1, NULL)
GO
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [apikey], [createUserId], [updateUserId], [notes]) VALUES (109, N'KkzCQrw10ndDBJ7j', NULL, 22, 0, 1, CAST(N'2021-11-18T11:51:18.3086154' AS DateTime2), CAST(N'2021-11-18T11:51:18.3086154' AS DateTime2), NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[posSerials] OFF
GO
SET IDENTITY_INSERT [dbo].[programs] ON 

INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (20, N'pos', N'pos 1', 1, CAST(N'2021-11-07T13:30:25.4896110' AS DateTime2), CAST(N'2021-11-07T13:30:25.4896110' AS DateTime2), N'pos-1', 1, 1, N'', N'fffa37f491e7af2b273e7b660c87de93')
SET IDENTITY_INSERT [dbo].[programs] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [hashCode], [isAdmin], [groupId], [balanceType], [job], [isOnline]) VALUES (1, N'admin', N'admin', N'admin', NULL, N'', NULL, N'+963-966376308', NULL, N'', NULL, NULL, CAST(N'2021-09-09T13:01:25.8472498' AS DateTime2), NULL, N'admin', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'U-000001', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [hashCode], [isAdmin], [groupId], [balanceType], [job], [isOnline]) VALUES (32, N'naji', N'naji', N'masri', NULL, N'', NULL, N'+963-093565656', NULL, N'', NULL, CAST(N'2021-11-07T13:31:57.5102753' AS DateTime2), CAST(N'2021-11-07T13:31:57.5102753' AS DateTime2), N'9b43a5e653134fc8350ca9944eadaf2f', N'ad', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'AD-000001', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [hashCode], [isAdmin], [groupId], [balanceType], [job], [isOnline]) VALUES (33, N'Saeed', N'saeed', N'Salem', NULL, N'', NULL, N'+965-953232632', NULL, N'', N'Vip', CAST(N'2021-11-07T13:32:45.0622617' AS DateTime2), CAST(N'2021-11-07T13:32:45.0622617' AS DateTime2), N'9b43a5e653134fc8350ca9944eadaf2f', N'agent', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'AG-000001', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[versions] ON 

INSERT [dbo].[versions] ([verId], [name], [details], [isActive], [versionscode], [createDate], [updateDate], [createUserId], [updateUserId], [programId], [notes], [hashCode]) VALUES (19, N'ver1', N'pos test', 1, N'V-001', CAST(N'2021-11-07T13:30:50.6594286' AS DateTime2), CAST(N'2021-11-07T13:30:50.6594286' AS DateTime2), 1, 1, 20, N'', NULL)
SET IDENTITY_INSERT [dbo].[versions] OFF
GO
ALTER TABLE [dbo].[countriesCodes] ADD  CONSTRAINT [DF_countriesCodes_isDefault]  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_branchCount]  DEFAULT ((0)) FOR [branchCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_posCount]  DEFAULT ((0)) FOR [posCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_userCount]  DEFAULT ((0)) FOR [userCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_vendorCount]  DEFAULT ((0)) FOR [vendorCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_customerCount]  DEFAULT ((0)) FOR [customerCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_itemCount]  DEFAULT ((0)) FOR [itemCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_salesInvCount]  DEFAULT ((0)) FOR [salesInvCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_storeCount]  DEFAULT ((0)) FOR [storeCount]
GO
ALTER TABLE [dbo].[packages] ADD  CONSTRAINT [DF_packages_islimitDate_1]  DEFAULT ((1)) FOR [islimitDate]
GO
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_isBooked]  DEFAULT ((0)) FOR [isBooked]
GO
ALTER TABLE [dbo].[posSerials] ADD  CONSTRAINT [DF_posSerials_isBooked]  DEFAULT ((0)) FOR [isBooked]
GO
ALTER TABLE [dbo].[posSerials] ADD  CONSTRAINT [DF_posSerials_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[programs] ADD  CONSTRAINT [DF_programs_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[versions] ADD  CONSTRAINT [DF_versions_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_cities_countriesCodes]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_users]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_users1]
GO
ALTER TABLE [dbo].[error]  WITH CHECK ADD  CONSTRAINT [FK_error_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[error] CHECK CONSTRAINT [FK_error_users]
GO
ALTER TABLE [dbo].[groupObject]  WITH CHECK ADD  CONSTRAINT [FK_groupObject_groups] FOREIGN KEY([groupId])
REFERENCES [dbo].[groups] ([groupId])
GO
ALTER TABLE [dbo].[groupObject] CHECK CONSTRAINT [FK_groupObject_groups]
GO
ALTER TABLE [dbo].[groupObject]  WITH CHECK ADD  CONSTRAINT [FK_groupObject_objects] FOREIGN KEY([objectId])
REFERENCES [dbo].[objects] ([objectId])
GO
ALTER TABLE [dbo].[groupObject] CHECK CONSTRAINT [FK_groupObject_objects]
GO
ALTER TABLE [dbo].[groupObject]  WITH CHECK ADD  CONSTRAINT [FK_groupObject_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[groupObject] CHECK CONSTRAINT [FK_groupObject_users]
GO
ALTER TABLE [dbo].[groupObject]  WITH CHECK ADD  CONSTRAINT [FK_groupObject_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[groupObject] CHECK CONSTRAINT [FK_groupObject_users1]
GO
ALTER TABLE [dbo].[groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[groups] CHECK CONSTRAINT [FK_groups_users1]
GO
ALTER TABLE [dbo].[groups]  WITH CHECK ADD  CONSTRAINT [FK_groups_users2] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[groups] CHECK CONSTRAINT [FK_groups_users2]
GO
ALTER TABLE [dbo].[objects]  WITH CHECK ADD  CONSTRAINT [FK_objects_objects] FOREIGN KEY([parentObjectId])
REFERENCES [dbo].[objects] ([objectId])
GO
ALTER TABLE [dbo].[objects] CHECK CONSTRAINT [FK_objects_objects]
GO
ALTER TABLE [dbo].[objects]  WITH CHECK ADD  CONSTRAINT [FK_objects_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[objects] CHECK CONSTRAINT [FK_objects_users]
GO
ALTER TABLE [dbo].[objects]  WITH CHECK ADD  CONSTRAINT [FK_objects_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[objects] CHECK CONSTRAINT [FK_objects_users1]
GO
ALTER TABLE [dbo].[packages]  WITH CHECK ADD  CONSTRAINT [FK_packages_programs] FOREIGN KEY([programId])
REFERENCES [dbo].[programs] ([programId])
GO
ALTER TABLE [dbo].[packages] CHECK CONSTRAINT [FK_packages_programs]
GO
ALTER TABLE [dbo].[packages]  WITH CHECK ADD  CONSTRAINT [FK_packages_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[packages] CHECK CONSTRAINT [FK_packages_users]
GO
ALTER TABLE [dbo].[packages]  WITH CHECK ADD  CONSTRAINT [FK_packages_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[packages] CHECK CONSTRAINT [FK_packages_users1]
GO
ALTER TABLE [dbo].[packages]  WITH CHECK ADD  CONSTRAINT [FK_packages_versions] FOREIGN KEY([verId])
REFERENCES [dbo].[versions] ([verId])
GO
ALTER TABLE [dbo].[packages] CHECK CONSTRAINT [FK_packages_versions]
GO
ALTER TABLE [dbo].[packageUser]  WITH CHECK ADD  CONSTRAINT [FK_packageUser_customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[customers] ([custId])
GO
ALTER TABLE [dbo].[packageUser] CHECK CONSTRAINT [FK_packageUser_customers]
GO
ALTER TABLE [dbo].[packageUser]  WITH CHECK ADD  CONSTRAINT [FK_packageUser_packages] FOREIGN KEY([packageId])
REFERENCES [dbo].[packages] ([packageId])
GO
ALTER TABLE [dbo].[packageUser] CHECK CONSTRAINT [FK_packageUser_packages]
GO
ALTER TABLE [dbo].[packageUser]  WITH CHECK ADD  CONSTRAINT [FK_packageUser_users] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[packageUser] CHECK CONSTRAINT [FK_packageUser_users]
GO
ALTER TABLE [dbo].[packageUser]  WITH CHECK ADD  CONSTRAINT [FK_packageUser_users1] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[packageUser] CHECK CONSTRAINT [FK_packageUser_users1]
GO
ALTER TABLE [dbo].[packageUser]  WITH CHECK ADD  CONSTRAINT [FK_packageUser_users2] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[packageUser] CHECK CONSTRAINT [FK_packageUser_users2]
GO
ALTER TABLE [dbo].[posSerials]  WITH CHECK ADD  CONSTRAINT [FK_posSerials_packageUser] FOREIGN KEY([packageUserId])
REFERENCES [dbo].[packageUser] ([packageUserId])
GO
ALTER TABLE [dbo].[posSerials] CHECK CONSTRAINT [FK_posSerials_packageUser]
GO
ALTER TABLE [dbo].[posSerials]  WITH CHECK ADD  CONSTRAINT [FK_posSerials_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[posSerials] CHECK CONSTRAINT [FK_posSerials_users]
GO
ALTER TABLE [dbo].[posSerials]  WITH CHECK ADD  CONSTRAINT [FK_posSerials_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[posSerials] CHECK CONSTRAINT [FK_posSerials_users1]
GO
ALTER TABLE [dbo].[programs]  WITH CHECK ADD  CONSTRAINT [FK_programs_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[programs] CHECK CONSTRAINT [FK_programs_users]
GO
ALTER TABLE [dbo].[programs]  WITH CHECK ADD  CONSTRAINT [FK_programs_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[programs] CHECK CONSTRAINT [FK_programs_users1]
GO
ALTER TABLE [dbo].[versions]  WITH CHECK ADD  CONSTRAINT [FK_versions_programs] FOREIGN KEY([programId])
REFERENCES [dbo].[programs] ([programId])
GO
ALTER TABLE [dbo].[versions] CHECK CONSTRAINT [FK_versions_programs]
GO
ALTER TABLE [dbo].[versions]  WITH CHECK ADD  CONSTRAINT [FK_versions_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[versions] CHECK CONSTRAINT [FK_versions_users]
GO
ALTER TABLE [dbo].[versions]  WITH CHECK ADD  CONSTRAINT [FK_versions_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[versions] CHECK CONSTRAINT [FK_versions_users1]
GO
