

select [ProductID], UPPER ([Name]) as name,ROUND([Weight],0) as ApproxWeight from [SalesLT].[Product];




select [ProductID], UPPER ([Name]) as name,ROUND([Weight],0) as ApproxWeight, datename(m,[SellStartDate]) as SellStartmonth , cast(datepart(yyyy,[SellStartDate]) as varchar) as SellStartmonth from [SalesLT].[Product];

select [ProductID], UPPER ([Name]),ROUND([Weight],0) as ApproxWeight, datename(m,[SellStartDate]) as SellStartmonth , cast(datepart(yyyy,[SellStartDate]) as varchar) as SellStartdate, SUBSTRING ([ProductNumber], 1, 2) as ProductType from [SalesLT].[Product];

Select ProductID,Name, Size from SalesLT.Product where ISNUMERIC(Size) = 1;

select c.[CompanyName], RANK() over (order by so.TotalDue desc) as Ranking from [SalesLT].[Customer] c join [SalesLT].[SalesOrderHeader] so on c.CustomerID=so.CustomerID ;

select p.[Name] , Sum([LineTotal]) as totalRevenue from [SalesLT].[Product] p join [SalesLT].[SalesOrderDetail] so on p.ProductID=so.ProductID group by p.Name order by totalRevenue desc;

select p.[Name] , Sum([LineTotal]) as totalRevenue from [SalesLT].[Product] p join [SalesLT].[SalesOrderDetail] so on p.ProductID=so.ProductID group by p.ListPrice,p.Name having p.ListPrice>1000;


select p.[Name] , Sum([LineTotal]) as totalRevenue from  [SalesLT].[SalesOrderDetail] so  join [SalesLT].[Product] p on p.ProductID=so.ProductID group by p.Name having Sum([LineTotal])>20000;







