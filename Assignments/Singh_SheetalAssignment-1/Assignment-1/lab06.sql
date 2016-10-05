select distinct p.[ProductID],p.[Name],p.[ListPrice] from [SalesLT].[Product] p join [SalesLT].[SalesOrderDetail] so on p.ProductID=so.ProductID  group by p.[ProductID],p.[Name],p.[ListPrice] having p.ListPrice> AVG(so.UnitPrice)

select distinct p.[ProductID],p.[Name],p.[ListPrice] from [SalesLT].[Product] p join [SalesLT].[SalesOrderDetail] so on p.ProductID=so.ProductID where p.ListPrice >= 100 AND so.UnitPrice <100

select distinct p.[ProductID],p.[Name],p.[ListPrice],p.[StandardCost] ,(select AVG(so.UnitPrice) from [SalesLT].[SalesOrderDetail] so) as AverageSellingPrice from [SalesLT].[Product] p ;



select distinct p.[ProductID],p.[Name],p.[ListPrice],p.[StandardCost] ,AVG(so.UnitPrice) as AverageSellingPrice from [SalesLT].[SalesOrderDetail] so join [SalesLT].[Product] p on so.ProductID=p.ProductID group by p.[ProductID],p.[Name],p.[ListPrice],p.[StandardCost]  having AVG(so.UnitPrice)< p.[StandardCost];

select so.[SalesOrderID],so.[CustomerID],c.[FirstName],c.[LastName], so.[TotalDue]
FROM [SalesLT].[SalesOrderHeader] AS so
    CROSS APPLY dbo.ufnGetCustomerInformation(so.CustomerID) AS c;

select ca.[CustomerID],c.[FirstName],c.[LastName],a.[AddressLine1],a.[City] from[SalesLT].[Address] a join 
[SalesLT].[CustomerAddress] ca on a.AddressID=ca.AddressID
 CROSS APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS c;





	








