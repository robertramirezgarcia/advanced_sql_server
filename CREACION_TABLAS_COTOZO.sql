CREATE TABLE [PRODUCTO].[Products](
	[productid] [int],
	[productname] [nvarchar](40),
	[supplierid] [int],
	[categoryid] [int],
	[unitprice] [money],
	[discontinued] [bit]
)
GO

CREATE TABLE [PRODUCTO].[Suppliers](
	[supplierid] [int],
	[companyname] [nvarchar](40),
	[contactname] [nvarchar](30),
	[contacttitle] [nvarchar](30),
	[address] [nvarchar](60),
	[city] [nvarchar](15),
	[region] [nvarchar](15),
	[postalcode] [nvarchar](10),
	[country] [nvarchar](15),
	[phone] [nvarchar](24),
	[fax] [nvarchar](24)
)
GO

CREATE TABLE [VENTAS].[Customers](
	[custid] [int],
	[companyname] [nvarchar](40),
	[contactname] [nvarchar](30),
	[contacttitle] [nvarchar](30),
	[address] [nvarchar](60),
	[city] [nvarchar](15),
	[region] [nvarchar](15),
	[postalcode] [nvarchar](10),
	[country] [nvarchar](15),
	[phone] [nvarchar](24),
	[fax] [nvarchar](24)
)
GO