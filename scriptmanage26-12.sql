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
ALTER TABLE [dbo].[payOp] DROP CONSTRAINT [FK_payOp_packageUser]
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
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [DF_countryPackageDate_islimitDate]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [DF_countryPackageDate_yearCount]
GO
ALTER TABLE [dbo].[countryPackageDate] DROP CONSTRAINT [DF_countryPackageDate_monthCount]
GO
ALTER TABLE [dbo].[countriesCodes] DROP CONSTRAINT [DF_countriesCodes_isDefault]
GO
/****** Object:  Table [dbo].[versions]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[versions]') AND type in (N'U'))
DROP TABLE [dbo].[versions]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[puStatus]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[puStatus]') AND type in (N'U'))
DROP TABLE [dbo].[puStatus]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[programs]') AND type in (N'U'))
DROP TABLE [dbo].[programs]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posSerials]') AND type in (N'U'))
DROP TABLE [dbo].[posSerials]
GO
/****** Object:  Table [dbo].[payOp]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payOp]') AND type in (N'U'))
DROP TABLE [dbo].[payOp]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packageUser]') AND type in (N'U'))
DROP TABLE [dbo].[packageUser]
GO
/****** Object:  Table [dbo].[packages]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packages]') AND type in (N'U'))
DROP TABLE [dbo].[packages]
GO
/****** Object:  Table [dbo].[objects]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objects]') AND type in (N'U'))
DROP TABLE [dbo].[objects]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
DROP TABLE [dbo].[groups]
GO
/****** Object:  Table [dbo].[groupObject]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groupObject]') AND type in (N'U'))
DROP TABLE [dbo].[groupObject]
GO
/****** Object:  Table [dbo].[error]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[error]') AND type in (N'U'))
DROP TABLE [dbo].[error]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
DROP TABLE [dbo].[customers]
GO
/****** Object:  Table [dbo].[countryPackageDate]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countryPackageDate]') AND type in (N'U'))
DROP TABLE [dbo].[countryPackageDate]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesCodes]') AND type in (N'U'))
DROP TABLE [dbo].[countriesCodes]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cities]') AND type in (N'U'))
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[agentPackage]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agentPackage]') AND type in (N'U'))
DROP TABLE [dbo].[agentPackage]
GO
/****** Object:  Table [dbo].[agentCustomer]    Script Date: 2021-12-26 7:38:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agentCustomer]') AND type in (N'U'))
DROP TABLE [dbo].[agentCustomer]
GO
/****** Object:  Table [dbo].[agentCustomer]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[agentPackage]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[cities]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[countryPackageDate]    Script Date: 2021-12-26 7:38:51 PM ******/
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
 CONSTRAINT [PK_countryPackageDate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[error]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[groupObject]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[groups]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[objects]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[packages]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[packageUser]    Script Date: 2021-12-26 7:38:51 PM ******/
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
 CONSTRAINT [PK_spesAgent] PRIMARY KEY CLUSTERED 
(
	[packageUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payOp]    Script Date: 2021-12-26 7:38:51 PM ******/
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
 CONSTRAINT [PK_payOp] PRIMARY KEY CLUSTERED 
(
	[payOpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[programs]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[puStatus]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 2021-12-26 7:38:51 PM ******/
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
/****** Object:  Table [dbo].[versions]    Script Date: 2021-12-26 7:38:51 PM ******/
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
SET IDENTITY_INSERT [dbo].[agentCustomer] ON 

INSERT [dbo].[agentCustomer] ([agentCustomerId], [agentId], [customerId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (4, 35, 8, NULL, 34, NULL, CAST(N'2021-12-26T13:48:00.4285817' AS DateTime2), CAST(N'2021-12-26T13:48:00.4285817' AS DateTime2))
INSERT [dbo].[agentCustomer] ([agentCustomerId], [agentId], [customerId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (5, 3, 11, NULL, 34, NULL, CAST(N'2021-12-26T14:40:49.9062111' AS DateTime2), CAST(N'2021-12-26T14:40:49.9062111' AS DateTime2))
INSERT [dbo].[agentCustomer] ([agentCustomerId], [agentId], [customerId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (6, 3, 9, NULL, 34, NULL, CAST(N'2021-12-26T14:40:49.9072089' AS DateTime2), CAST(N'2021-12-26T14:40:49.9072089' AS DateTime2))
SET IDENTITY_INSERT [dbo].[agentCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[agentPackage] ON 

INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (1, 3, 32, NULL, 34, NULL, CAST(N'2021-12-23T11:09:05.5559366' AS DateTime2), CAST(N'2021-12-23T11:09:05.5559366' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (2, 3, 36, NULL, 34, NULL, CAST(N'2021-12-23T11:09:05.5599254' AS DateTime2), CAST(N'2021-12-23T11:09:05.5599254' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (3, 3, 37, NULL, 34, NULL, CAST(N'2021-12-23T11:09:05.5599254' AS DateTime2), CAST(N'2021-12-23T11:09:05.5599254' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (13, 35, 36, NULL, 34, NULL, CAST(N'2021-12-26T13:47:55.1333525' AS DateTime2), CAST(N'2021-12-26T13:47:55.1333525' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (14, 35, 34, NULL, 34, NULL, CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2), CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (15, 35, 32, NULL, 34, NULL, CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2), CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (16, 35, 33, NULL, 34, NULL, CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2), CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (17, 35, 35, NULL, 34, NULL, CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2), CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2))
INSERT [dbo].[agentPackage] ([agentPackageId], [agentId], [packageId], [notes], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (18, 35, 37, NULL, 34, NULL, CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2), CAST(N'2021-12-26T13:47:55.1343498' AS DateTime2))
SET IDENTITY_INSERT [dbo].[agentPackage] OFF
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
SET IDENTITY_INSERT [dbo].[countryPackageDate] ON 

INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (35, 1, 32, 12, 0, CAST(12000.000 AS Decimal(20, 3)), N'', 34, 34, CAST(N'2021-12-26T13:43:01.5684256' AS DateTime2), CAST(N'2021-12-26T13:43:01.5684256' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (36, 2, 32, 0, 0, CAST(15000.000 AS Decimal(20, 3)), N'', 34, 34, CAST(N'2021-12-26T13:43:19.4339401' AS DateTime2), CAST(N'2021-12-26T13:43:19.4339401' AS DateTime2), 0, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (37, 3, 32, 6, 0, CAST(14000.000 AS Decimal(20, 3)), N'', 34, 34, CAST(N'2021-12-26T13:43:34.6577071' AS DateTime2), CAST(N'2021-12-26T13:43:46.1735150' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (38, 1, 33, 6, 0, CAST(15000.000 AS Decimal(20, 3)), N'', 34, 34, CAST(N'2021-12-26T13:46:02.7335838' AS DateTime2), CAST(N'2021-12-26T13:46:02.7335838' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (39, 1, 33, 0, 0, CAST(20000.000 AS Decimal(20, 3)), N'', 34, 34, CAST(N'2021-12-26T13:46:19.7379246' AS DateTime2), CAST(N'2021-12-26T13:46:19.7379246' AS DateTime2), 0, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (40, 5, 33, 1, 0, CAST(10000.000 AS Decimal(20, 3)), N'', 34, 34, CAST(N'2021-12-26T13:46:37.7314053' AS DateTime2), CAST(N'2021-12-26T13:46:37.7314053' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (41, 1, 37, 1, 0, CAST(100.000 AS Decimal(20, 3)), N'', 2, 2, CAST(N'2021-12-26T16:10:14.2439775' AS DateTime2), CAST(N'2021-12-26T16:10:14.2439775' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (42, 1, 37, 3, 0, CAST(300.000 AS Decimal(20, 3)), N'', 2, 2, CAST(N'2021-12-26T16:10:20.7132006' AS DateTime2), CAST(N'2021-12-26T16:10:20.7132006' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (43, 1, 37, 6, 0, CAST(600.000 AS Decimal(20, 3)), N'', 2, 2, CAST(N'2021-12-26T16:10:27.7436860' AS DateTime2), CAST(N'2021-12-26T16:10:27.7436860' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (44, 1, 37, 12, 0, CAST(1200.000 AS Decimal(20, 3)), N'', 2, 2, CAST(N'2021-12-26T16:10:35.6360177' AS DateTime2), CAST(N'2021-12-26T16:10:35.6360177' AS DateTime2), 1, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (45, 1, 37, 0, 0, CAST(1500.000 AS Decimal(20, 3)), N'', 2, 2, CAST(N'2021-12-26T16:10:45.2253215' AS DateTime2), CAST(N'2021-12-26T16:10:45.2253215' AS DateTime2), 0, 1)
INSERT [dbo].[countryPackageDate] ([Id], [countryId], [packageId], [monthCount], [yearCount], [price], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [islimitDate], [isActive]) VALUES (46, 2, 37, 3, 0, CAST(300.000 AS Decimal(20, 3)), N'', 2, 2, CAST(N'2021-12-26T16:10:53.8281219' AS DateTime2), CAST(N'2021-12-26T16:10:53.8281219' AS DateTime2), 1, 1)
SET IDENTITY_INSERT [dbo].[countryPackageDate] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [balanceType], [createUserId], [updateUserId], [isActive], [countryId]) VALUES (7, N'Mahmoud', N'hamed     ', N'mahmoud   ', N'', NULL, N'+966-295959596', NULL, N'', N'Normal', CAST(N'2021-11-07T13:33:30.0809329' AS DateTime2), CAST(N'2021-12-23T15:14:18.3891664' AS DateTime2), N'Us-000001', N'3204215c19f25609034d24451f7e03d7.jfif', N'', CAST(0.000 AS Decimal(20, 3)), 0, 1, 34, 1, 2)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [balanceType], [createUserId], [updateUserId], [isActive], [countryId]) VALUES (8, N'customer2', N'customer2 ', N'company2  ', N'customer1@gmail.com', N'+212-7-888258', N'+249-963852741', N'+249-21-654526', N'address2', N'Normal', CAST(N'2021-11-27T15:40:59.0026645' AS DateTime2), CAST(N'2021-11-27T15:45:54.4624566' AS DateTime2), N'C-000001', NULL, N'notes2', CAST(0.000 AS Decimal(20, 3)), 0, 34, 34, 1, 1)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [balanceType], [createUserId], [updateUserId], [isActive], [countryId]) VALUES (9, N'customer3', N'customer3 ', N'company3  ', N'customer3@gmail.com', N'+965--888258', N'+965-963852741', N'+965-21-654526', N'address3', N'Normal', CAST(N'2021-11-27T15:50:49.4203937' AS DateTime2), CAST(N'2021-12-08T12:51:47.9715297' AS DateTime2), N'CU-000001', NULL, N'notes3', CAST(0.000 AS Decimal(20, 3)), 0, 34, 34, 1, 1)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [balanceType], [createUserId], [updateUserId], [isActive], [countryId]) VALUES (10, N'customer4', N'customer4 ', N'          ', N'', NULL, N'+961-951753654', NULL, N'', N'Vip', CAST(N'2021-12-08T12:51:32.0046578' AS DateTime2), CAST(N'2021-12-08T12:51:32.0046578' AS DateTime2), N'CU-000002', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 0, 34, 34, 1, 8)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [company], [email], [phone], [mobile], [fax], [address], [custlevel], [createDate], [updateDate], [custCode], [image], [notes], [balance], [balanceType], [createUserId], [updateUserId], [isActive], [countryId]) VALUES (11, N'cust1', N'lmmm      ', N'sscom     ', N'', NULL, N'+965-956565656', NULL, N'', NULL, CAST(N'2021-12-19T14:26:16.0497748' AS DateTime2), CAST(N'2021-12-19T14:26:16.0497748' AS DateTime2), N'CU-000003', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 0, 2, 2, 1, 1)
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
SET IDENTITY_INSERT [dbo].[error] OFF
GO
SET IDENTITY_INSERT [dbo].[packages] ON 

INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [createUserId], [updateUserId], [notes]) VALUES (32, N'POS-small-v1', N'', 5, 2, 5, 2, 10, 3, 3, 20, 19, 1, CAST(N'2021-11-07T17:56:59.2659233' AS DateTime2), CAST(N'2021-11-07T17:56:59.2659233' AS DateTime2), N'pos-small-v1', 5, 1, 1, N'')
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [createUserId], [updateUserId], [notes]) VALUES (33, N'pos-v1', N'', 50, 50, 150, 150, 200, 200, 500, 20, 19, 1, CAST(N'2021-11-07T17:58:09.9456503' AS DateTime2), CAST(N'2021-11-18T11:49:58.3480492' AS DateTime2), N'pk-0000009', 50, 1, 1, N'')
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [createUserId], [updateUserId], [notes]) VALUES (34, N'posv120', N'', 120, 20, 220, 500, 500, 2000, 1000, 20, 19, 1, CAST(N'2021-11-18T16:57:02.3237035' AS DateTime2), CAST(N'2021-11-18T16:57:02.3237035' AS DateTime2), N'pos-20', 115, 1, 1, N'')
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [createUserId], [updateUserId], [notes]) VALUES (35, N'POS', N'', 5, 10, 50, 20, 50, 10000, 10000, 20, 19, 1, CAST(N'2021-11-21T17:07:58.3725437' AS DateTime2), CAST(N'2021-11-21T17:07:58.3725437' AS DateTime2), N'package100', 2, 1, 1, N'')
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [createUserId], [updateUserId], [notes]) VALUES (36, N'pos10', N'', 100, 200, 200, 500, 500, 1000, 1000, 20, 19, 1, CAST(N'2021-11-28T17:45:41.6094197' AS DateTime2), CAST(N'2021-11-28T17:45:41.6094197' AS DateTime2), N'pos10', 100, 34, 34, N'')
INSERT [dbo].[packages] ([packageId], [packageName], [details], [branchCount], [posCount], [userCount], [vendorCount], [customerCount], [itemCount], [salesInvCount], [programId], [verId], [isActive], [createDate], [updateDate], [packageCode], [storeCount], [createUserId], [updateUserId], [notes]) VALUES (37, N'POS V2 package', N'', 50, 100, 100, 100, 100, 500, 500, 21, 20, 1, CAST(N'2021-12-14T17:35:41.2758399' AS DateTime2), CAST(N'2021-12-14T17:35:41.2758399' AS DateTime2), N'pos-v2', 50, 34, 34, N'')
SET IDENTITY_INSERT [dbo].[packages] OFF
GO
SET IDENTITY_INSERT [dbo].[packageUser] ON 

INSERT [dbo].[packageUser] ([packageUserId], [packageId], [userId], [packageSaleCode], [packageNumber], [customerId], [customerServerCode], [isBooked], [notes], [createDate], [updateDate], [createUserId], [updateUserId], [bookDate], [isActive], [expireDate], [isOnlineServer], [countryPackageId], [canRenew], [oldPackageId], [type], [isPayed], [salesInvCount], [monthCount], [totalsalesInvCount], [activatedate], [isServerActivated], [oldCountryPackageId]) VALUES (9, 33, 3, N'pGXg4sSFYYZD7Y2t', N'si-aaa-000001', 8, N'', 1, N'', CAST(N'2021-12-26T13:50:56.0588460' AS DateTime2), CAST(N'2021-12-26T14:09:17.1499360' AS DateTime2), 34, 34, CAST(N'2021-12-26T13:50:56.0588460' AS DateTime2), 1, NULL, NULL, 39, 1, 33, N'rn', 1, 1500, 0, 1500, NULL, 0, 39)
INSERT [dbo].[packageUser] ([packageUserId], [packageId], [userId], [packageSaleCode], [packageNumber], [customerId], [customerServerCode], [isBooked], [notes], [createDate], [updateDate], [createUserId], [updateUserId], [bookDate], [isActive], [expireDate], [isOnlineServer], [countryPackageId], [canRenew], [oldPackageId], [type], [isPayed], [salesInvCount], [monthCount], [totalsalesInvCount], [activatedate], [isServerActivated], [oldCountryPackageId]) VALUES (10, 33, 3, N'w3SQkJVi1tn3WAAu', N'si-aaa-000002', 9, N'', 1, N'', CAST(N'2021-12-26T14:41:13.5164659' AS DateTime2), CAST(N'2021-12-26T14:41:37.2146602' AS DateTime2), 34, 34, CAST(N'2021-12-26T14:41:13.5164659' AS DateTime2), 1, CAST(N'2022-06-26T14:41:13.5164659' AS DateTime2), NULL, 38, 1, 33, N'np', 1, 500, 0, 500, NULL, 0, 38)
INSERT [dbo].[packageUser] ([packageUserId], [packageId], [userId], [packageSaleCode], [packageNumber], [customerId], [customerServerCode], [isBooked], [notes], [createDate], [updateDate], [createUserId], [updateUserId], [bookDate], [isActive], [expireDate], [isOnlineServer], [countryPackageId], [canRenew], [oldPackageId], [type], [isPayed], [salesInvCount], [monthCount], [totalsalesInvCount], [activatedate], [isServerActivated], [oldCountryPackageId]) VALUES (11, 32, 3, N'yl7LaPYGVaNgwBMl', N'si-aaa-000003', 8, N'', 1, N'', CAST(N'2021-12-26T16:11:13.7255274' AS DateTime2), CAST(N'2021-12-26T16:34:35.6149879' AS DateTime2), 2, 2, CAST(N'2021-12-26T16:18:20.8713641' AS DateTime2), 1, CAST(N'2023-12-26T16:18:20.8713641' AS DateTime2), NULL, 35, 1, 32, N'rn', 1, 6, 0, 1506, NULL, 0, 35)
SET IDENTITY_INSERT [dbo].[packageUser] OFF
GO
SET IDENTITY_INSERT [dbo].[payOp] ON 

INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (20, CAST(20000.000 AS Decimal(20, 3)), N'', N'np', 9, 34, 34, CAST(N'2021-12-26T13:51:23.8527796' AS DateTime2), CAST(N'2021-12-26T13:51:23.8527796' AS DateTime2), N'', CAST(2500.000 AS Decimal(20, 3)), 3, 8, 39, CAST(17500.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (21, CAST(20000.000 AS Decimal(20, 3)), N'po-000001', N'np', 9, 34, 34, CAST(N'2021-12-26T14:08:56.2772630' AS DateTime2), CAST(N'2021-12-26T14:08:56.2772630' AS DateTime2), N'', CAST(0.000 AS Decimal(20, 3)), 3, 8, 39, CAST(20000.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (22, CAST(20000.000 AS Decimal(20, 3)), N'po-000002', N'rn', 9, 34, 34, CAST(N'2021-12-26T14:09:17.1418282' AS DateTime2), CAST(N'2021-12-26T14:09:17.1418282' AS DateTime2), N'', CAST(1500.000 AS Decimal(20, 3)), 3, 8, 39, CAST(18500.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (23, CAST(15000.000 AS Decimal(20, 3)), N'po-000003', N'np', 10, 34, 34, CAST(N'2021-12-26T14:41:37.2006982' AS DateTime2), CAST(N'2021-12-26T14:41:37.2006982' AS DateTime2), N'', CAST(1500.000 AS Decimal(20, 3)), 3, 9, 38, CAST(13500.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (24, CAST(100.000 AS Decimal(20, 3)), N'po-000004', N'np', 11, 2, 2, CAST(N'2021-12-26T16:12:04.5656841' AS DateTime2), CAST(N'2021-12-26T16:12:04.5656841' AS DateTime2), N'', CAST(0.000 AS Decimal(20, 3)), 3, 8, 41, CAST(100.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (25, CAST(100.000 AS Decimal(20, 3)), N'po-000005', N'np', 11, 2, 2, CAST(N'2021-12-26T16:12:50.2623157' AS DateTime2), CAST(N'2021-12-26T16:12:50.2623157' AS DateTime2), N'', CAST(0.000 AS Decimal(20, 3)), 3, 8, 41, CAST(100.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (26, CAST(300.000 AS Decimal(20, 3)), N'po-000006', N'chpr', 11, 2, 2, CAST(N'2021-12-26T16:15:51.5123497' AS DateTime2), CAST(N'2021-12-26T16:15:51.5123497' AS DateTime2), N'', CAST(0.000 AS Decimal(20, 3)), 3, 8, 42, CAST(300.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (27, CAST(12000.000 AS Decimal(20, 3)), N'po-000007', N'chpk', 11, 2, 2, CAST(N'2021-12-26T16:32:53.1226675' AS DateTime2), CAST(N'2021-12-26T16:32:53.1226675' AS DateTime2), N'', CAST(0.000 AS Decimal(20, 3)), 3, 8, 35, CAST(12000.000 AS Decimal(20, 3)))
INSERT [dbo].[payOp] ([payOpId], [Price], [code], [type], [packageUserId], [createUserId], [updateUserId], [createDate], [updateDate], [notes], [discountValue], [agentId], [customerId], [countryPackageId], [totalnet]) VALUES (28, CAST(12000.000 AS Decimal(20, 3)), N'po-000008', N'chpk', 11, 2, 2, CAST(N'2021-12-26T16:34:35.6100001' AS DateTime2), CAST(N'2021-12-26T16:34:35.6100001' AS DateTime2), N'', CAST(0.000 AS Decimal(20, 3)), 3, 8, 35, CAST(12000.000 AS Decimal(20, 3)))
SET IDENTITY_INSERT [dbo].[payOp] OFF
GO
SET IDENTITY_INSERT [dbo].[posSerials] ON 

INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (869, N'Je3zC1F79HH6P2u3', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.1045084' AS DateTime2), CAST(N'2021-12-26T13:50:56.1045084' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (870, N'zQcqqGZ0kdYFLI1Y', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.1719401' AS DateTime2), CAST(N'2021-12-26T13:50:56.1719401' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (871, N'ZmP0PhytD71V2aph', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.1796817' AS DateTime2), CAST(N'2021-12-26T13:50:56.1796817' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (872, N'wkEsSfMrwlaYcNpC', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.1865054' AS DateTime2), CAST(N'2021-12-26T13:50:56.1865054' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (873, N'MHmSirFBPAQgDkDB', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.1912823' AS DateTime2), CAST(N'2021-12-26T13:50:56.1912823' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (874, N'QAMSErOn9jak2NTa', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.1963035' AS DateTime2), CAST(N'2021-12-26T13:50:56.1963035' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (875, N'fFluvoyZnHZZrTgW', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2017882' AS DateTime2), CAST(N'2021-12-26T13:50:56.2017882' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (876, N'gNqbaTrmVkrtWzBH', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2074165' AS DateTime2), CAST(N'2021-12-26T13:50:56.2074165' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (877, N'DIFuciJIPyUQssFh', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2132149' AS DateTime2), CAST(N'2021-12-26T13:50:56.2132149' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (878, N'vNCT0hwN2RpeZeB3', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2188227' AS DateTime2), CAST(N'2021-12-26T13:50:56.2188227' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (879, N'SCRYkP0ank0eLLDa', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2245462' AS DateTime2), CAST(N'2021-12-26T13:50:56.2245462' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (880, N'IZCT7ZNBbiFLoQcG', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2307255' AS DateTime2), CAST(N'2021-12-26T13:50:56.2307255' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (881, N'clI47QnkLS1Podm2', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2363324' AS DateTime2), CAST(N'2021-12-26T13:50:56.2363324' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (882, N'CZLy3atsyaSekUTS', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2425382' AS DateTime2), CAST(N'2021-12-26T13:50:56.2425382' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (883, N'OGYhoEGU2DFJWukI', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2482104' AS DateTime2), CAST(N'2021-12-26T13:50:56.2482104' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (884, N'pYGo0SwYe9dJilS1', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2530248' AS DateTime2), CAST(N'2021-12-26T13:50:56.2530248' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (885, N'WiCTI64AQnQtbJxH', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2580899' AS DateTime2), CAST(N'2021-12-26T13:50:56.2580899' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (886, N'xh4zTNrUAZAxVAit', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2629613' AS DateTime2), CAST(N'2021-12-26T13:50:56.2629613' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (887, N'GFphNwytixjGZV1x', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2678482' AS DateTime2), CAST(N'2021-12-26T13:50:56.2678482' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (888, N'hX7ay1cNLWjD0n4C', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2729320' AS DateTime2), CAST(N'2021-12-26T13:50:56.2729320' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (889, N'XyL2SNjrwl93U4Vb', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2781931' AS DateTime2), CAST(N'2021-12-26T13:50:56.2781931' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (890, N'WXaFiMfV0AdvqWAj', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2831022' AS DateTime2), CAST(N'2021-12-26T13:50:56.2831022' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (891, N'IqrJbTfImgg97I6O', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2872492' AS DateTime2), CAST(N'2021-12-26T13:50:56.2872492' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (892, N'Gnn7OBhYIookCIHz', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2942349' AS DateTime2), CAST(N'2021-12-26T13:50:56.2942349' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (893, N'HdixbiGvQdDOrnee', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.2991235' AS DateTime2), CAST(N'2021-12-26T13:50:56.2991235' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (894, N'VQ4yraJ2sdY9PK9g', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3039410' AS DateTime2), CAST(N'2021-12-26T13:50:56.3039410' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (895, N'XX4TWEYuQDjSZrIu', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3088773' AS DateTime2), CAST(N'2021-12-26T13:50:56.3088773' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (896, N'ZSYx9aq7EexJiioA', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3137119' AS DateTime2), CAST(N'2021-12-26T13:50:56.3137119' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (897, N'Qi4q64g7oHQpm1uC', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3188368' AS DateTime2), CAST(N'2021-12-26T13:50:56.3188368' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (898, N'xEmk4NM3cF79jWTN', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3236758' AS DateTime2), CAST(N'2021-12-26T13:50:56.3236758' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (899, N'946lhnCvdCQKISg4', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3285335' AS DateTime2), CAST(N'2021-12-26T13:50:56.3285335' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (900, N'nNTp7zaPVsOc46EC', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3336818' AS DateTime2), CAST(N'2021-12-26T13:50:56.3336818' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (901, N'zlygYdik6UFdRhmA', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3388650' AS DateTime2), CAST(N'2021-12-26T13:50:56.3388650' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (902, N'jDRvPtYzuSsk1yIS', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3436944' AS DateTime2), CAST(N'2021-12-26T13:50:56.3436944' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (903, N'E7SYrVIUyELsA1sb', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3485435' AS DateTime2), CAST(N'2021-12-26T13:50:56.3485435' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (904, N'FwtjDOn0Gl04m9uy', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3536479' AS DateTime2), CAST(N'2021-12-26T13:50:56.3536479' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (905, N'rbxPDZbLekHqCMzf', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3585350' AS DateTime2), CAST(N'2021-12-26T13:50:56.3585350' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (906, N'zMHHZyAmTZDOQCmW', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3634346' AS DateTime2), CAST(N'2021-12-26T13:50:56.3634346' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (907, N'bn1zAlDHRlHuMqfn', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3684059' AS DateTime2), CAST(N'2021-12-26T13:50:56.3684059' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (908, N'2VP9DOtGJrXpEpGb', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3733596' AS DateTime2), CAST(N'2021-12-26T13:50:56.3733596' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (909, N'ZDoAbBkkgRFrKuSB', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3783732' AS DateTime2), CAST(N'2021-12-26T13:50:56.3783732' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (910, N'LWs9FIhuNQuiQbSI', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3833452' AS DateTime2), CAST(N'2021-12-26T13:50:56.3833452' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (911, N'd46yoorWtnwX2ZVx', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3882216' AS DateTime2), CAST(N'2021-12-26T13:50:56.3882216' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (912, N'iDdBeObKwotLfAyV', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3930884' AS DateTime2), CAST(N'2021-12-26T13:50:56.3930884' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (913, N'nPTOVHuvqQQ60DMH', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.3981100' AS DateTime2), CAST(N'2021-12-26T13:50:56.3981100' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (914, N'tgSv2IFFh0FtNECq', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.4042437' AS DateTime2), CAST(N'2021-12-26T13:50:56.4042437' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (915, N'ivBYSq0zpOAI1SSN', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.4090824' AS DateTime2), CAST(N'2021-12-26T13:50:56.4090824' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (916, N'FQnxUBu4wiOBjxC3', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.4141191' AS DateTime2), CAST(N'2021-12-26T13:50:56.4141191' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (917, N'aIcZ4BA423QFLanM', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.4190086' AS DateTime2), CAST(N'2021-12-26T13:50:56.4190086' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (918, N'yeQMbjllYhuiuNvR', NULL, 9, 0, 0, CAST(N'2021-12-26T13:50:56.4241394' AS DateTime2), CAST(N'2021-12-26T13:50:56.4241394' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (919, N'jt3uLJisgVof4CtZ', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.5513738' AS DateTime2), CAST(N'2021-12-26T14:41:13.5513738' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (920, N'l41kDy6mAFmjLlta', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.5843079' AS DateTime2), CAST(N'2021-12-26T14:41:13.5843079' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (921, N'eoZYSzrY7K1CRaou', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.5931130' AS DateTime2), CAST(N'2021-12-26T14:41:13.5931130' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (922, N'b0uZhG0FfOpeEugD', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.5985781' AS DateTime2), CAST(N'2021-12-26T14:41:13.5985781' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (923, N'E3AQjCdd0u3N2lwY', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6031790' AS DateTime2), CAST(N'2021-12-26T14:41:13.6031790' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (924, N'4KGjDyGHZCt6fHEF', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6081789' AS DateTime2), CAST(N'2021-12-26T14:41:13.6081789' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (925, N'fFMyiccjCkMY01nr', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6134762' AS DateTime2), CAST(N'2021-12-26T14:41:13.6134762' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (926, N'bT6VGQzhupvtWgJO', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6184379' AS DateTime2), CAST(N'2021-12-26T14:41:13.6184379' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (927, N'F1AS3mBARQdS7uiT', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6234238' AS DateTime2), CAST(N'2021-12-26T14:41:13.6234238' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (928, N'MUgiRMaaShosFPXi', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6279633' AS DateTime2), CAST(N'2021-12-26T14:41:13.6279633' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (929, N'ani4UT4uNrL9Ldve', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6319127' AS DateTime2), CAST(N'2021-12-26T14:41:13.6319127' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (930, N'MYMzlLbKBNQQn2jn', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6373877' AS DateTime2), CAST(N'2021-12-26T14:41:13.6373877' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (931, N'EVYmHWPx4Tw4m6e3', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6413306' AS DateTime2), CAST(N'2021-12-26T14:41:13.6413306' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (932, N'dmO9wg9o1W0iRIDw', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6465838' AS DateTime2), CAST(N'2021-12-26T14:41:13.6465838' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (933, N'VgNFMwqNMYoDWP2t', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6515739' AS DateTime2), CAST(N'2021-12-26T14:41:13.6515739' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (934, N'rqKHXczoETYxgJCB', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6558933' AS DateTime2), CAST(N'2021-12-26T14:41:13.6558933' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (935, N'awRllMLjAANLubx6', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6604544' AS DateTime2), CAST(N'2021-12-26T14:41:13.6604544' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (936, N'SMQGXZIDihA6kaag', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6654447' AS DateTime2), CAST(N'2021-12-26T14:41:13.6654447' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (937, N'UJF6dwTvBuiET199', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6721533' AS DateTime2), CAST(N'2021-12-26T14:41:13.6721533' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (938, N'Qh0Hy1iec3oocrz7', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6767631' AS DateTime2), CAST(N'2021-12-26T14:41:13.6767631' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (939, N'4Nm34fjj7xFoVrQk', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6821054' AS DateTime2), CAST(N'2021-12-26T14:41:13.6821054' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (940, N'EKDNE6IMteqLgLnw', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6865896' AS DateTime2), CAST(N'2021-12-26T14:41:13.6865896' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (941, N'zEhaIeEidNcWZCpB', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6910510' AS DateTime2), CAST(N'2021-12-26T14:41:13.6910510' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (942, N'ySuAfoUwq1GuiAWp', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.6970384' AS DateTime2), CAST(N'2021-12-26T14:41:13.6970384' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (943, N'R3eYa7UidsWr0MbC', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7040225' AS DateTime2), CAST(N'2021-12-26T14:41:13.7040225' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (944, N'9WNyxvSzYHXefQFH', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7110008' AS DateTime2), CAST(N'2021-12-26T14:41:13.7110008' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (945, N'K6YJzhe2whbG7ipD', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7169847' AS DateTime2), CAST(N'2021-12-26T14:41:13.7169847' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (946, N'VEwNJ1sDTUBRdPZQ', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7219705' AS DateTime2), CAST(N'2021-12-26T14:41:13.7219705' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (947, N'WjYJbxileQCsR2Z2', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7269588' AS DateTime2), CAST(N'2021-12-26T14:41:13.7269588' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (948, N'eu92Eg7xcZgq2aYi', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7329435' AS DateTime2), CAST(N'2021-12-26T14:41:13.7329435' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (949, N'Ok2omvu4SzjAUQLX', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7389518' AS DateTime2), CAST(N'2021-12-26T14:41:13.7389518' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (950, N'g4t4zB2g6G7xdnZa', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7538884' AS DateTime2), CAST(N'2021-12-26T14:41:13.7538884' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (951, N'sWEk2pcNgdyCDdqE', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7608677' AS DateTime2), CAST(N'2021-12-26T14:41:13.7608677' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (952, N'm4PcZhDIsnVXmkpp', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7658547' AS DateTime2), CAST(N'2021-12-26T14:41:13.7658547' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (953, N'FGKVRXsxnq9CF7pR', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7708405' AS DateTime2), CAST(N'2021-12-26T14:41:13.7708405' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (954, N'aB93jPPl6LPfDyJh', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7768241' AS DateTime2), CAST(N'2021-12-26T14:41:13.7768241' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (955, N'xS1T0Bm9d7PPg03J', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7828092' AS DateTime2), CAST(N'2021-12-26T14:41:13.7828092' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (956, N'Hc9uH9yHsJWbVYvS', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7887926' AS DateTime2), CAST(N'2021-12-26T14:41:13.7887926' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (957, N'1k4BMBgtV1kgHdJP', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7937812' AS DateTime2), CAST(N'2021-12-26T14:41:13.7937812' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (958, N'qAj2gwCTHrAUG4tW', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.7987661' AS DateTime2), CAST(N'2021-12-26T14:41:13.7987661' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (959, N'iH4qRliLAbU0AAZQ', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8027554' AS DateTime2), CAST(N'2021-12-26T14:41:13.8027554' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (960, N'ExU6RALg2vym6YqU', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8087426' AS DateTime2), CAST(N'2021-12-26T14:41:13.8087426' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (961, N'CYhxFsWhmH1eAMtb', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8147233' AS DateTime2), CAST(N'2021-12-26T14:41:13.8147233' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (962, N'D0K6kbuVYWdIlnGs', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8207065' AS DateTime2), CAST(N'2021-12-26T14:41:13.8207065' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (963, N'vOMQiyxi9E9OJOgT', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8276887' AS DateTime2), CAST(N'2021-12-26T14:41:13.8276887' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (964, N'DoEVOiVZBi7K4f0A', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8316776' AS DateTime2), CAST(N'2021-12-26T14:41:13.8316776' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (965, N'X7RKGBTgVumImNOO', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8366824' AS DateTime2), CAST(N'2021-12-26T14:41:13.8366824' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (966, N'ymsgGZPYqsqbHy7x', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8406543' AS DateTime2), CAST(N'2021-12-26T14:41:13.8406543' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (967, N'tVFnbmnktrvppiwC', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8456400' AS DateTime2), CAST(N'2021-12-26T14:41:13.8456400' AS DateTime2), 34, 34, NULL, 0)
GO
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (968, N'AwInP33z7DoPUVYT', NULL, 10, 0, 0, CAST(N'2021-12-26T14:41:13.8506275' AS DateTime2), CAST(N'2021-12-26T14:41:13.8506275' AS DateTime2), 34, 34, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (969, N'riU13aN9GqLeoqn7', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.7823759' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (970, N'IFOAPTnvKEYUJRWB', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.8711406' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (971, N'0hNt3GMZuHoYGamV', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.8791189' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (972, N'zBv6wb1HTUqYsMMu', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.8841061' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (973, N'CKVhKlKICho6jmBv', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.8900883' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (974, N'V4DYeYIWNofN203e', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.8950769' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (975, N'Q1AGHmz3YL36GCFR', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9000617' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (976, N'DBAyUdauKjHy6ETt', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9060471' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (977, N'cOqU9Jj6aA2xxZDt', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9140246' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (978, N'c3KP016UCv1W4hGu', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9220046' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (979, N'ZO9EsCf7Qq6TPHTl', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9271137' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (980, N'zIM3KcLqmN6jPtyc', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9324904' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (981, N'w0lGCUBPhdNJ4T6L', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9386449' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (982, N'dukj26qRS6z6KsaP', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9436317' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (983, N'DCugzcqHaPUTIfKX', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9489667' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (984, N'TkC3NoipUrIEaLZ9', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9559486' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (985, N'GSjOqSB36Y7SjFWE', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9610244' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (986, N'J7bYEZmO2cVAJBBS', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9661494' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (987, N'FonpbcoPeKTbB7pJ', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9717849' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (988, N'DzwN7naMHIUAeOcI', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9772357' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (989, N'l3BE2Z3LGCd9DsSg', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9822263' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (990, N'uGdUdCwnnJ1iawKb', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9867776' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (991, N'qiv0OCI6FCFGPBDf', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9926467' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (992, N'WoI4DkstxhbvZjoH', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:13.9976375' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (993, N'xHRqOc4JOyAHB0hC', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0023545' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (994, N'FOk3vVEqitcYsNq7', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0081119' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (995, N'I1vPpf3h6Ch060Nm', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0131021' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (996, N'RTcMKGwrABMjl0Ct', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0176960' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (997, N'eatduBfxpJsrfg4H', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0236043' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (998, N'NEEyXNskG03XMQpD', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0287234' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (999, N'N4h6wEkefPH0nfQL', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0339137' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1000, N'HVPwFZG0niO3K1Me', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0398437' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1001, N'd7B7IBaC7htlgcEU', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0450986' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1002, N'BXaxCqHg03VM7z7A', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0500886' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1003, N'pME9C7tswFFgVNoc', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0566380' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1004, N'3k7rwGruEp3KTNGZ', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0626220' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1005, N'LDQK9hIrsptl7oSh', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0673452' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1006, N'IVVL240a0SjhAgu7', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0724927' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1007, N'COI0EDYZNeQBBD3M', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0782016' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1008, N'ytCFKoaAs7BRVC01', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0831299' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1009, N'bDIaxU3JtjzYKQSL', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0882873' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1010, N'JO4UtakMYyNyIzZi', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0937401' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1011, N'F6JUDekopFvAIUmG', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.0986720' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1012, N'aU2kwKqkU1gtSOwJ', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1036667' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1013, N'oD3BJEpA1pUnkeHG', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1096519' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1014, N'zq4X6TMZKJaY3YPC', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1143704' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1015, N'yKC6PcAogJGxuQ99', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1193597' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1016, N'6wc9bnfgpXErBxu1', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1254711' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1017, N'WBvXs1jONCghdfj3', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1305996' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1018, N'M7axwxeNQqk2aWkX', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1355437' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1019, N'CowVjcEhSWHKhheE', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1415271' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1020, N'SYjFW0CYL1wthhZR', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1463971' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1021, N'mMs6Lo9Mtz4N1RSj', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1513866' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1022, N'Dd0hmMFkyz67vyxG', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1573709' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1023, N'odfByjN9BcwqUNzj', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1628580' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1024, N'0DOJ2fY3ptxsJSxa', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1688400' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1025, N'2ZQXLlfXdDG9kOqj', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1768185' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1026, N'd6m1W10mkl6GP1g6', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1818061' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1027, N'AnyNdMtHib4xX1Id', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1877900' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1028, N'BhdmBaeSdUYT4uxf', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1937737' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1029, N'Gxc4Hz6zRPpRufrN', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.1987122' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1030, N'6TXmfOJAajoGNwCL', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2036983' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1031, N'3jb9Ej3rxvVJJuJo', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2097626' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1032, N'bONLtMEiKyVRtOHh', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2147556' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1033, N'ZFwhmzfU71r1D6mY', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2204021' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1034, N'KwWpX0SptcgJIXW2', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2263551' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1035, N'zjCvmzWrO6cnSvty', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2315571' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1036, N'3h6xWY3ITC42DswY', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2365143' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1037, N'9sVB06h7CkwFczde', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2425240' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1038, N'dwg22U6pRZUUFXzw', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2475936' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1039, N'SbRGd1nFbtFYWw1X', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2525223' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1040, N'csaHiXMilj7e4li2', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2585094' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1041, N'zEjqMlWJDEBfO7AP', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2638802' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1042, N'dcyIUwyUKNGE1qPi', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2688011' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1043, N'TDdYKmGurUvbTBbg', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2747895' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1044, N'E62akWeb6SXAvJdH', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2807723' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1045, N'nQ4PFJfJqJDTaEEX', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2862290' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1046, N'pVfn64REkAjc32Cm', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2919625' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1047, N'o9uD0ORNksEvk3VY', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.2972881' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1048, N'K2O63jfkMO4Hvdhm', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3023406' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1049, N'gqQeUgEpLL6VkXCI', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3084075' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1050, N'9fJ61BpagE0qFKzJ', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3134126' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1051, N'D60VtaiFSRePhLm0', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3182868' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1052, N'2IoflfExtPuJEYgO', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3244137' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1053, N'x43vvD1cZr0io4S6', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3293567' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1054, N'O1P2lxWBOZBV2YHB', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3342558' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1055, N'9ifNR49sJBeuuWFH', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3402485' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1056, N'10wyHBuJlN4lqAGH', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3452542' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1057, N'l3sD7b6KczJCeDTM', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3501817' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1058, N'VIFcrZZ1Egb7Z1fE', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3561715' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1059, N'UschacJhjoxGPdao', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3614529' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1060, N'ZGexI47sXNlfidJX', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3662869' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1061, N'kh0aBWhhLYlHOAH6', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3713766' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1062, N'EsXHwmVAnAdHtNff', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3770002' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1063, N'zsm2CIcbThyV6wv2', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3819456' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1064, N'QtNiHIlds6DKErXY', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3891346' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1065, N'wMENZD4FicWJgpCT', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3947316' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1066, N'Gc1ZQexyHJYnHU4I', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.3997080' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1067, N'xHpJi3XY2Fa7SONh', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.4066909' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
GO
INSERT [dbo].[posSerials] ([serialId], [serial], [posDeviceCode], [packageUserId], [isBooked], [isActive], [createDate], [updateDate], [createUserId], [updateUserId], [notes], [unLimited]) VALUES (1068, N'3cKfgWFPZvBpWhYE', NULL, 11, 0, 0, CAST(N'2021-12-26T16:11:14.4116991' AS DateTime2), CAST(N'2021-12-26T16:15:51.5223188' AS DateTime2), 2, 2, NULL, 0)
SET IDENTITY_INSERT [dbo].[posSerials] OFF
GO
SET IDENTITY_INSERT [dbo].[programs] ON 

INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes]) VALUES (20, N'pos', N'pos 1', 1, CAST(N'2021-11-07T13:30:25.4896110' AS DateTime2), CAST(N'2021-11-07T13:30:25.4896110' AS DateTime2), N'pos-1', 1, 1, N'')
INSERT [dbo].[programs] ([programId], [name], [details], [isActive], [createDate], [updateDate], [programCode], [createUserId], [updateUserId], [notes]) VALUES (21, N'Pos Program', N'', 1, CAST(N'2021-12-14T17:30:02.0852153' AS DateTime2), CAST(N'2021-12-14T17:30:02.0852153' AS DateTime2), N'pos-2', 34, 34, N'')
SET IDENTITY_INSERT [dbo].[programs] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (1, N'administrator', N'administrator', N'Support', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2021-12-08T12:25:13.5504988' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ad', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'Us-Admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (2, N'admin', N'admin', N'admin', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2021-12-26T16:09:23.5010068' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ad', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'Us-adminuser', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (3, N'sysagent', N'sysagent', N'sysagent', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2021-12-08T12:25:13.5504988' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ag', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'aaa', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (34, N'yasmine', N'yasmine', N'alnajjar', NULL, N'', N'+965-30-6555569', N'+965-095550226', N'+965-25-9888', N'address', NULL, CAST(N'2021-11-24T15:41:57.3497612' AS DateTime2), CAST(N'2021-12-26T15:47:13.6867515' AS DateTime2), N'405740e31b69ded2e074d48776e85f4d', N'us', N'9a8205e9af7a1e0e14f8d0d47f4e39ac.jpg', N'note', CAST(0.000 AS Decimal(20, 3)), 1, 34, 1, N'Us-000001', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (35, N'agent1', N'agent1', N'agent1', NULL, N'', NULL, N'+965-7539510', NULL, N'', N'Normal', CAST(N'2021-12-23T11:41:01.5549247' AS DateTime2), CAST(N'2021-12-25T16:22:19.9480984' AS DateTime2), N'1891621361928cd4141eaa26adab1a68', N'ag', N'4687de130c1aa5e13df98f78b8100f6a.png', N'', CAST(0.000 AS Decimal(20, 3)), 34, 34, 1, N'wvm', NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[versions] ON 

INSERT [dbo].[versions] ([verId], [name], [details], [isActive], [versionscode], [createDate], [updateDate], [createUserId], [updateUserId], [programId], [notes]) VALUES (19, N'ver1', N'pos test', 1, N'V-001', CAST(N'2021-11-07T13:30:50.6594286' AS DateTime2), CAST(N'2021-11-07T13:30:50.6594286' AS DateTime2), 1, 1, 20, N'')
INSERT [dbo].[versions] ([verId], [name], [details], [isActive], [versionscode], [createDate], [updateDate], [createUserId], [updateUserId], [programId], [notes]) VALUES (20, N'Ver 2', N'', 1, N'V-001', CAST(N'2021-12-14T17:30:28.7808049' AS DateTime2), CAST(N'2021-12-14T17:30:28.7808049' AS DateTime2), 34, 34, 21, N'')
INSERT [dbo].[versions] ([verId], [name], [details], [isActive], [versionscode], [createDate], [updateDate], [createUserId], [updateUserId], [programId], [notes]) VALUES (21, N'ver-1', N'', 1, N'V-002', CAST(N'2021-12-14T17:31:10.5440807' AS DateTime2), CAST(N'2021-12-14T17:31:10.5440807' AS DateTime2), 34, 34, 21, N'')
SET IDENTITY_INSERT [dbo].[versions] OFF
GO
ALTER TABLE [dbo].[countriesCodes] ADD  CONSTRAINT [DF_countriesCodes_isDefault]  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[countryPackageDate] ADD  CONSTRAINT [DF_countryPackageDate_monthCount]  DEFAULT ((0)) FOR [monthCount]
GO
ALTER TABLE [dbo].[countryPackageDate] ADD  CONSTRAINT [DF_countryPackageDate_yearCount]  DEFAULT ((0)) FOR [yearCount]
GO
ALTER TABLE [dbo].[countryPackageDate] ADD  CONSTRAINT [DF_countryPackageDate_islimitDate]  DEFAULT ((0)) FOR [islimitDate]
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
ALTER TABLE [dbo].[payOp]  WITH CHECK ADD  CONSTRAINT [FK_payOp_packageUser] FOREIGN KEY([packageUserId])
REFERENCES [dbo].[packageUser] ([packageUserId])
GO
ALTER TABLE [dbo].[payOp] CHECK CONSTRAINT [FK_payOp_packageUser]
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
