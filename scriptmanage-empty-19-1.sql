USE [incprogramsdb]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_users1]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_users]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_programs]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [FK_users_countriesCodes]
GO
ALTER TABLE [dbo].[puStatus] DROP CONSTRAINT [FK_puStatus_packageUser]
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
ALTER TABLE [dbo].[posInfo] DROP CONSTRAINT [FK_posInfo_posSerials]
GO
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_users2]
GO
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_users1]
GO
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_users]
GO
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_packageUser]
GO
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_packages]
GO
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_customers]
GO
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_countryPackageDate]
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
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [FK_packageUser_countryPackageDate]
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
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_countriesCodes]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [FK_countryPackageDate_users1]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [FK_countryPackageDate_users]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [FK_countryPackageDate_packages]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [FK_countryPackageDate_countriesCodes]
GO
ALTER TABLE [dbo].[cities] DROP CONSTRAINT [FK_cities_countriesCodes]
GO
ALTER TABLE [dbo].[agentPackage] DROP CONSTRAINT [FK_agentPackage_users2]
GO
ALTER TABLE [dbo].[agentPackage] DROP CONSTRAINT [FK_agentPackage_users1]
GO
ALTER TABLE [dbo].[agentPackage] DROP CONSTRAINT [FK_agentPackage_users]
GO
ALTER TABLE [dbo].[agentPackage] DROP CONSTRAINT [FK_agentPackage_packages]
GO
ALTER TABLE [dbo].[agentCustomer] DROP CONSTRAINT [FK_agentCustomer_users2]
GO
ALTER TABLE [dbo].[agentCustomer] DROP CONSTRAINT [FK_agentCustomer_users1]
GO
ALTER TABLE [dbo].[agentCustomer] DROP CONSTRAINT [FK_agentCustomer_users]
GO
ALTER TABLE [dbo].[agentCustomer] DROP CONSTRAINT [FK_agentCustomer_customers]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [DF_versions_isActive]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF_users_balance]
GO
ALTER TABLE [dbo].[programs] DROP CONSTRAINT [DF_programs_isActive]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [DF_posSerials_unLimited]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [DF_posSerials_isActive]
GO
ALTER TABLE [dbo].[posSerials] DROP CONSTRAINT [DF_posSerials_isBooked]
GO
ALTER TABLE [dbo].[posInfo] DROP CONSTRAINT [DF_posInfo_isBooked]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_isServerActivated]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_monthCount]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_salesInvCount]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_isPayed]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_oldPackageId]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_canRenew]
GO
ALTER TABLE [dbo].[packageUser] DROP CONSTRAINT [DF_packageUser_isBooked]
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
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [DF_customers_balanceType]
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [DF_customers_balance]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [DF_countryPackageDate_agentPrice]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [DF_countryPackageDate_islimitDate]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [DF_countryPackageDate_yearCount]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [DF_countryPackageDate_monthCount]
GO
ALTER TABLE [dbo].[countriesCodes] DROP CONSTRAINT [DF_countriesCodes_isDefault]
GO
/****** Object:  Table [dbo].[versions]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[versions]') AND type in (N'U'))
DROP TABLE [dbo].[versions]
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[puStatus]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[puStatus]') AND type in (N'U'))
DROP TABLE [dbo].[puStatus]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[programs]') AND type in (N'U'))
DROP TABLE [dbo].[programs]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posSerials]') AND type in (N'U'))
DROP TABLE [dbo].[posSerials]
GO
/****** Object:  Table [dbo].[posInfo]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posInfo]') AND type in (N'U'))
DROP TABLE [dbo].[posInfo]
GO
/****** Object:  Table [dbo].[payOp]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payOp]') AND type in (N'U'))
DROP TABLE [dbo].[payOp]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packageUser]') AND type in (N'U'))
DROP TABLE [dbo].[packageUser]
GO
/****** Object:  Table [dbo].[packages]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packages]') AND type in (N'U'))
DROP TABLE [dbo].[packages]
GO
/****** Object:  Table [dbo].[objects]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objects]') AND type in (N'U'))
DROP TABLE [dbo].[objects]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
DROP TABLE [dbo].[groups]
GO
/****** Object:  Table [dbo].[groupObject]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groupObject]') AND type in (N'U'))
DROP TABLE [dbo].[groupObject]
GO
/****** Object:  Table [dbo].[error]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[error]') AND type in (N'U'))
DROP TABLE [dbo].[error]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
DROP TABLE [dbo].[customers]
GO
/****** Object:  Table [dbo].[countryPackageDate]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countryPackageDate]') AND type in (N'U'))
DROP TABLE [dbo].[countryPackageDate]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesCodes]') AND type in (N'U'))
DROP TABLE [dbo].[countriesCodes]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cities]') AND type in (N'U'))
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[agentPackage]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agentPackage]') AND type in (N'U'))
DROP TABLE [dbo].[agentPackage]
GO
/****** Object:  Table [dbo].[agentCustomer]    Script Date: 1/19/2022 6:51:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agentCustomer]') AND type in (N'U'))
DROP TABLE [dbo].[agentCustomer]
GO
/****** Object:  Table [dbo].[agentCustomer]    Script Date: 1/19/2022 6:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agentCustomer](
	[agentCustomerId] [int] IDENTITY(1,1) NOT NULL,
	[agentId] [int] NULL,
	[customerId] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_agentCustomer] PRIMARY KEY CLUSTERED 
(
	[agentCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agentPackage]    Script Date: 1/19/2022 6:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agentPackage](
	[agentPackageId] [int] IDENTITY(1,1) NOT NULL,
	[agentId] [int] NULL,
	[packageId] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_agentPackage] PRIMARY KEY CLUSTERED 
(
	[agentPackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 1/19/2022 6:51:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 1/19/2022 6:51:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countryPackageDate]    Script Date: 1/19/2022 6:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countryPackageDate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[countryId] [int] NULL,
	[packageId] [int] NULL,
	[monthCount] [int] NOT NULL,
	[yearCount] [int] NOT NULL,
	[price] [decimal](20, 3) NULL,
	[notes] [nvarchar](500) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[islimitDate] [bit] NOT NULL,
	[isActive] [int] NULL,
	[agentPrice] [decimal](20, 3) NOT NULL,
 CONSTRAINT [PK_countryPackageDate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 1/19/2022 6:51:16 PM ******/
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
	[balance] [decimal](20, 3) NOT NULL,
	[balanceType] [tinyint] NOT NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[isActive] [int] NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[custId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error]    Script Date: 1/19/2022 6:51:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groupObject]    Script Date: 1/19/2022 6:51:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 1/19/2022 6:51:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objects]    Script Date: 1/19/2022 6:51:16 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[packages]    Script Date: 1/19/2022 6:51:16 PM ******/
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
	[isActive] [int] NOT NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[packageCode] [nvarchar](500) NOT NULL,
	[storeCount] [int] NOT NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_packageSpec] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 1/19/2022 6:51:16 PM ******/
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
	[countryPackageId] [int] NULL,
	[canRenew] [bit] NOT NULL,
	[oldPackageId] [int] NOT NULL,
	[type] [nvarchar](10) NULL,
	[isPayed] [bit] NOT NULL,
	[salesInvCount] [int] NOT NULL,
	[monthCount] [int] NOT NULL,
	[totalsalesInvCount] [int] NOT NULL,
	[activatedate] [datetime2](7) NULL,
	[isServerActivated] [bit] NOT NULL,
	[oldCountryPackageId] [int] NULL,
	[confirmStat] [nvarchar](10) NULL,
 CONSTRAINT [PK_spesAgent] PRIMARY KEY CLUSTERED 
