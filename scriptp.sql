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
/****** Object:  Table [dbo].[versions]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[versions]') AND type in (N'U'))
DROP TABLE [dbo].[versions]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[programs]') AND type in (N'U'))
DROP TABLE [dbo].[programs]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posSerials]') AND type in (N'U'))
DROP TABLE [dbo].[posSerials]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packageUser]') AND type in (N'U'))
DROP TABLE [dbo].[packageUser]
GO
/****** Object:  Table [dbo].[packages]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packages]') AND type in (N'U'))
DROP TABLE [dbo].[packages]
GO
/****** Object:  Table [dbo].[error]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[error]') AND type in (N'U'))
DROP TABLE [dbo].[error]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
DROP TABLE [dbo].[customers]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesCodes]') AND type in (N'U'))
DROP TABLE [dbo].[countriesCodes]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 12/09/2021 01:11:32 ص ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cities]') AND type in (N'U'))
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 12/09/2021 01:11:32 ص ******/
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
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 12/09/2021 01:11:32 ص ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 12/09/2021 01:11:32 ص ******/
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
/****** Object:  Table [dbo].[error]    Script Date: 12/09/2021 01:11:32 ص ******/
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
/****** Object:  Table [dbo].[packages]    Script Date: 12/09/2021 01:11:32 ص ******/
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
/****** Object:  Table [dbo].[packageUser]    Script Date: 12/09/2021 01:11:32 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[packageUser](
	[packageUserId] [int] IDENTITY(1,1) NOT NULL,
	[packageId] [int] NULL,
	[userId] [int] NULL,
	[packageSaleCode] [nvarchar](500) NOT NULL,
	[packageNumber] [nvarchar](500) NOT NULL,
	[customerId] [int] NULL,
	[customerServerCode] [nvarchar](500) NULL,
	[isBooked] [int] NOT NULL,
	[notes] [nvarchar](500) NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[bookDate] [datetime2](7) NULL,
	[isActive] [int] NULL,
	[expireDate] [datetime2](7) NULL,
 CONSTRAINT [PK_spesAgent] PRIMARY KEY CLUSTERED 
(
	[packageUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 12/09/2021 01:11:32 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posSerials](
	[serialId] [int] IDENTITY(1,1) NOT NULL,
	[serial] [nvarchar](500) NOT NULL,
	[posDeviceCode] [nvarchar](500) NULL,
	[packageUserId] [int] NULL,
	[isBooked] [int] NOT NULL,
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
/****** Object:  Table [dbo].[programs]    Script Date: 12/09/2021 01:11:32 ص ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 12/09/2021 01:11:32 ص ******/
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
	[balance] [decimal](18, 3) NOT NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[isActive] [int] NULL,
	[code] [nvarchar](500) NULL,
	[hashCode] [nvarchar](500) NULL,
 CONSTRAINT [PK_agents] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[versions]    Script Date: 12/09/2021 01:11:32 ص ******/
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

INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [hashCode]) VALUES (3, N'NAME', N'LAST      ', N'          ', N'', NULL, N'+974-999999999', NULL, N'', NULL, CAST(N'2021-09-09T15:26:25.2550742' AS DateTime2), CAST(N'2021-09-09T15:45:41.6015442' AS DateTime2), N'Us-000001', N'71f020248a405d21e94d1de52043bed4.jpg', N'', NULL, 1, 1, 1, NULL)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [hashCode]) VALUES (4, N'NAME', N'LAST      ', N'          ', N'', NULL, N'+974-999999999', NULL, N'', NULL, CAST(N'2021-09-09T15:45:23.6310809' AS DateTime2), CAST(N'2021-09-09T15:45:23.6310809' AS DateTime2), N'Cu-000001', N'd2ec5f1ed83abfca0dfec76506b696b3.jpg', N'', NULL, 1, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[error] ON 

INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.ApiConnect.<ApiGetConnect>d__0.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesApiConnect.cs:line 37rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Programs.<GetAll>d__45.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesPrograms.cs:line 44rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<RefreshProgramsList>d__17.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsus_programs.xaml.cs:line 221rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__10.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsus_programs.xaml.cs:line 57', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-09-07T13:08:18.8516357' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (3, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.ApiConnect.<ApiGetConnect>d__0.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesApiConnect.cs:line 37rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Programs.<GetAll>d__45.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesPrograms.cs:line 44rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<RefreshProgramsList>d__17.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsus_programs.xaml.cs:line 221rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<UserControl_Loaded>d__12.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsus_programs.xaml.cs:line 117', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-09-07T13:08:19.8360451' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (4, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.applications.uc_versions.<Btn_add_Click>d__18.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsuc_versions.xaml.cs:line 263', N'Void MoveNext()', CAST(N'2021-09-07T13:48:35.5316187' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (5, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.applications.uc_packages.<Btn_add_Click>d__18.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsuc_packages.xaml.cs:line 277', N'Void MoveNext()', CAST(N'2021-09-07T16:11:30.2040630' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (6, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.applications.uc_packages.<Btn_add_Click>d__18.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsuc_packages.xaml.cs:line 276', N'Void MoveNext()', CAST(N'2021-09-07T16:36:05.4888983' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (7, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.Int32.Parse(String s)rn   at AdministratorApp.View.applications.uc_packages.<Btn_update_Click>d__19.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsuc_packages.xaml.cs:line 328', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-09-07T16:40:42.3455993' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (8, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.Int32.Parse(String s)rn   at AdministratorApp.View.applications.uc_packages.<Btn_update_Click>d__19.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewapplicationsuc_packages.xaml.cs:line 328', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-09-07T16:41:25.6032768' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (9, N'-2146233029', N'A task was canceled.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.ApiConnect.<ApiGetConnect>d__0.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesApiConnect.cs:line 37rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<GetAll>d__93.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesUsers.cs:line 55rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<RefreshUsersList>d__23.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 423rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 182', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-09-07T19:08:27.7911154' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (10, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)rn   at AdministratorApp.Classes.FillCombo.<fillCountries>d__13.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 77rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 77', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2021-09-07T19:32:24.7676743' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (11, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)rn   at AdministratorApp.Classes.FillCombo.<fillCountries>d__13.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 77rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 77', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2021-09-07T19:32:46.1625069' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (12, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)rn   at AdministratorApp.Classes.FillCombo.<fillCountries>d__13.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 80rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 77', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2021-09-07T19:43:43.4732900' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (13, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)rn   at AdministratorApp.Classes.FillCombo.<fillCountries>d__13.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 80rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 77', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2021-09-07T19:51:33.3571372' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (14, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)rn   at AdministratorApp.Classes.FillCombo.<fillCountries>d__13.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 80rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 77', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2021-09-07T19:56:53.5048873' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (15, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)rn   at AdministratorApp.Classes.FillCombo.<fillCountries>d__13.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 80rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 77', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2021-09-07T20:01:04.3314968' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (16, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T01:27:29.0103346' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (17, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 86', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T01:28:05.8783185' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (18, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.View.sectionData.uc_users.Cb_areaPhone_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 548', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-09-08T01:28:22.6345015' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (19, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.View.sectionData.uc_users.Cb_areaPhone_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 548', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-09-08T01:28:29.9152636' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (20, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.View.sectionData.uc_users.Cb_areaPhone_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 548', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-09-08T01:28:33.0350232' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (21, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T01:39:33.4439271' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (22, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 86', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T01:40:02.4132108' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (23, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.View.sectionData.uc_users.Cb_areaPhone_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 548', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-09-08T01:40:18.6163774' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (24, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T01:51:44.0387110' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (25, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 86', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T01:51:45.3358007' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (26, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T02:02:36.1538965' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (27, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 86', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T02:02:37.1692737' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (28, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:01:22.3580206' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (29, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s)rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView()rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext()rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext()', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:01:26.2489457' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (30, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.View.sectionData.uc_users.Cb_areaFax_SelectionChanged(Object sender, SelectionChangedEventArgs e)', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-09-08T12:01:40.2176332' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (31, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:02:54.5317238' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (32, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 86', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:02:55.5471273' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (33, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:03:55.6579010' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (34, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:05:28.7214236' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (35, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:12:19.6011124' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (36, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_users.<Search>b__22_0(Users s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 415rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_users.RefreshUsersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 428rn   at AdministratorApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 419rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__14.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 184', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Users)', CAST(N'2021-09-08T12:14:07.7112399' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (37, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.Classes.FillCombo.fillCountriesLocal(ComboBox combo, Int32 countryid) in E:GitHubposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 75rn   at AdministratorApp.View.sectionData.uc_users.Cb_areaPhone_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 549', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-09-08T12:26:40.1734442' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (38, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.Classes.FillCombo.fillCountriesLocal(ComboBox combo, Int32 countryid) in E:GitHubposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 75rn   at AdministratorApp.View.sectionData.uc_users.Cb_areaPhone_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 549', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-09-08T12:27:02.1113523' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (39, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.ApiConnect.<ApiGetConnect>d__0.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesApiConnect.cs:line 37rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Country.<GetAll>d__21.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesCountry.cs:line 39rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<RefreshCountry>d__11.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 54rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCountries>d__13.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 67rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 78', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-09-09T12:42:14.1203245' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (40, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.ApiConnect.<ApiGetConnect>d__0.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesApiConnect.cs:line 37rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<GetAll>d__93.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesUsers.cs:line 59rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<RefreshUsersList>d__23.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 489rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 370', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-09-09T12:42:13.9169012' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (41, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.ApiConnect.<ApiGetConnect>d__0.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesApiConnect.cs:line 37rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<GetAll>d__93.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesUsers.cs:line 57rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<RefreshUsersList>d__23.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 489rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 370', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-09-09T12:55:34.6046757' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (42, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.ApiConnect.<ApiGetConnect>d__0.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesApiConnect.cs:line 37rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<GetAll>d__93.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppClassesApiClassesUsers.cs:line 57rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<RefreshUsersList>d__23.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 489rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_users.xaml.cs:line 87', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-09-09T12:55:36.5732340' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (43, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_customers.<Search>b__22_0(Customers s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 460rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_customers.RefreshCustomersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 473rn   at AdministratorApp.View.sectionData.uc_customers.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 464rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_customers.<Tgl_isActive_Checked>d__17.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 355', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Customers)', CAST(N'2021-09-09T14:46:22.3018242' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (44, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sectionData.uc_customers.<Search>b__22_0(Customers s) in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 460rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sectionData.uc_customers.RefreshCustomersView() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 473rn   at AdministratorApp.View.sectionData.uc_customers.<Search>d__22.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 464rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_customers.<UserControl_Loaded>d__10.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsectionDatauc_customers.xaml.cs:line 85', N'Boolean <Search>b__22_0(AdministratorApp.ApiClasses.Customers)', CAST(N'2021-09-09T14:46:22.4305302' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[error] OFF
GO
SET IDENTITY_INSERT [dbo].[packages] ON 

INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [price], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [islimitDate], [endDate], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (1, N'name t', N'', 0, 0, 0, 0, 0, 0, 0, 11, 1, CAST(0.000 AS Decimal(18, 3)), 1, CAST(N'2021-09-07T16:24:54.5296766' AS DateTime2), CAST(N'2021-09-07T16:48:46.0286984' AS DateTime2), N'pk-0000009', 0, 1, CAST(N'2021-09-07T00:00:00.0000000' AS DateTime2), 1, 1, N'', NULL)
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [price], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [islimitDate], [endDate], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (2, N'Hello', N'', 8, 40, 3, 3, 5, 40, 43, 11, 1, CAST(10.000 AS Decimal(18, 3)), 1, CAST(N'2021-09-07T16:26:08.8848622' AS DateTime2), CAST(N'2021-09-07T16:45:11.3532177' AS DateTime2), N'pk-0000009', 4, 1, CAST(N'2021-09-03T00:00:00.0000000' AS DateTime2), 1, 1, N'', NULL)
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [price], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [islimitDate], [endDate], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (3, N'test', N'', 3333, 330, 30, 30, 30, 30, 30, 11, 1, CAST(333333.000 AS Decimal(18, 3)), 1, CAST(N'2021-09-07T16:29:13.5138192' AS DateTime2), CAST(N'2021-09-07T16:29:13.5138192' AS DateTime2), N'pk-0000009', 30, 0, CAST(N'2021-09-09T00:00:00.0000000' AS DateTime2), 1, 1, N'3', NULL)
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [price], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [islimitDate], [endDate], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (4, N'444', N'', 44, 40, 40, 40, 40, 40, 40, 5, 1, CAST(4444.000 AS Decimal(18, 3)), 1, CAST(N'2021-09-07T16:30:31.7431055' AS DateTime2), CAST(N'2021-09-07T16:48:07.6074970' AS DateTime2), N'pk-0000009', 40, 0, NULL, 1, 1, N'4', NULL)
SET IDENTITY_INSERT [dbo].[packages] OFF
GO
SET IDENTITY_INSERT [dbo].[programs] ON 

INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (4, N'hello', N'world', 0, CAST(N'2021-09-06T15:47:29.3004354' AS DateTime2), CAST(N'2021-09-07T13:14:30.0738240' AS DateTime2), N'Pr-0000009', NULL, 1, N'!!', NULL)
INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (5, N'p name', N'detatjc', 1, CAST(N'2021-09-06T15:48:08.9356078' AS DateTime2), CAST(N'2021-09-07T13:17:06.3107648' AS DateTime2), N'Pr-0000009', NULL, NULL, N'noot', NULL)
INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (6, N'p name', N'detatjc', 0, CAST(N'2021-09-06T15:48:49.6100306' AS DateTime2), CAST(N'2021-09-06T15:48:49.6100306' AS DateTime2), N'Pr-0000009', NULL, NULL, N'noot', NULL)
INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes], [hashCode]) VALUES (11, N'programTest  1', N'Program Test  details', 1, CAST(N'2021-09-07T12:45:43.8367298' AS DateTime2), CAST(N'2021-09-07T12:45:43.8367298' AS DateTime2), N'Pr-0000009', 1, 1, N'Program Test  note', NULL)
SET IDENTITY_INSERT [dbo].[programs] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [hashCode]) VALUES (1, N'admin', N'admin', N'admin', NULL, N'', NULL, N'+963-966376308', NULL, N'', NULL, NULL, CAST(N'2021-09-09T13:01:25.8472498' AS DateTime2), NULL, N'admin', NULL, N'', CAST(0.000 AS Decimal(18, 3)), 1, 1, 1, N'Us-000001', NULL)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [hashCode]) VALUES (3, N'Hello', N'Hello', N'world', NULL, N'dsad@sac.co', N'+973--222222222', N'+963-222222222', NULL, N'', NULL, CAST(N'2021-09-08T16:38:05.6450493' AS DateTime2), CAST(N'2021-09-09T13:00:55.4854325' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'employee', N'71f020248a405d21e94d1de52043bed4.jpg', N'', CAST(0.000 AS Decimal(18, 3)), 1, 1, 1, N'Us-000001', NULL)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [hashCode]) VALUES (4, N'yasin', N'yasin', N'idlbi', NULL, N'yasinidlbi@gmail.com', NULL, N'+963-944917252', NULL, N'', NULL, CAST(N'2021-09-09T13:02:31.6952838' AS DateTime2), CAST(N'2021-09-09T13:02:50.6357638' AS DateTime2), N'f5bafebd2186dd318f01d68786f1c40d', N'admin', N'd2ec5f1ed83abfca0dfec76506b696b3.jpg', N'', CAST(0.000 AS Decimal(18, 3)), 1, 1, 1, N'Us-000001', NULL)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [hashCode]) VALUES (6, N'agent', N'agent', N'agent', NULL, N'', NULL, N'+961-944444444', NULL, N'', N'Vip', CAST(N'2021-09-09T13:37:44.2970627' AS DateTime2), CAST(N'2021-09-09T13:38:00.0608790' AS DateTime2), N'4f5ddcd39a50aaa23b681754c1243bac', N'agent', N'56a2e0231c3d394ace201adf37d13f63.jpg', N'', CAST(0.000 AS Decimal(18, 3)), 1, 1, 1, N'Us-000001', NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[versions] ON 

INSERT [dbo].[versions] ([verId], [name], [details], [isActive], [versionscode], [createDate], [updateDate], [createUserId], [updateUserId], [programId], [notes], [hashCode]) VALUES (1, N'verTest 1', N'verTest details 1', 1, N'vr-0000009', CAST(N'2021-09-07T13:51:27.7195681' AS DateTime2), CAST(N'2021-09-07T13:51:27.7195681' AS DateTime2), 1, 1, 5, N'verTest notes 1', NULL)
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
