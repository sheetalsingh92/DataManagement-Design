select c.[CompanyName],a.[AddressLine1],a.[City], 'Billing' AS AddressType from [SalesLT].[Customer] c 
join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID join [SalesLT].[Address] a on ca.AddressID =a.AddressID and ca.AddressType='Main Office'

select c.[CompanyName],a.[AddressLine1],a.[City],'Shipping'  AS AddressType from [SalesLT].[Customer] c 
join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID join [SalesLT].[Address] a on ca.AddressID =a.AddressID and ca.AddressType='Shipping'; 


select c.[CompanyName],a.[AddressLine1],a.[City], 'Billing' AS AddressType from [SalesLT].[Customer] c 
join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID join [SalesLT].[Address] a on ca.AddressID =a.AddressID and ca.AddressType='Main Office' 
UNION
select c.[CompanyName],a.[AddressLine1],a.[City],'Shipping'  AS AddressType from [SalesLT].[Customer] c 
join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID join [SalesLT].[Address] a on ca.AddressID =a.AddressID and ca.AddressType='Shipping' 
order by c.[CompanyName], AddressType

select distinct c.[CompanyName] from [SalesLT].[Customer] c join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID 
join [SalesLT].[Address] a on c.CustomerID= ca.CustomerID where ca.AddressType='Main Office' 
EXCEPT
select c.[CompanyName] from [SalesLT].[Customer] c 
join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID join [SalesLT].[Address] a on ca.AddressID =a.AddressID and ca.AddressType='Shipping' 


select c.[CompanyName] from [SalesLT].[Customer] c 
join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID and ca.AddressType='Main Office' 
INTERSECT
select c.[CompanyName] from [SalesLT].[Customer] c 
join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID and ca.AddressType='Shipping' 














select c.[CompanyName] from [SalesLT].[Customer] c join [SalesLT].[CustomerAddress] ca on c.CustomerID= ca.CustomerID where ca.AddressType='Billing';

select c.companyname , a.AddressLine1 , a.StateProvince,a.City , 'billing' as addresstype  from AdventureWorksLT2012.SalesLT.Customer c ,AdventureWorksLT2012.SalesLT.CustomerAddress ca , AdventureWorksLT2012.SalesLT.Address a where ca.CustomerID=c.CustomerID and ca.AddressID=a.AddressID and  ca.AddressType='Main Office'; 



