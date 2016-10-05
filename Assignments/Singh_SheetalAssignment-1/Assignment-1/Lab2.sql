
select distinct City,[StateProvince] from [SalesLT].[Address];

SELECT TOP(10) PERCENT Name,
[Weight]
FROM [SalesLT].[Product] order by Weight desc;

SELECT TOP (100) [Name],Weight
FROM [SalesLT].[Product]
WHERE 1=1 AND Weight NOT IN (
SELECT  top (10) Weight FROM [SalesLT].[Product] order by Weight desc) order by Weight desc; 

select [Name],[Color],[Size] from [SalesLT].[Product] where [ProductModelID]= 1 ;

select [ProductNumber], [Name] from [SalesLT].[Product] where ([Color]=  'black' or [Color]= 'red' or [Color]='white') AND ([Size] =  'S' or [Size] =  'M');

select [ProductNumber],[Name],[ListPrice] from [SalesLT].[Product] where [ProductNumber] like 'BK-%';

SELECT [ProductNumber],[Name],[ListPrice] from [SalesLT].[Product]  
WHERE [ProductNumber] LIKE 'BK-[^R]%-[0-9][0-9]'


