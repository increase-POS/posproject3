USE [programmanageEmpty]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_users1]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_users]
GO
ALTER TABLE [dbo].[versions] DROP CONSTRAINT [FK_versions_programs]
GO
ALTER TABLE [dbo].[userSetValues] DROP CONSTRAINT [FK_userSetValues_setValues]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [FK_users_countriesCodes]
GO
ALTER TABLE [dbo].[sysEmails] DROP CONSTRAINT [FK_sysEmails_users1]
GO
ALTER TABLE [dbo].[sysEmails] DROP CONSTRAINT [FK_sysEmails_users]
GO
ALTER TABLE [dbo].[setValues] DROP CONSTRAINT [FK_setValues_setting]
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
/****** Object:  Table [dbo].[versions]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[versions]') AND type in (N'U'))
DROP TABLE [dbo].[versions]
GO
/****** Object:  Table [dbo].[userSetValues]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[userSetValues]') AND type in (N'U'))
DROP TABLE [dbo].[userSetValues]
GO
/****** Object:  Table [dbo].[users]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[sysEmails]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysEmails]') AND type in (N'U'))
DROP TABLE [dbo].[sysEmails]
GO
/****** Object:  Table [dbo].[setValues]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setValues]') AND type in (N'U'))
DROP TABLE [dbo].[setValues]
GO
/****** Object:  Table [dbo].[setting]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setting]') AND type in (N'U'))
DROP TABLE [dbo].[setting]
GO
/****** Object:  Table [dbo].[puStatus]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[puStatus]') AND type in (N'U'))
DROP TABLE [dbo].[puStatus]
GO
/****** Object:  Table [dbo].[programs]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[programs]') AND type in (N'U'))
DROP TABLE [dbo].[programs]
GO
/****** Object:  Table [dbo].[posSerials]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posSerials]') AND type in (N'U'))
DROP TABLE [dbo].[posSerials]
GO
/****** Object:  Table [dbo].[posInfo]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[posInfo]') AND type in (N'U'))
DROP TABLE [dbo].[posInfo]
GO
/****** Object:  Table [dbo].[payOp]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[payOp]') AND type in (N'U'))
DROP TABLE [dbo].[payOp]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packageUser]') AND type in (N'U'))
DROP TABLE [dbo].[packageUser]
GO
/****** Object:  Table [dbo].[packages]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[packages]') AND type in (N'U'))
DROP TABLE [dbo].[packages]
GO
/****** Object:  Table [dbo].[objects]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objects]') AND type in (N'U'))
DROP TABLE [dbo].[objects]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groups]') AND type in (N'U'))
DROP TABLE [dbo].[groups]
GO
/****** Object:  Table [dbo].[groupObject]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[groupObject]') AND type in (N'U'))
DROP TABLE [dbo].[groupObject]
GO
/****** Object:  Table [dbo].[error]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[error]') AND type in (N'U'))
DROP TABLE [dbo].[error]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
DROP TABLE [dbo].[customers]
GO
/****** Object:  Table [dbo].[countryPackageDate]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countryPackageDate]') AND type in (N'U'))
DROP TABLE [dbo].[countryPackageDate]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesCodes]') AND type in (N'U'))
DROP TABLE [dbo].[countriesCodes]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cities]') AND type in (N'U'))
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[agentPackage]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agentPackage]') AND type in (N'U'))
DROP TABLE [dbo].[agentPackage]
GO
/****** Object:  Table [dbo].[agentCustomer]    Script Date: 06/18/2022 1:50:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agentCustomer]') AND type in (N'U'))
DROP TABLE [dbo].[agentCustomer]
GO
/****** Object:  Table [dbo].[agentCustomer]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[agentPackage]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[cities]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[countryPackageDate]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 06/18/2022 1:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[custId] [int] IDENTITY(1,1) NOT NULL,
	[custname] [nvarchar](500) NOT NULL,
	[lastName] [nvarchar](500) NULL,
	[company] [nvarchar](500) NULL,
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
/****** Object:  Table [dbo].[error]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[groupObject]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[groups]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[objects]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[packages]    Script Date: 06/18/2022 1:50:34 PM ******/
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
	[isDemo] [nvarchar](10) NULL,
 CONSTRAINT [PK_packageSpec] PRIMARY KEY CLUSTERED 
