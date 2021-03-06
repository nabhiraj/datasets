--- Fudge Federal Credit Union
--- SCHEMA 1.0
---

if exists(select * from sys.objects where name='ffcu_Accounts') drop table ffcu_Accounts
if exists(select * from sys.objects where name='ffcu_Customers') drop table ffcu_Customers
if exists(select * from sys.objects where name='ffcu_AccountTypes') drop table ffcu_AccountTypes
if exists(select * from sys.objects where name='ffcu_vMyAccounts') drop view ffcu_vMyAccounts
if exists(select * from sys.objects where name='p_ffcu_transfer') drop procedure dbo.p_ffcu_transfer
if exists(select * from sys.objects where name='p_ffcu_transfer') drop procedure dbo.p_ffcu_transfer
if exists(select * from sys.objects where name='p_ffcu_transfer_safe') drop procedure dbo.p_ffcu_transfer_safe
if exists(select * from sys.objects where name='p_ffcu_signup') drop procedure dbo.p_ffcu_signup
go
/****** Object:  Table [dbo].[ffcu_Customers]    Script Date: 02/28/2011 18:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ffcu_Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](100) NOT NULL,
	[customer_email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Customers] UNIQUE NONCLUSTERED 
(
	[customer_email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ffcu_Customers] ON
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (6, N'bettealott@syr.edu', N'bettealott@syr.edu')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (7, N'tallyitupp@syr.edu', N'tallyitupp@syr.edu')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (8, N'salladd@syr.edu', N'salladd@syr.edu')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (9, N'tony22@gmail.com', N'tony22@gmail.com')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (10, N'Bob', N'Bob@bob.com')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (11, N'Dave', N'dave@syr.edu')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (12, N'mikerofone@syr.edu', N'mikerofone@syr.edu')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (13, N'artiechoke@syr.edu', N'artiechoke@syr.edu')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (14, N'Fred', N'Fred@fred.com')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (15, N'Sally', N'Sally@sturthers.com')
INSERT [dbo].[ffcu_Customers] ([customer_id], [customer_name], [customer_email]) VALUES (16, N'Bob Enweave', N'benweave@syr.edu')
SET IDENTITY_INSERT [dbo].[ffcu_Customers] OFF
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 02/28/2011 18:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ffcu_AccountTypes](
	[accounttype_id] [char](1) NOT NULL,
	[accounttype_name] [varchar](50) NOT NULL,
	[accounttype_sort] [int] NOT NULL,
 CONSTRAINT [PK_accountTypes] PRIMARY KEY CLUSTERED 
(
	[accounttype_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ffcu_AccountTypes] ([accounttype_id], [accounttype_name], [accounttype_sort]) VALUES (N'C', N'Checking ', 1)
INSERT [dbo].[ffcu_AccountTypes] ([accounttype_id], [accounttype_name], [accounttype_sort]) VALUES (N'S', N'Savings', 0)
/****** Object:  Table [dbo].[ffcu_Accounts]    Script Date: 02/28/2011 18:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ffcu_Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_customer_id] [int] NOT NULL,
	[account_type_id] [char](1) NOT NULL,
	[account_balance] [money] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ffcu_Accounts] ON
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (7, 6, N'S', 1500.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (8, 6, N'C', 0.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (9, 7, N'S', 349.9900)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (10, 7, N'C', 150.0100)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (11, 8, N'S', 734.5600)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (12, 8, N'C', 500.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (13, 9, N'S', 10.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (14, 9, N'C', 0.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (15, 10, N'S', 42.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (16, 10, N'C', 109.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (17, 11, N'S', 1.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (18, 11, N'C', 0.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (19, 12, N'S', 1000000.0100)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (20, 12, N'C', 10.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (21, 13, N'S', 55000.0100)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (22, 13, N'C', 0.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (23, 15, N'S', 5.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (24, 15, N'C', 0.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (25, 16, N'S', 0.0000)
INSERT [dbo].[ffcu_Accounts] ([account_id], [account_customer_id], [account_type_id], [account_balance]) VALUES (26, 16, N'C', 8000.0000)
SET IDENTITY_INSERT [dbo].[ffcu_Accounts] OFF
/****** Object:  View [dbo].[vMyAccounts]    Script Date: 02/28/2011 18:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ffcu_vMyAccounts]
AS
SELECT     dbo.ffcu_Customers.customer_name, dbo.ffcu_Customers.customer_email, dbo.ffcu_Accounts.account_id, dbo.ffcu_Accounts.account_customer_id, dbo.ffcu_Accounts.account_type_id, 
                      dbo.ffcu_Accounts.account_balance, dbo.ffcu_AccountTypes.accounttype_name, dbo.ffcu_AccountTypes.accounttype_sort
FROM         dbo.ffcu_Accounts INNER JOIN
                      dbo.ffcu_AccountTypes ON dbo.ffcu_Accounts.account_type_id = dbo.ffcu_AccountTypes.accounttype_id INNER JOIN
                      dbo.ffcu_Customers ON dbo.ffcu_Accounts.account_customer_id = dbo.ffcu_Customers.customer_id
GO
/****** Object:  StoredProcedure [dbo].[p_transfer_safe]    Script Date: 02/28/2011 18:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Fudge
-- Create date: 
-- Description:	transfer funds from one account to another
-- =============================================
CREATE PROCEDURE [dbo].[p_ffcu_transfer_safe] 
	-- Add the parameters for the stored procedure here
	@customerid int, 
	@fromacct char(1),
	@toacct char(1),
	@amount money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION 
	DECLARE @COUNT1 int
	DECLARE @COUNT2 int

	-- deduct the @amount from the @fromacct
	UPDATE ffcu_Accounts 
		SET account_balance = account_balance - @amount	
		WHERE account_customer_id=@customerid 
			AND account_type_id=@fromacct

	-- Save the number of rows affected by the 1st update
	-- should be 1 row
	SET @COUNT1 = @@ROWCOUNT		
	
	-- add the @amount to the @toacct
	UPDATE ffcu_Accounts 
		SET account_balance = account_balance + @amount	
		WHERE account_customer_id=@customerid 
			AND account_type_id=@toacct

	-- Save the number of rows affected by the 2nd update
	-- should be 1 row
	SET @COUNT2 = @@ROWCOUNT		

	-- Now let's do the right thing if the updates worked
	IF (@COUNT1 = 1) AND (@COUNT2 = 1)
		COMMIT
	ELSE
		ROLLBACK

END
GO
/****** Object:  StoredProcedure [dbo].[p_transfer]    Script Date: 02/28/2011 18:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Fudge
-- Create date: 
-- Description:	transfer funds from one account to another
-- =============================================
CREATE PROCEDURE [dbo].[p_ffcu_transfer] 
	-- Add the parameters for the stored procedure here
	@customerid int, 
	@fromacct char(1),
	@toacct char(1),
	@amount money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- deduct the @amount from the @fromacct
	UPDATE ffcu_Accounts 
		SET account_balance = account_balance - @amount	
		WHERE account_customer_id=@customerid 
			AND account_type_id=@fromacct
			
	
	-- add the @amount to the @toacct
	UPDATE ffcu_Accounts 
		SET account_balance = account_balance + @amount	
		WHERE account_customer_id=@customerid 
			AND account_type_id=@toacct


END
GO
/****** Object:  StoredProcedure [dbo].[p_signup]    Script Date: 02/28/2011 18:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Michael Fudge
-- Create date: 
-- Description:	Creates an Customer and default 
--	accounts (checking, savings w/ opeing balance
-- =============================================
CREATE PROCEDURE [dbo].[p_ffcu_signup] 
	-- Add the parameters for the stored procedure here
	@customer_name varchar(100), 
	@customer_email varchar(50),
	@opening_balance money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE  @customerid int 

	-- create customer
	IF NOT EXISTS(SELECT * FROM ffcu_Customers WHERE customer_email = @customer_email)
	BEGIN
		INSERT INTO ffcu_Customers (customer_name, customer_email)
			VALUES (@customer_name, @customer_email)
		SET @customerid = @@IDENTITY
	END
	ELSE
	BEGIN
		SET @customerid = (SELECT customer_id FROM ffcu_Customers where customer_email=@customer_email)
	END
	
	IF NOT EXISTS(SELECT * FROM ffcu_Accounts WHERE account_customer_id = @customerid AND account_type_id='S')
	BEGIN
		-- create savings account with opening balance
		INSERT INTO ffcu_Accounts (account_customer_id, account_type_id, account_balance)
			VALUES (@customerid, 'S', @opening_balance)
	END
	
	IF NOT EXISTS(SELECT * FROM ffcu_Accounts WHERE account_customer_id = @customerid AND account_type_id='C')
	BEGIN
		-- create checking account with opening balance of 0
		INSERT INTO ffcu_Accounts (account_customer_id, account_type_id, account_balance)
			VALUES (@customerid, 'C', 0)
	END
END
GO
/****** Object:  Check [CK_Account_balance_zero_or_more]    Script Date: 02/28/2011 18:13:12 ******/
ALTER TABLE [dbo].[ffcu_Accounts]  WITH CHECK ADD  CONSTRAINT [CK_Account_balance_zero_or_more] CHECK  (([account_balance]>=(0)))
GO
ALTER TABLE [dbo].[ffcu_Accounts] CHECK CONSTRAINT [CK_Account_balance_zero_or_more]
GO
/****** Object:  ForeignKey [FK_Accounts_AccountTypes]    Script Date: 02/28/2011 18:13:12 ******/
ALTER TABLE [dbo].[ffcu_Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_AccountTypes] FOREIGN KEY([account_type_id])
REFERENCES [dbo].[ffcu_AccountTypes] ([accounttype_id])
GO
ALTER TABLE [dbo].[ffcu_Accounts] CHECK CONSTRAINT [FK_Accounts_AccountTypes]
GO
/****** Object:  ForeignKey [FK_Accounts_Customers]    Script Date: 02/28/2011 18:13:12 ******/
ALTER TABLE [dbo].[ffcu_Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([account_customer_id])
REFERENCES [dbo].[ffcu_Customers] ([customer_id])
GO
ALTER TABLE [dbo].[ffcu_Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
