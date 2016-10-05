


select * from SalesLT.Customer;

select ( Title+''+FirstName+ ''+ ISNull(MiddleName,'')+ ''+LastName+''+ISNull(Suffix,'')) AS NAME  from SalesLT.Customer;

select SalesPerson, (Title +''+ FirstName) as CustomerName, Phone from SalesLT.Customer;

select( convert(varchar(20),CustomerID)  + ':' + CompanyName ) as CustomerCompanies from SalesLT.Customer;

select (SalesOrderNumber+'('+ convert(varchar(20),RevisionNumber) +')') as SalesOrderID, (CONVERT(VARCHAR(10),[OrderDate] , 102)) as OrderDate from SalesLT.SalesOrderHeader;

select( FirstName+ ''+ ISNull(MiddleName,'')+ ''+LastName) AS NAME from [SalesLT].[Customer];


update [SalesLT].[Customer] set 
[EmailAddress] = NULL where [CustomerID] %7 =1;
select [CustomerID], ISNull([EmailAddress],[Phone]) AS PrimaryContact from [SalesLT].[Customer];


update [SalesLT].[SalesOrderHeader] set [ShipDate] = NUll where [SalesOrderID]> 71899;
SELECT [SalesOrderID], [OrderDate], CASE 
 WHEN [ShipDate] IS NULL
    THEN 'Awaiting Shipment'
    ELSE 'Shipped'
END AS ShippingStatus from [SalesLT].[SalesOrderHeader]






