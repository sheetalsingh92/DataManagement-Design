

select c.[CompanyName], s.[SalesOrderID], s.[TotalDue]
from [SalesLT].[Customer] as c join [SalesLT].[SalesOrderHeader] as s on c.CustomerID = s.CustomerID;

select c.[CompanyName],(a.[City]+ ''+a.[StateProvince]+ ''+a.[CountryRegion]+''+ a.[PostalCode] ) AS MainOffice, s.[SalesOrderID], s.[TotalDue]
from [SalesLT].[Customer] as c join [SalesLT].[SalesOrderHeader] as s on c.CustomerID = s.CustomerID join [SalesLT].[CustomerAddress] as ca on c.CustomerID = ca.CustomerID join [SalesLT].[Address] as a on ca.AddressID = a.AddressID;

select c.[CompanyName], (c.[FirstName]+''+c.[LastName]) AS CONTACTS, s.[SalesOrderID],s.[TotalDue]  from  [SalesLT].[Customer] c 
left join [SalesLT].[SalesOrderHeader] s on c.CustomerID= s.[CustomerID] order by s.[SalesOrderID] DESC ;

select c.[CustomerID], c.[CompanyName],(c.[FirstName]+''+c.[LastName]) AS CONTACTS, c.[Phone]
from [SalesLT].[Customer] c left join [SalesLT].[CustomerAddress] ca on c.CustomerID=ca.CustomerID 
where ca.[AddressID] is null;

Select c.CustomerID, p.ProductID from SalesLT.Customer as c
full outer join SalesLT.SalesOrderHeader as s
on c.CustomerID = s.CustomerID
full outer join SalesLT.SalesOrderDetail as so
on s.SalesOrderID =so.SalesOrderID
full outer join SalesLT.Product as P
on p.ProductID = so.ProductID;








