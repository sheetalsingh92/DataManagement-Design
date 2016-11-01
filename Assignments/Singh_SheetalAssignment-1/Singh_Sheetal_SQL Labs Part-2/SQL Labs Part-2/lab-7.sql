select [ProductID],p.[Name],pm.[Name],pm.[Summary] from [SalesLT].[Product] p 
 join [SalesLT].[vProductModelCatalogDescription] pm on p.[ProductModelID]= pm.[ProductModelID];


DECLARE @ProductTotals TABLE
(
  [Color] varchar(30) 
)
INSERT INTO @ProductTotals([Color]) SELECT distinct [Color]
    FROM [SalesLT].[Product]
SELECT  PT.[Color],P.[Name] ,P.[ProductID]
FROM [SalesLT].[Product] P
  INNER JOIN @ProductTotals PT ON P.color = PT.color ;



SELECT p2.[Name], p1.ProductCategoryName,p1.ParentProductCategoryName
FROM dbo.[ufnGetAllCategories]()
AS p1 INNER JOIN [SalesLT].[Product] AS p2 ON p1.ProductCategoryID = p2.ProductCategoryID


WITH Sales_CTE (CompanyName,FirstName,TotalDue)
AS
(
    SELECT  c.CompanyName,c.FirstName,so.[TotalDue]
    FROM [SalesLT].[SalesOrderHeader] so join[SalesLT].[Customer] c  on so.[CustomerID]=c.[CustomerID]   
)
SELECT CompanyName+ '(' +FirstName +')' as Details, Sum(TotalDue)AS "Total Revenue"
FROM Sales_CTE group by  CompanyName,FirstName

GO