(
	[packageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[packageUser]    Script Date: 06/18/2022 1:50:34 PM ******/
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
	[canChngSer] [int] NULL,
 CONSTRAINT [PK_spesAgent] PRIMARY KEY CLUSTERED 
(
	[packageUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payOp]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[posInfo]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[posSerials]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[programs]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[puStatus]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[setting]    Script Date: 06/18/2022 1:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setting](
	[settingId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[notes] [ntext] NULL,
 CONSTRAINT [PK_setting] PRIMARY KEY CLUSTERED 
(
	[settingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setValues]    Script Date: 06/18/2022 1:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setValues](
	[valId] [int] IDENTITY(1,1) NOT NULL,
	[value] [ntext] NULL,
	[isDefault] [int] NOT NULL,
	[isSystem] [int] NOT NULL,
	[notes] [ntext] NULL,
	[settingId] [int] NULL,
 CONSTRAINT [PK_setValues] PRIMARY KEY CLUSTERED 
(
	[valId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysEmails]    Script Date: 06/18/2022 1:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysEmails](
	[emailId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[port] [int] NOT NULL,
	[isSSL] [bit] NOT NULL,
	[smtpClient] [nvarchar](100) NULL,
	[side] [nvarchar](100) NULL,
	[notes] [nvarchar](100) NULL,
	[branchId] [int] NULL,
	[isActive] [tinyint] NOT NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[isMajor] [bit] NOT NULL,
 CONSTRAINT [PK_sysEmails] PRIMARY KEY CLUSTERED 
(
	[emailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 06/18/2022 1:50:34 PM ******/
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
/****** Object:  Table [dbo].[userSetValues]    Script Date: 06/18/2022 1:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userSetValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[valId] [int] NULL,
	[note] [ntext] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [int] NULL,
	[updateUserId] [int] NULL,
 CONSTRAINT [PK_userSetValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[versions]    Script Date: 06/18/2022 1:50:34 PM ******/
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
SET IDENTITY_INSERT [dbo].[setting] ON 

INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (1, N'com_name', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (2, N'com_address', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (3, N'com_email', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (4, N'com_mobile', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (5, N'com_phone', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (6, N'com_fax', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (7, N'com_logo', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (8, N'region', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (9, N'language', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (10, N'currency', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (11, N'tax', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (12, N'storage_cost', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (13, N'pur_order_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (14, N'dateForm', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (15, N'sale_email_temp', N'emailtemp')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (16, N'sale_order_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (17, N'quotation_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (18, N'required_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (19, N'sale_copy_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (20, N'pur_copy_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (21, N'print_on_save_sale', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (22, N'print_on_save_pur', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (23, N'email_on_save_sale', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (24, N'email_on_save_pur', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (25, N'menuIsOpen', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (26, N'report_lang', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (27, N'rep_copy_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (28, N'user_path', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (29, N'accuracy', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (30, N'pur_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (31, N'Pur_inv_avg_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (32, N'Allow_print_inv_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (33, N'item_cost', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (34, N'sale_note', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (35, N'upgrade_email_temp', N'emailtemp')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (36, N'', N'')
SET IDENTITY_INSERT [dbo].[setting] OFF
GO
SET IDENTITY_INSERT [dbo].[setValues] ON 

INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (1, N'en', 0, 0, NULL, 9)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (2, N'ar', 0, 0, NULL, 9)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (12, N'0', 1, 1, NULL, 11)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (13, N'0', 1, 1, NULL, 12)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (14, N'ad4bfd50185ef68bce2b903aa7e10ec0.png', 1, 1, N'', 7)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (15, N'purchase order', 0, 1, N'title', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (16, N'this is ', 0, 1, N'text1', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (17, N'', 0, 1, N'text2', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (18, N'', 0, 1, N'link1text', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (19, N'', 0, 1, N'link2text', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (20, N'', 0, 0, N'link3text', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (22, N'', 0, 1, N'link1url', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (23, N'', 0, 1, N'link2url', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (24, N'', 0, 1, N'link3url', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (25, N'LongDatePattern', 1, 1, NULL, 14)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (26, N'Sales email', 0, 1, N'title', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (27, N'', 0, 1, N'text1', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (28, N'', 0, 1, N'text2', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (29, N'', 0, 1, N'link1text', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (30, N'', 0, 1, N'link2text', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (31, N'', 0, 0, N'link3text', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (32, N'', 0, 1, N'link1url', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (33, N'', 0, 1, N'link2url', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (34, N'', 0, 1, N'link3url', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (39, N'Sales Order', 0, 1, N'title', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (40, N'', 0, 0, N'text1', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (41, N'', 0, 1, N'text2', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (42, N'', 0, 1, N'link1text', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (43, N'', 0, 1, N'link2text', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (44, N'', 0, 1, N'link3text', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (45, N'', 0, 1, N'link1url', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (46, N'', 0, 1, N'link2url', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (47, N'', 0, 1, N'link3url', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (48, N'Quotaion', 0, 1, N'title', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (49, N'', 0, 0, N'text1', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (50, N'', 0, 1, N'text2', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (51, N'', 0, 1, N'link1text', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (52, N'', 0, 1, N'link2text', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (53, N'', 0, 0, N'link3text', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (54, N'', 0, 1, N'link1url', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (55, N'', 0, 1, N'link2url', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (56, N'', 0, 1, N'link3url', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (58, N'Increase', 1, 1, NULL, 1)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (59, N'Kuwait', 1, 1, NULL, 2)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (60, N'Info@increase.com', 1, 1, NULL, 3)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (61, N'+965-998484188', 1, 1, NULL, 4)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (62, N'+965--', 1, 1, NULL, 5)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (63, N'+965--', 1, 1, NULL, 6)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (64, N'Req', 0, 1, N'title', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (65, N'', 0, 0, N'text1', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (66, N'', 0, 1, N'text2', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (67, N'', 0, 1, N'link1text', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (68, N'', 0, 1, N'link2text', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (69, N'', 0, 0, N'link3text', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (70, N'', 0, 1, N'link1url', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (71, N'', 0, 1, N'link2url', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (72, N'', 0, 1, N'link3url', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (73, N'1', 0, 1, N'print', 19)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (74, N'1', 0, 1, N'print', 20)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (75, N'0', 0, 1, N'print', 21)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (76, N'0', 0, 1, N'print', 22)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (77, N'0', 0, 1, N'print', 23)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (78, N'0', 0, 1, N'print', 24)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (79, N'open', 0, 0, NULL, 25)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (80, N'close', 0, 0, NULL, 25)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (81, N'en', 1, 1, NULL, 26)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (82, N'ar', 0, 1, NULL, 26)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (83, N'1', 1, 1, N'print', 27)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (84, N'first', 0, 0, N'0', 28)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (85, N'second', 0, 0, N'0', 28)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (87, N'1', 1, 1, N'0', 29)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (88, N'Purchase', 0, 1, N'title', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (89, N'', 0, 0, N'text1', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (90, N'', 0, 1, N'text2', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (91, N'', 0, 1, N'link1text', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (92, N'', 0, 1, N'link2text', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (93, N'', 0, 1, N'link3text', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (94, N'', 0, 1, N'link1url', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (95, N'', 0, 1, N'link2url', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (96, N'', 0, 1, N'link3url', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (109, N'5', 1, 1, N'0', 31)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (110, N'5', 1, 1, N'print', 32)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (111, N'0', 1, 1, N'0', 33)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (112, N'Terms', 1, 1, N'sale_note', 34)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (113, N'Sales email', 0, 1, N'title', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (114, N'', 0, 1, N'text1', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (115, N'', 0, 1, N'text2', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (116, N'', 0, 1, N'link1text', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (117, N'', 0, 1, N'link2text', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (118, N'', 0, 1, N'link3text', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (119, N'', 0, 1, N'link1url', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (120, N'', 0, 1, N'link2url', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (121, N'', 0, 1, N'link3url', 35)
SET IDENTITY_INSERT [dbo].[setValues] OFF
GO
SET IDENTITY_INSERT [dbo].[sysEmails] ON 

INSERT [dbo].[sysEmails] ([emailId], [name], [email], [password], [port], [isSSL], [smtpClient], [side], [notes], [branchId], [isActive], [createUserId], [updateUserId], [createDate], [updateDate], [isMajor]) VALUES (2, N'sale', N'wseetw@gmail.com', N'MjE0YTE5NjBh', 587, 1, N'smtp.gmail.com', N'sales', N'', 1, 1, 2, 2, CAST(N'2022-02-07T02:42:03.2943272' AS DateTime2), CAST(N'2022-02-13T19:22:49.0391612' AS DateTime2), 1)
INSERT [dbo].[sysEmails] ([emailId], [name], [email], [password], [port], [isSSL], [smtpClient], [side], [notes], [branchId], [isActive], [createUserId], [updateUserId], [createDate], [updateDate], [isMajor]) VALUES (3, N'aaaaaaa', N'aaaaaaa@efe.com', N'YWFhYWFh', 123, 1, N'qwdwqd', N'accounting', N'qwdw', 1, 1, 2, 2, CAST(N'2022-02-07T20:20:49.8618654' AS DateTime2), CAST(N'2022-02-09T13:38:04.5300297' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[sysEmails] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (1, N'administrator', N'administrator', N'Support', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2021-12-08T12:25:13.5504988' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ad', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'Us-Admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (2, N'admin', N'admin', N'admin', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2022-06-16T16:46:14.8336407' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ad', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'Us-adminuser', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (3, N'sysagent', N'sysagent', N'sysagent', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2021-12-08T12:25:13.5504988' AS DateTime2), N'1b8baf4f819e5b304e1a176e1c590c84', N'ag', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'aaa', NULL, NULL, NULL, NULL, NULL, 1)
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
ALTER TABLE [dbo].[setValues]  WITH CHECK ADD  CONSTRAINT [FK_setValues_setting] FOREIGN KEY([settingId])
REFERENCES [dbo].[setting] ([settingId])
GO
ALTER TABLE [dbo].[setValues] CHECK CONSTRAINT [FK_setValues_setting]
GO
ALTER TABLE [dbo].[sysEmails]  WITH CHECK ADD  CONSTRAINT [FK_sysEmails_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[sysEmails] CHECK CONSTRAINT [FK_sysEmails_users]
GO
ALTER TABLE [dbo].[sysEmails]  WITH CHECK ADD  CONSTRAINT [FK_sysEmails_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[sysEmails] CHECK CONSTRAINT [FK_sysEmails_users1]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_countriesCodes]
GO
ALTER TABLE [dbo].[userSetValues]  WITH CHECK ADD  CONSTRAINT [FK_userSetValues_setValues] FOREIGN KEY([valId])
REFERENCES [dbo].[setValues] ([valId])
GO
ALTER TABLE [dbo].[userSetValues] CHECK CONSTRAINT [FK_userSetValues_setValues]
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