(
	[packageUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payOp]    Script Date: 1/19/2022 6:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payOp](
	[payOpId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](20, 3) NOT NULL,
	[code] [nvarchar](500) NULL,
	[type] [nvarchar](10) NULL,
	[packageUserId] [int] NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[notes] [ntext] NULL,
	[discountValue] [decimal](20, 3) NOT NULL,
	[agentId] [int] NULL,
	[customerId] [int] NULL,
	[countryPackageId] [int] NULL,
	[totalnet] [decimal](20, 3) NOT NULL,
	[packageId] [int] NULL,
	[expireDate] [datetime2](7) NULL,
 CONSTRAINT [PK_payOp] PRIMARY KEY CLUSTERED 
(
	[payOpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posInfo]    Script Date: 1/19/2022 6:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posInfo](
	[posInfoId] [int] IDENTITY(1,1) NOT NULL,
	[posName] [nvarchar](500) NULL,
	[branchName] [nvarchar](500) NULL,
	[posDeviceCode] [nvarchar](500) NULL,
	[isBooked] [bit] NULL,
	[isActive] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[serialId] [int] NULL,
	[posSettingId] [int] NULL,
	[posId] [int] NULL,
 CONSTRAINT [PK_posInfo] PRIMARY KEY CLUSTERED 
(
	[posInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 1/19/2022 6:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posSerials](
	[serialId] [int] IDENTITY(1,1) NOT NULL,
	[serial] [nvarchar](500) NULL,
	[posDeviceCode] [nvarchar](500) NULL,
	[packageUserId] [int] NULL,
	[isBooked] [bit] NULL,
	[isActive] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[unLimited] [bit] NOT NULL,
 CONSTRAINT [PK_posSerials] PRIMARY KEY CLUSTERED 
(
	[serialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 1/19/2022 6:51:16 PM ******/
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
 CONSTRAINT [PK_packages] PRIMARY KEY CLUSTERED 
(
	[programId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puStatus]    Script Date: 1/19/2022 6:51:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puStatus](
	[stateId] [int] IDENTITY(1,1) NOT NULL,
	[isActive] [int] NULL,
	[packageUserId] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_puStatus] PRIMARY KEY CLUSTERED 
(
	[stateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/19/2022 6:51:16 PM ******/
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
	[isAdmin] [bit] NULL,
	[groupId] [int] NULL,
	[balanceType] [tinyint] NULL,
	[job] [nvarchar](100) NULL,
	[isOnline] [tinyint] NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_agents] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[versions]    Script Date: 1/19/2022 6:51:16 PM ******/
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
 CONSTRAINT [PK_versions] PRIMARY KEY CLUSTERED 
(
	[verId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (62, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showTextBoxValidate(TextBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 292rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__15.MoveNext() in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 217', N'Void showTextBoxValidate(System.Windows.Controls.TextBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T15:28:33.4383722' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (63, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showTextBoxValidate(TextBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 292rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__15.MoveNext() in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 217', N'Void showTextBoxValidate(System.Windows.Controls.TextBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T15:29:10.1844869' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (64, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showPasswordValidate(PasswordBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 298rn   at AdministratorApp.View.windows.wd_logIn.validateEvent(Object sender, RoutedEventArgs e) in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 151', N'Void showPasswordValidate(System.Windows.Controls.PasswordBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T15:36:18.1236993' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (65, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showPasswordValidate(PasswordBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 298rn   at AdministratorApp.View.windows.wd_logIn.validateEvent(Object sender, RoutedEventArgs e) in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 151', N'Void showPasswordValidate(System.Windows.Controls.PasswordBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T15:36:31.1746143' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (66, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showPasswordValidate(PasswordBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 298rn   at AdministratorApp.View.windows.wd_logIn.validateEvent(Object sender, RoutedEventArgs e) in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 151', N'Void showPasswordValidate(System.Windows.Controls.PasswordBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T15:36:37.4119305' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (67, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showPasswordValidate(PasswordBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 298rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__14.MoveNext() in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 227', N'Void showPasswordValidate(System.Windows.Controls.PasswordBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T15:45:53.1504608' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (68, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showTextBoxValidate(TextBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 292rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__14.MoveNext() in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 220', N'Void showTextBoxValidate(System.Windows.Controls.TextBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T15:46:02.7000433' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (69, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.Classes.HelpClass.showTextBoxValidate(TextBox tb, Path p_error, ToolTip tt_error, String tr) in E:AdministratorApp 24-11-2021AdministratorAppClassesHelpClass.cs:line 292rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__16.MoveNext() in E:AdministratorApp 24-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 231', N'Void showTextBoxValidate(System.Windows.Controls.TextBox, System.Windows.Shapes.Path, System.Windows.Controls.ToolTip, System.String)', CAST(N'2021-11-24T16:19:33.4502500' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (70, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.APIResult.<getList>d__1.MoveNext() in E:AdministratorApp 27-11-2021AdministratorAppClassesApiClassesAPIResult.cs:line 88rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<Getloginuser>d__119.MoveNext() in E:AdministratorApp 27-11-2021AdministratorAppClassesApiClassesUsers.cs:line 101rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__16.MoveNext() in E:AdministratorApp 27-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 232', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-11-27T14:35:11.1920362' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (71, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Btn_add_Click>d__24.MoveNext() in E:AdministratorApp 29-11-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 327', N'Void MoveNext()', CAST(N'2021-11-29T14:19:22.5305842' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (72, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Btn_add_Click>d__24.MoveNext() in E:AdministratorApp 29-11-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 327', N'Void MoveNext()', CAST(N'2021-11-29T14:20:33.8594259' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (73, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.APIResult.<getList>d__1.MoveNext() in E:AdministratorApp 29-11-2021AdministratorAppClassesApiClassesAPIResult.cs:line 88rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<Getloginuser>d__119.MoveNext() in E:AdministratorApp 29-11-2021AdministratorAppClassesApiClassesUsers.cs:line 101rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__8.MoveNext() in E:AdministratorApp 29-11-2021AdministratorAppViewwindowswd_logIn.xaml.cs:line 154', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-11-29T14:27:15.8789054' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (74, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_packageUser.<Btn_add_Click>d__12.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_packageUser.xaml.cs:line 167', N'Void MoveNext()', CAST(N'2021-11-30T13:15:34.9943581' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1071, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__19_0(PosSerials s) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 313rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 328rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__19.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 319rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Cb_SelectionChanged>d__30.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 456', N'Boolean <Search>b__19_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-11-30T15:33:28.6391013' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1072, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)rn   at System.Convert.ToInt32(Object value)rn   at AdministratorApp.View.sales.uc_posSerials.<Search>b__19_0(PosSerials s) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 313rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 328rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__19.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 319rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Cb_SelectionChanged>d__30.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 456', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-11-30T15:44:31.0022973' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1073, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)rn   at System.Convert.ToInt32(Object value)rn   at AdministratorApp.View.sales.uc_posSerials.<Search>b__19_0(PosSerials s) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 313rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 328rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__19.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 319rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Cb_SelectionChanged>d__30.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 456', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-11-30T15:45:30.5643633' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1074, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)rn   at System.Convert.ToInt32(Object value)rn   at AdministratorApp.View.sales.uc_posSerials.<Search>b__19_0(PosSerials s) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 313rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 328rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__19.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 319rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Cb_SelectionChanged>d__30.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 456', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-11-30T15:45:34.0641867' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1075, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__19_0(PosSerials s) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 313rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 328rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__19.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 319rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<UserControl_Loaded>d__10.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 84', N'Boolean <Search>b__19_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-11-30T15:48:56.8446193' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1076, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__19_0(PosSerials s) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 313rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 329rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__19.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 320rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<UserControl_Loaded>d__10.MoveNext() in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 84', N'Boolean <Search>b__19_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-11-30T15:52:02.5777431' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1077, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.Chk_allBranches_Checked(Object sender, RoutedEventArgs e) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 475', N'Void Chk_allBranches_Checked(System.Object, System.Windows.RoutedEventArgs)', CAST(N'2021-11-30T16:24:15.5950108' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1078, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.Chk_allPackages_Checked(Object sender, RoutedEventArgs e) in E:AdministratorApp 30-11-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 473', N'Void Chk_allPackages_Checked(System.Object, System.Windows.RoutedEventArgs)', CAST(N'2021-11-30T16:27:11.0030786' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1079, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__17_0(PosSerials s) in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 215rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 235rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__17.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 226rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Tb_search_TextChanged>d__14.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 153', N'Boolean <Search>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-12-01T13:27:33.9545183' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1080, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__17_0(PosSerials s) in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 216rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 236rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__17.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 227rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<UserControl_Loaded>d__10.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 86', N'Boolean <Search>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-12-01T13:29:58.1121248' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1081, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__17_0(PosSerials s) in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 216rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 236rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__17.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 227rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<UserControl_Loaded>d__10.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 86', N'Boolean <Search>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-12-01T13:30:47.8437322' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1082, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__17_0(PosSerials s) in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 216rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 236rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__17.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 227rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Tb_search_TextChanged>d__14.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 154', N'Boolean <Search>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-12-01T13:31:46.4012969' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1083, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_posSerials.<Search>b__17_0(PosSerials s) in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 216rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.sales.uc_posSerials.RefreshPosSerialsView() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 236rn   at AdministratorApp.View.sales.uc_posSerials.<Search>d__17.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 227rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_posSerials.<Tb_search_TextChanged>d__14.MoveNext() in E:AdministratorApp 1-12-2021AdministratorAppViewsalesuc_posSerials.xaml.cs:line 154', N'Boolean <Search>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2021-12-01T13:32:44.7425615' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1084, N'-2147467262', N'Unable to cast object of type ''System.Windows.Controls.ComboBox'' to type ''System.IConvertible''.', N'   at System.Convert.ToInt32(Object value)rn   at AdministratorApp.View.sectionData.uc_users.<Btn_add_Click>d__12.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 161', N'Int32 ToInt32(System.Object)', CAST(N'2021-12-08T11:55:17.1330707' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1085, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 697', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:03:10.7248718' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1086, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 676', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:03:10.7856606' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1087, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 697', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:06:13.2086803' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1088, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 676', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:06:13.3977452' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1089, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 697', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:06:35.4955149' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1090, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 676', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:06:35.7580032' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1091, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 697', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:07:34.9670372' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1092, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 676', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:07:35.0519618' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1093, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 697', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:07:59.7595900' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1094, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 676', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:07:59.8678983' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1095, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 697', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:08:07.8088637' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1096, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 676', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:08:08.0600379' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1097, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 698', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:16:53.7536713' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1098, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 677', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:16:54.2253025' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1099, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 698', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:19:12.3438350' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1100, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 677', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:19:12.5315133' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1101, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaFax_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 698', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:19:46.6122755' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1102, N'-2146233079', N'Cannot modify the logical children for this node at this time because a tree walk is in progress.', N'   at System.Windows.FrameworkElement.AddLogicalChild(Object child)rn   at System.Windows.Controls.UIElementCollection.AddInternal(UIElement element)rn   at System.Windows.Controls.UIElementCollection.Add(UIElement element)rn   at AdministratorApp.Classes.HelpClass.StartAwait(Grid grid) in E:AdministratorApp 7-12-2021AdministratorAppClassesHelpClass.cs:line 504rn   at AdministratorApp.View.sectionData.uc_users.<Cb_areaPhone_SelectionChanged>d__37.MoveNext() in E:AdministratorApp 7-12-2021AdministratorAppViewsectionDatauc_users.xaml.cs:line 677', N'Void AddLogicalChild(System.Object)', CAST(N'2021-12-08T12:19:46.8157627' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1103, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.APIResult.<getList>d__1.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesAPIResult.cs:line 88rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<Getloginuser>d__123.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesUsers.cs:line 101rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__8.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewwindowswd_logIn.xaml.cs:line 155', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2021-12-08T17:27:51.3046271' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1104, N'-2146233086', N'Index was out of range. Must be non-negative and less than the size of the collection.rnParameter name: index', N'   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)rn   at System.Collections.Generic.List`1.get_Item(Int32 index)rn   at System.Collections.ObjectModel.Collection`1.get_Item(Int32 index)rn   at AdministratorApp.View.windows.wd_countryPackageDate.translate() in E:AdministratorApp 13-12-2021AdministratorAppViewwindowswd_countryPackageDate.xaml.cs:line 100rn   at AdministratorApp.View.windows.wd_countryPackageDate.<Window_Loaded>d__9.MoveNext() in E:AdministratorApp 13-12-2021AdministratorAppViewwindowswd_countryPackageDate.xaml.cs:line 67', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2021-12-13T13:31:54.3701308' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1105, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.City.<Get>d__13.MoveNext() in E:AdministratorApp 14-12-2021AdministratorAppClassesApiClassesCity.cs:line 40rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<RefreshCity>d__25.MoveNext() in E:AdministratorApp 14-12-2021AdministratorAppClassesFillCombo.cs:line 116rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCountriesLocal>d__28.MoveNext() in E:AdministratorApp 14-12-2021AdministratorAppClassesFillCombo.cs:line 140rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_agents.<Cb_areaFax_SelectionChanged>d__39.MoveNext() in E:AdministratorApp 14-12-2021AdministratorAppViewsectionDatauc_agents.xaml.cs:line 729', N'Void MoveNext()', CAST(N'2021-12-14T14:57:14.8510741' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1106, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-22T14:09:59.1072882' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1107, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:44:56.2750403' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1108, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:47:41.1388859' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1109, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:47:47.1488333' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1110, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:52:19.1020877' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1111, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:52:24.9544281' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1112, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:52:29.4573787' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1113, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:52:32.1441883' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1114, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:52:34.7891114' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1115, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<Cb_customer_SelectionChanged>d__31.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 577', N'Void MoveNext()', CAST(N'2021-12-23T10:52:37.3103965' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1116, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.City.<Get>d__13.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppClassesApiClassesCity.cs:line 40rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<RefreshCity>d__30.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppClassesFillCombo.cs:line 152rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCountriesLocal>d__33.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppClassesFillCombo.cs:line 176rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_agents.<Cb_areaPhone_SelectionChanged>d__38.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsectionDatauc_agents.xaml.cs:line 712', N'Void MoveNext()', CAST(N'2021-12-23T13:55:06.5746786' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1117, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Packages.<GetPackagesByAgent>d__98.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppClassesApiClassesPackages.cs:line 242rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillAgentPackage>d__9.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppClassesFillCombo.cs:line 60rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__12.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 96', N'Void MoveNext()', CAST(N'2021-12-23T13:58:47.4791734' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1118, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__16.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 194', N'Void MoveNext()', CAST(N'2021-12-23T14:13:06.9310846' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1119, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__16.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 194', N'Void MoveNext()', CAST(N'2021-12-23T14:13:14.0949140' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1120, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__16.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 194', N'Void MoveNext()', CAST(N'2021-12-23T14:13:17.9944788' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1121, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__16.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 194', N'Void MoveNext()', CAST(N'2021-12-23T14:13:21.7973022' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1122, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__16.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 194', N'Void MoveNext()', CAST(N'2021-12-23T14:13:28.5035473' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1123, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.Classes.FillCombo.<fillPackageByCustomer>d__8.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppClassesFillCombo.cs:line 52rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<Cb_customer_SelectionChanged>d__32.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 488', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-12-23T15:09:50.1685608' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1124, N'-2147467261', N'Value cannot be null.rnParameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)rn   at AdministratorApp.Classes.FillCombo.<fillPackageByCustomer>d__8.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppClassesFillCombo.cs:line 52rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<Cb_customer_SelectionChanged>d__32.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 488', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2021-12-23T15:10:00.5626978' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1125, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in E:AdministratorApp 22-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 515', N'Void MoveNext()', CAST(N'2021-12-23T15:33:48.1546916' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1126, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 515', N'Void MoveNext()', CAST(N'2021-12-23T15:51:52.2025603' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1127, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 515', N'Void MoveNext()', CAST(N'2021-12-23T15:51:54.8171398' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1128, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 515', N'Void MoveNext()', CAST(N'2021-12-23T15:51:56.2499894' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1129, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 516', N'Void MoveNext()', CAST(N'2021-12-23T16:22:56.1288329' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1130, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 516', N'Void MoveNext()', CAST(N'2021-12-23T16:22:59.1017990' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1131, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.Int32.Parse(String s)rn   at AdministratorApp.View.sales.uc_payment.Tb_discount_TextChanged(Object sender, TextChangedEventArgs e) in E:AdministratorApp 25-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 728', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-12-25T13:42:03.3896963' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1132, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Packages.<GetPackagesByAgent>d__98.MoveNext() in E:AdministratorApp 25-12-2021AdministratorAppClassesApiClassesPackages.cs:line 242rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillAgentPackage>d__12.MoveNext() in E:AdministratorApp 25-12-2021AdministratorAppClassesFillCombo.cs:line 80rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<Cb_agent_SelectionChanged>d__25.MoveNext() in E:AdministratorApp 25-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 393', N'Void MoveNext()', CAST(N'2021-12-25T14:49:36.1091750' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1133, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Packages.<GetPackagesByAgent>d__98.MoveNext() in E:AdministratorApp 25-12-2021AdministratorAppClassesApiClassesPackages.cs:line 242rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillAgentPackage>d__12.MoveNext() in E:AdministratorApp 25-12-2021AdministratorAppClassesFillCombo.cs:line 81rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<Cb_agent_SelectionChanged>d__25.MoveNext() in E:AdministratorApp 25-12-2021AdministratorAppViewsalesuc_sale.xaml.cs:line 390', N'Void MoveNext()', CAST(N'2021-12-25T15:49:21.4800252' AS DateTime2), 35)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1134, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)rn   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)rn   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)rn   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)rn   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)rn   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)rn   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)rn   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)rn   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)rn   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)rn   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)rn   at System.Windows.Data.BindingExpression.Activate(Object item)rn   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)rn   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.FrameworkElement.set_DataContext(Object value)rn   at AdministratorApp.View.sales.uc_payment.<Cb_packageNumber_SelectionChanged>d__40.MoveNext() in E:AdministratorApp 26-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 558', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-12-26T14:27:01.3491500' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1135, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)rn   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)rn   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)rn   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)rn   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)rn   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)rn   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)rn   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)rn   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)rn   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)rn   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)rn   at System.Windows.Data.BindingExpression.Activate(Object item)rn   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)rn   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.FrameworkElement.set_DataContext(Object value)rn   at AdministratorApp.View.sales.uc_payment.<Cb_packageNumber_SelectionChanged>d__40.MoveNext() in E:AdministratorApp 26-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 558', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-12-26T14:29:45.3346152' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1136, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)rn   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)rn   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)rn   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)rn   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)rn   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)rn   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)rn   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)rn   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)rn   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)rn   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)rn   at System.Windows.Data.BindingExpression.Activate(Object item)rn   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)rn   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)rn   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)rn   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)rn   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)rn   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.FrameworkElement.set_DataContext(Object value)rn   at AdministratorApp.View.sales.uc_payment.<Cb_packageNumber_SelectionChanged>d__48.MoveNext() in E:AdministratorApp 26-12-2021AdministratorAppViewsalesuc_payment.xaml.cs:line 560', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2021-12-26T14:36:14.7801253' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1137, N'-2146233088', N'Unexpected character encountered while parsing value: S. Path '''', line 0, position 0.', N'   at Newtonsoft.Json.JsonTextReader.ParseValue()rn   at Newtonsoft.Json.JsonTextReader.ReadInternal()rn   at Newtonsoft.Json.JsonTextReader.Read()rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.ReadForType(JsonReader reader, JsonContract contract, Boolean hasConverter)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PosSerials.<GetByPackUserId>d__57.MoveNext() in E:AdministratorApp 26-12-2021AdministratorAppClassesApiClassesPosSerials.cs:line 197rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_seialsList.<Window_Loaded>d__7.MoveNext() in E:AdministratorApp 26-12-2021AdministratorAppViewwindowswd_seialsList.xaml.cs:line 57', N'Boolean ParseValue()', CAST(N'2021-12-26T15:19:56.5529302' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1138, N'-2146233088', N'An error occurred during local report processing.', N'   at Microsoft.Reporting.WinForms.LocalReport.SetParameters(IEnumerable`1 parameters)rn   at AdministratorApp.View.windows.wd_seialsList.BuildReport() in D:myprojposproject3AdministratorAppAdministratorAppViewwindowswd_seialsList.xaml.cs:line 294rn   at AdministratorApp.View.windows.wd_seialsList.Btn_pdf_Click(Object sender, RoutedEventArgs e) in D:myprojposproject3AdministratorAppAdministratorAppViewwindowswd_seialsList.xaml.cs:line 305', N'Void SetParameters(System.Collections.Generic.IEnumerable`1[Microsoft.Reporting.WinForms.ReportParameter])', CAST(N'2021-12-30T18:53:43.9515880' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1139, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Users.<GetByID>d__125.MoveNext() in D:VSprojectAdministratorAppAdministratorAppClassesApiClassesUsers.cs:line 137rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__14.MoveNext() in D:VSprojectAdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 104', N'Void MoveNext()', CAST(N'2022-01-02T17:59:16.9707119' AS DateTime2), 34)
GO
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1140, N'-2146233088', N'Unexpected character encountered while parsing value: S. Path '''', line 0, position 0.', N'   at Newtonsoft.Json.JsonTextReader.ParseValue()rn   at Newtonsoft.Json.JsonTextReader.ReadInternal()rn   at Newtonsoft.Json.JsonTextReader.Read()rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.ReadForType(JsonReader reader, JsonContract contract, Boolean hasConverter)rn   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)rn   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonConverter[] converters)rn   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonConverter[] converters)rn   at AdministratorApp.ApiClasses.PosSerials.<GetSerialAndPosInfo>d__74.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPosSerials.cs:line 227rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_seialsList.<RefreshList>d__23.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewwindowswd_seialsList.xaml.cs:line 247rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_seialsList.<Window_Loaded>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewwindowswd_seialsList.xaml.cs:line 75', N'Boolean ParseValue()', CAST(N'2022-01-03T11:35:50.0294164' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1141, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.Int32.Parse(String s)rn   at AdministratorApp.View.applications.uc_packages.<Btn_add_Click>d__12.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewapplicationsuc_packages.xaml.cs:line 162', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2022-01-03T16:15:25.4398138' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1142, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<RefreshPayOpList>d__38.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 545rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_payment.<Btn_refresh_Click>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 223', N'Void MoveNext()', CAST(N'2022-01-03T16:38:57.4001510' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1143, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<RefreshPayOpList>d__38.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 545rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_payment.<Btn_refresh_Click>d__20.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 223', N'Void MoveNext()', CAST(N'2022-01-03T16:38:59.6069141' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1144, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Customers.<GetAll>d__85.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesCustomers.cs:line 62rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCustomer>d__26.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 148rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_payment.<UserControl_Loaded>d__14.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 92', N'Void MoveNext()', CAST(N'2022-01-03T17:07:24.1904374' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1145, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_payment.<RefreshPayOpList>d__38.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 545rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_payment.<Cb_packageNumber_SelectionChanged>d__41.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 618', N'Void MoveNext()', CAST(N'2022-01-03T17:31:44.0865909' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1146, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-04T16:34:15.0477568' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1147, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-04T17:14:18.9109747' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1148, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Users.<GetByID>d__125.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesApiClassesUsers.cs:line 137rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__14.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 116', N'Void MoveNext()', CAST(N'2022-01-06T12:00:54.9403932' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1149, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Customers.<GetAll>d__85.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesApiClassesCustomers.cs:line 62rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCustomer>d__26.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesFillCombo.cs:line 148rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__14.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 103', N'Void MoveNext()', CAST(N'2022-01-06T12:10:26.7316299' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1150, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Packages.<GetByCustomerCountry>d__100.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesApiClassesPackages.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillPackageByCustomer>d__10.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesFillCombo.cs:line 55rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<Cb_customer_SelectionChanged>d__32.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 467', N'Void MoveNext()', CAST(N'2022-01-06T12:12:16.9893488' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1151, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 495', N'Void MoveNext()', CAST(N'2022-01-06T12:24:04.2648423' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1152, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_period_SelectionChanged>d__34.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 495', N'Void MoveNext()', CAST(N'2022-01-06T12:24:08.1653830' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1153, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-06T14:22:25.8968600' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1154, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Users.<GetByID>d__125.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesApiClassesUsers.cs:line 137rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__14.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 116', N'Void MoveNext()', CAST(N'2022-01-06T14:24:57.5368119' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1155, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-06T15:06:55.8375376' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1156, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Packages.<GetByCustomerCountry>d__100.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesApiClassesPackages.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillPackageByCustomer>d__10.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesFillCombo.cs:line 55rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<Cb_customer_SelectionChanged>d__32.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 467', N'Void MoveNext()', CAST(N'2022-01-06T15:06:56.3672653' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1157, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Customers.<GetAll>d__85.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesApiClassesCustomers.cs:line 62rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCustomer>d__26.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppClassesFillCombo.cs:line 148rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__14.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 103', N'Void MoveNext()', CAST(N'2022-01-06T15:25:02.3443533' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1158, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-06T15:42:46.7335564' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1159, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-06T15:43:48.2489054' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1160, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Users.<GetByID>d__125.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesUsers.cs:line 137rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__14.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 104', N'Void MoveNext()', CAST(N'2022-01-06T15:43:48.5365849' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1161, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-06T15:45:19.6536856' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1162, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Packages.<GetByCustomerCountry>d__100.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesApiClassesPackages.cs:line 288rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillPackageByCustomer>d__10.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppClassesFillCombo.cs:line 55rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<Cb_customer_SelectionChanged>d__32.MoveNext() in D:myprojposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 466', N'Void MoveNext()', CAST(N'2022-01-06T15:45:20.0316364' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1163, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 6-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 181', N'Void MoveNext()', CAST(N'2022-01-06T15:48:04.5159913' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1164, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.BuildReport() in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 717rn   at AdministratorApp.View.sales.uc_sale.Btn_pdf_Click(Object sender, RoutedEventArgs e) in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewsalesuc_sale.xaml.cs:line 576', N'Void BuildReport()', CAST(N'2022-01-06T16:06:01.2853435' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1165, N'-2146233088', N'An error occurred while sending the request.', N'   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.APIResult.<getList>d__1.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppClassesApiClassesAPIResult.cs:line 88rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.Users.<Getloginuser>d__123.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppClassesApiClassesUsers.cs:line 101rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_logIn.<btnLogIn_Click>d__8.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewwindowswd_logIn.xaml.cs:line 155', N'Void ThrowForNonSuccess(System.Threading.Tasks.Task)', CAST(N'2022-01-11T13:32:09.3199238' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1166, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:37:04.6277968' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1167, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:38:15.0681001' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1168, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:43:20.2966901' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1169, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:43:57.4443310' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1170, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:44:33.7801408' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1171, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:44:53.5093708' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1172, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:47:42.6748988' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1173, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T13:50:28.8414433' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1174, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T14:08:04.9520658' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1175, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T14:08:47.5302110' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1176, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T14:09:37.0307789' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1177, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.<Cb_package_SelectionChanged>d__18.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 183', N'Void MoveNext()', CAST(N'2022-01-11T14:10:52.6455268' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1178, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-11T15:44:19.1261486' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1179, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-11T15:46:16.9707443' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1180, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-11T16:04:48.2525766' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1181, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Users.<GetByID>d__125.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppClassesApiClassesUsers.cs:line 137rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.sales.uc_sale.<UserControl_Loaded>d__15.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 117', N'Void MoveNext()', CAST(N'2022-01-11T16:04:48.7592209' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1182, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 11-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-11T16:10:56.1814612' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1183, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Programs.<GetAll>d__45.MoveNext() in E:AdministratorApp 12-1-2022AdministratorAppClassesApiClassesPrograms.cs:line 45rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<RefreshProgramsList>d__23.MoveNext() in E:AdministratorApp 12-1-2022AdministratorAppViewapplicationsus_programs.xaml.cs:line 422rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<UserControl_Loaded>d__10.MoveNext() in E:AdministratorApp 12-1-2022AdministratorAppViewapplicationsus_programs.xaml.cs:line 78', N'Void MoveNext()', CAST(N'2022-01-12T11:16:08.7866559' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1184, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-12T11:24:06.5800233' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1185, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-12T11:42:43.8601025' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1186, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T11:53:07.7431722' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1187, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T11:53:39.7695420' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1188, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T11:55:44.3014204' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1189, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T11:56:16.6070116' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1190, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-12T12:25:53.0508771' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1191, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T12:33:34.9123967' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1192, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T12:34:34.7343870' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1193, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T12:41:46.2357444' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1194, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T12:42:14.8950861' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1195, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.sales.uc_sale.Cb_isOnline_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 520rn   at System.Windows.Controls.SelectionChangedEventArgs.InvokeEventHandler(Delegate genericHandler, Object genericTarget)rn   at System.Windows.RoutedEventArgs.InvokeHandler(Delegate handler, Object target)rn   at System.Windows.RoutedEventHandlerInfo.InvokeHandler(Object target, RoutedEventArgs routedEventArgs)rn   at System.Windows.EventRoute.InvokeHandlersImpl(Object source, RoutedEventArgs args, Boolean reRaised)rn   at System.Windows.UIElement.RaiseEventImpl(DependencyObject sender, RoutedEventArgs args)rn   at System.Windows.UIElement.RaiseEvent(RoutedEventArgs e)rn   at System.Windows.Controls.ComboBox.OnSelectionChanged(SelectionChangedEventArgs e)rn   at System.Windows.Controls.Primitives.Selector.InvokeSelectionChanged(List`1 unselectedInfos, List`1 selectedInfos)rn   at System.Windows.Controls.Primitives.Selector.SelectionChanger.End()rn   at System.Windows.Controls.Primitives.Selector.SelectionChanger.SelectJustThisItem(ItemInfo info, Boolean assumeInItemsCollection)rn   at System.Windows.Controls.Primitives.Selector.OnSelectedIndexChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.DependencyObject.SetValue(DependencyProperty dp, Object value)rn   at System.Windows.Controls.Primitives.Selector.set_SelectedIndex(Int32 value)rn   at AdministratorApp.View.sales.uc_sale.Clear() in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 260rn   at AdministratorApp.View.sales.uc_sale.Btn_clear_Click(Object sender, RoutedEventArgs e) in E:AdministratorApp 12-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 231', N'Void Cb_isOnline_SelectionChanged(System.Object, System.Windows.Controls.SelectionChangedEventArgs)', CAST(N'2022-01-12T12:46:00.3500536' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1196, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:GitHubposproject3AdministratorAppAdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-12T16:14:29.7995756' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1197, N'-2146233086', N'Specified argument was out of the range of valid values.rnParameter name: Index is out of collection''s boundary.', N'   at System.Windows.Controls.ColumnDefinitionCollection.RemoveAt(Int32 index)rn   at AdministratorApp.View.windows.wd_offlineActivation.Cb_type_SelectionChanged(Object sender, SelectionChangedEventArgs e) in E:GitHubposproject3AdministratorAppAdministratorAppViewwindowswd_offlineActivation.xaml.cs:line 134', N'Void RemoveAt(Int32)', CAST(N'2022-01-12T16:14:41.5571007' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1198, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 13-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-13T11:48:28.8978448' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2165, N'-2146233079', N'Nullable object must have a value.', N'   at System.ThrowHelper.ThrowInvalidOperationException(ExceptionResource resource)rn   at System.Nullable`1.get_Value()rn   at AdministratorApp.View.sales.uc_payment.<Btn_upgrade_Click>d__42.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppViewsalesuc_payment.xaml.cs:line 652', N'Void ThrowInvalidOperationException(System.ExceptionResource)', CAST(N'2022-01-15T14:07:47.8516877' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2166, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.City.<Get>d__13.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesApiClassesCity.cs:line 40rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<RefreshCity>d__34.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesFillCombo.cs:line 181rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCountriesLocal>d__37.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesFillCombo.cs:line 205rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_customers.<Cb_areaPhone_SelectionChanged>d__33.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppViewsectionDatauc_customers.xaml.cs:line 607', N'Void MoveNext()', CAST(N'2022-01-15T14:51:44.8029366' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2167, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.City.<Get>d__13.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesApiClassesCity.cs:line 40rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<RefreshCity>d__34.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesFillCombo.cs:line 181rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCountriesLocal>d__37.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesFillCombo.cs:line 205rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_customers.<Cb_areaFax_SelectionChanged>d__34.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppViewsectionDatauc_customers.xaml.cs:line 628', N'Void MoveNext()', CAST(N'2022-01-15T14:55:20.1682988' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2168, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.City.<Get>d__13.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesApiClassesCity.cs:line 40rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<RefreshCity>d__34.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesFillCombo.cs:line 181rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.Classes.FillCombo.<fillCountriesLocal>d__37.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppClassesFillCombo.cs:line 205rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()rn   at AdministratorApp.View.sectionData.uc_customers.<Cb_areaPhone_SelectionChanged>d__33.MoveNext() in E:AdministratorApp 15-1-2022AdministratorAppViewsectionDatauc_customers.xaml.cs:line 607', N'Void MoveNext()', CAST(N'2022-01-15T14:57:59.9053458' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2169, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.ApiClasses.Programs.<GetAll>d__45.MoveNext() in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppClassesApiClassesPrograms.cs:line 45rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<RefreshProgramsList>d__23.MoveNext() in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewapplicationsus_programs.xaml.cs:line 422rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.applications.uc_programs.<UserControl_Loaded>d__10.MoveNext() in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewapplicationsus_programs.xaml.cs:line 78', N'Void MoveNext()', CAST(N'2022-01-17T18:19:42.3880403' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2170, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.reports.uc_paymentsReport.BuildReport() in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewreportsuc_paymentsReport.xaml.cs:line 562rn   at AdministratorApp.View.reports.uc_paymentsReport.Btn_preview_Click(Object sender, RoutedEventArgs e) in C:UsersHPDocumentsGitHubposproject3AdministratorAppAdministratorAppViewreportsuc_paymentsReport.xaml.cs:line 669', N'Void BuildReport()', CAST(N'2022-01-18T14:56:35.3663992' AS DateTime2), 1)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2171, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.windows.wd_seialsList.<Tb_search_TextChanged>b__17_0(PosSerials s) in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 162rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.windows.wd_seialsList.RefreshView() in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 298rn   at AdministratorApp.View.windows.wd_seialsList.Tb_search_TextChanged(Object sender, TextChangedEventArgs e) in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 166', N'Boolean <Tb_search_TextChanged>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2022-01-19T10:52:25.9863668' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2172, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.windows.wd_seialsList.<Tb_search_TextChanged>b__17_0(PosSerials s) in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 162rn   at System.Linq.Enumerable.<>c__DisplayClass6_0`1.<CombinePredicates>b__0(TSource x)rn   at System.Linq.Enumerable.<>c__DisplayClass6_0`1.<CombinePredicates>b__0(TSource x)rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.windows.wd_seialsList.RefreshView() in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 298rn   at AdministratorApp.View.windows.wd_seialsList.Tb_search_TextChanged(Object sender, TextChangedEventArgs e) in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 166', N'Boolean <Tb_search_TextChanged>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2022-01-19T10:52:33.4144797' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2173, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at AdministratorApp.View.windows.wd_seialsList.<Tb_search_TextChanged>b__17_0(PosSerials s) in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 162rn   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()rn   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)rn   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)rn   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)rn   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)rn   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)rn   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)rn   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)rn   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)rn   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)rn   at AdministratorApp.View.windows.wd_seialsList.RefreshView() in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 298rn   at AdministratorApp.View.windows.wd_seialsList.Tb_search_TextChanged(Object sender, TextChangedEventArgs e) in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 166', N'Boolean <Tb_search_TextChanged>b__17_0(AdministratorApp.ApiClasses.PosSerials)', CAST(N'2022-01-19T10:59:19.7743428' AS DateTime2), 34)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2174, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)rn   at System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)rn   at System.Int32.Parse(String s)rn   at AdministratorApp.ApiClasses.APIResult.<post>d__3.MoveNext() in E:AdministratorApp 19-1-2022AdministratorAppClassesApiClassesAPIResult.cs:line 220rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.ApiClasses.PosSerials.<UpdateList>d__75.MoveNext() in E:AdministratorApp 19-1-2022AdministratorAppClassesApiClassesPosSerials.cs:line 245rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)rn   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()rn   at AdministratorApp.View.windows.wd_seialsList.<Btn_save_Click>d__16.MoveNext() in E:AdministratorApp 19-1-2022AdministratorAppViewwindowswd_seialsList.xaml.cs:line 127rn--- End of stack trace from previous location where exception was thrown ---rn   at System.Runtime.CompilerServices.AsyncMethodBuilderCore.<>c.<ThrowAsync>b__6_0(Object state)rn   at System.Windows.Threading.ExceptionWrapper.InternalRealCall(Delegate callback, Object args, Int32 numArgs)rn   at System.Windows.Threading.ExceptionWrapper.TryCatchWhen(Object source, Delegate callback, Object args, Int32 numArgs, Delegate catchHandler)rn   at System.Windows.Threading.DispatcherOperation.InvokeImpl()rn   at System.Windows.Threading.DispatcherOperation.InvokeInSecurityContext(Object state)rn   at MS.Internal.CulturePreservingExecutionContext.CallbackWrapper(Object obj)rn   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)rn   at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)rn   at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state)rn   at MS.Internal.CulturePreservingExecutionContext.Run(CulturePreservingExecutionContext executionContext, ContextCallback callback, Object state)rn   at System.Windows.Threading.DispatcherOperation.Invoke()rn   at System.Windows.Threading.Dispatcher.ProcessQueue()rn   at System.Windows.Threading.Dispatcher.WndProcHook(IntPtr hwnd, Int32 msg, IntPtr wParam, IntPtr lParam, Boolean& handled)rn   at MS.Win32.HwndWrapper.WndProc(IntPtr hwnd, Int32 msg, IntPtr wParam, IntPtr lParam, Boolean& handled)rn   at MS.Win32.HwndSubclass.DispatcherCallbackOperation(Object o)rn   at System.Windows.Threading.ExceptionWrapper.InternalRealCall(Delegate callback, Object args, Int32 numArgs)rn   at System.Windows.Threading.ExceptionWrapper.TryCatchWhen(Object source, Delegate callback, Object args, Int32 numArgs, Delegate catchHandler)rn   at System.Windows.Threading.Dispatcher.LegacyInvokeImpl(DispatcherPriority priority, TimeSpan timeout, Delegate method, Object args, Int32 numArgs)rn   at MS.Win32.HwndSubclass.SubclassWndProc(IntPtr hwnd, Int32 msg, IntPtr wParam, IntPtr lParam)rn   at MS.Win32.UnsafeNativeMethods.DispatchMessage(MSG& msg)rn   at System.Windows.Threading.Dispatcher.PushFrameImpl(DispatcherFrame frame)rn   at System.Windows.Threading.Dispatcher.PushFrame(DispatcherFrame frame)rn   at System.Windows.Window.ShowHelper(Object booleanBox)rn   at System.Windows.Window.Show()rn   at System.Windows.Window.ShowDialog()rn   at AdministratorApp.View.sales.uc_sale.Btn_serials_Click(Object sender, RoutedEventArgs e) in E:AdministratorApp 19-1-2022AdministratorAppViewsalesuc_sale.xaml.cs:line 457', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2022-01-19T12:44:48.9484992' AS DateTime2), 34)
SET IDENTITY_INSERT [dbo].[error] OFF
GO
SET IDENTITY_INSERT [dbo].[programs] ON 

INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes]) VALUES (20, N'pos', N'pos 1', 1, CAST(N'2021-11-07T13:30:25.4896110' AS DateTime2), CAST(N'2021-11-07T13:30:25.4896110' AS DateTime2), N'pos-1', 1, 1, N'')
INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes]) VALUES (21, N'Pos Program', N'', 1, CAST(N'2021-12-14T17:30:02.0852153' AS DateTime2), CAST(N'2021-12-14T17:30:02.0852153' AS DateTime2), N'pos-2', 34, 34, N'')
SET IDENTITY_INSERT [dbo].[programs] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (1, N'administrator', N'administrator', N'Support', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2022-01-19T18:41:48.1210422' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ad', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'Us-Admin', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (2, N'admin', N'admin', N'admin', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2022-01-16T13:52:45.6823866' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ad', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'Us-adminuser', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (3, N'sysagent', N'sysagent', N'sysagent', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2021-12-08T12:25:13.5504988' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ag', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'aaa', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (34, N'yasmine', N'yasmine', N'alnajjar', NULL, N'', N'+965-30-6555569', N'+965-095550226', N'+965-25-9888', N'address', NULL, CAST(N'2021-11-24T15:41:57.3497612' AS DateTime2), CAST(N'2022-01-19T14:30:38.1532446' AS DateTime2), N'405740e31b69ded2e074d48776e85f4d', N'us', N'9a8205e9af7a1e0e14f8d0d47f4e39ac.jpg', N'note', CAST(0.000 AS Decimal(20, 3)), 1, 34, 1, N'Us-000001', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (35, N'agent1', N'agent1', N'agent1', NULL, N'', NULL, N'+965-7539510', NULL, N'', N'Normal', CAST(N'2021-12-23T11:41:01.5549247' AS DateTime2), CAST(N'2022-01-15T14:46:40.4909127' AS DateTime2), N'1891621361928cd4141eaa26adab1a68', N'ag', N'4687de130c1aa5e13df98f78b8100f6a.png', N'', CAST(0.000 AS Decimal(20, 3)), 34, 34, 1, N'wvm', NULL, NULL, NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[countriesCodes] ADD  CONSTRAINT [DF_countriesCodes_isDefault]  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[countryPackageDate] ADD  CONSTRAINT [DF_countryPackageDate_monthCount]  DEFAULT ((0)) FOR [monthCount]
GO
ALTER TABLE [dbo].[countryPackageDate] ADD  CONSTRAINT [DF_countryPackageDate_yearCount]  DEFAULT ((0)) FOR [yearCount]
GO
ALTER TABLE [dbo].[countryPackageDate] ADD  CONSTRAINT [DF_countryPackageDate_islimitDate]  DEFAULT ((0)) FOR [islimitDate]
GO
ALTER TABLE [dbo].[countryPackageDate] ADD  CONSTRAINT [DF_countryPackageDate_agentPrice]  DEFAULT ((0)) FOR [agentPrice]
GO
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [DF_customers_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [DF_customers_balanceType]  DEFAULT ((0)) FOR [balanceType]
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
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_isBooked]  DEFAULT ((0)) FOR [isBooked]
GO
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_canRenew]  DEFAULT ((0)) FOR [canRenew]
GO
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_oldPackageId]  DEFAULT ((0)) FOR [oldPackageId]
GO
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_isPayed]  DEFAULT ((0)) FOR [isPayed]
GO
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_salesInvCount]  DEFAULT ((0)) FOR [salesInvCount]
GO
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_monthCount]  DEFAULT ((0)) FOR [monthCount]
GO
ALTER TABLE [dbo].[packageUser] ADD  CONSTRAINT [DF_packageUser_isServerActivated]  DEFAULT ((0)) FOR [isServerActivated]
GO
ALTER TABLE [dbo].[posInfo] ADD  CONSTRAINT [DF_posInfo_isBooked]  DEFAULT ((0)) FOR [isBooked]
GO
ALTER TABLE [dbo].[posSerials] ADD  CONSTRAINT [DF_posSerials_isBooked]  DEFAULT ((0)) FOR [isBooked]
GO
ALTER TABLE [dbo].[posSerials] ADD  CONSTRAINT [DF_posSerials_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[posSerials] ADD  CONSTRAINT [DF_posSerials_unLimited]  DEFAULT ((0)) FOR [unLimited]
GO
ALTER TABLE [dbo].[programs] ADD  CONSTRAINT [DF_programs_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[versions] ADD  CONSTRAINT [DF_versions_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[agentCustomer]  WITH CHECK ADD  CONSTRAINT [FK_agentCustomer_customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[customers] ([custId])
GO
ALTER TABLE [dbo].[agentCustomer] CHECK CONSTRAINT [FK_agentCustomer_customers]
GO
ALTER TABLE [dbo].[agentCustomer]  WITH CHECK ADD  CONSTRAINT [FK_agentCustomer_users] FOREIGN KEY([agentId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[agentCustomer] CHECK CONSTRAINT [FK_agentCustomer_users]
GO
ALTER TABLE [dbo].[agentCustomer]  WITH CHECK ADD  CONSTRAINT [FK_agentCustomer_users1] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[agentCustomer] CHECK CONSTRAINT [FK_agentCustomer_users1]
GO
ALTER TABLE [dbo].[agentCustomer]  WITH CHECK ADD  CONSTRAINT [FK_agentCustomer_users2] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[agentCustomer] CHECK CONSTRAINT [FK_agentCustomer_users2]
GO
ALTER TABLE [dbo].[agentPackage]  WITH CHECK ADD  CONSTRAINT [FK_agentPackage_packages] FOREIGN KEY([packageId])
REFERENCES [dbo].[packages] ([packageId])
GO
ALTER TABLE [dbo].[agentPackage] CHECK CONSTRAINT [FK_agentPackage_packages]
GO
ALTER TABLE [dbo].[agentPackage]  WITH CHECK ADD  CONSTRAINT [FK_agentPackage_users] FOREIGN KEY([agentId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[agentPackage] CHECK CONSTRAINT [FK_agentPackage_users]
GO
ALTER TABLE [dbo].[agentPackage]  WITH CHECK ADD  CONSTRAINT [FK_agentPackage_users1] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[agentPackage] CHECK CONSTRAINT [FK_agentPackage_users1]
GO
ALTER TABLE [dbo].[agentPackage]  WITH CHECK ADD  CONSTRAINT [FK_agentPackage_users2] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[agentPackage] CHECK CONSTRAINT [FK_agentPackage_users2]
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_cities_countriesCodes]
GO
ALTER TABLE [dbo].[countryPackageDate]  WITH CHECK ADD  CONSTRAINT [FK_countryPackageDate_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[countryPackageDate] CHECK CONSTRAINT [FK_countryPackageDate_countriesCodes]
GO
ALTER TABLE [dbo].[countryPackageDate]  WITH CHECK ADD  CONSTRAINT [FK_countryPackageDate_packages] FOREIGN KEY([packageId])
REFERENCES [dbo].[packages] ([packageId])
GO
ALTER TABLE [dbo].[countryPackageDate] CHECK CONSTRAINT [FK_countryPackageDate_packages]
GO
ALTER TABLE [dbo].[countryPackageDate]  WITH CHECK ADD  CONSTRAINT [FK_countryPackageDate_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[countryPackageDate] CHECK CONSTRAINT [FK_countryPackageDate_users]
GO
ALTER TABLE [dbo].[countryPackageDate]  WITH CHECK ADD  CONSTRAINT [FK_countryPackageDate_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[countryPackageDate] CHECK CONSTRAINT [FK_countryPackageDate_users1]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_countriesCodes]
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
ALTER TABLE [dbo].[packageUser]  WITH CHECK ADD  CONSTRAINT [FK_packageUser_countryPackageDate] FOREIGN KEY([countryPackageId])
REFERENCES [dbo].[countryPackageDate] ([Id])
GO
ALTER TABLE [dbo].[packageUser] CHECK CONSTRAINT [FK_packageUser_countryPackageDate]
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
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_countryPackageDate] FOREIGN KEY([countryPackageId])
REFERENCES [dbo].[countryPackageDate] ([Id])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_countryPackageDate]
GO
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[customers] ([custId])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_customers]
GO
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_packages] FOREIGN KEY([packageId])
REFERENCES [dbo].[packages] ([packageId])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_packages]
GO
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_packageUser] FOREIGN KEY([packageUserId])
REFERENCES [dbo].[packageUser] ([packageUserId])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_packageUser]
GO
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_users]
GO
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_users1]
GO
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_users2] FOREIGN KEY([agentId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_users2]
GO
ALTER TABLE [dbo].[posInfo]  WITH CHECK ADD  CONSTRAINT [FK_posInfo_posSerials] FOREIGN KEY([serialId])
REFERENCES [dbo].[posSerials] ([serialId])
GO
ALTER TABLE [dbo].[posInfo] CHECK CONSTRAINT [FK_posInfo_posSerials]
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
ALTER TABLE [dbo].[puStatus]  WITH CHECK ADD  CONSTRAINT [FK_puStatus_packageUser] FOREIGN KEY([packageUserId])
REFERENCES [dbo].[packageUser] ([packageUserId])
GO
ALTER TABLE [dbo].[puStatus] CHECK CONSTRAINT [FK_puStatus_packageUser]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_countriesCodes]
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
