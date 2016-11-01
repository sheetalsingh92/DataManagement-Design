insert into [SalesLT].[Product] values ('LED Lights','LT-L123',NULL,2.56,12.99,NULL,NULL,37,Null,GETDATE(),null,null,null,null,default,default);
select [ProductID] from [SalesLT].[Product] where [ProductNumber]='LT-L123';
select * from [SalesLT].[Product] where [ProductNumber]='LT-L123';
delete from [SalesLT].[Product] where Name='LED Lights'




insert into [SalesLT].[ProductCategory] values (4,'Bells and Horns',default,GETDATE())
select * from [SalesLT].[ProductCategory];
insert into [SalesLT].[Product] values('Bicycle Bell','BB-RING',null,2.47,4.99,null,null,IDENT_CURRENT('SalesLT.ProductCategory'),default,GETDATE(),default,default,null,null,default,default);
insert into [SalesLT].[Product] values('Bicycle Horn','BB-PARP',null,1.29,3.75,null,null,IDENT_CURRENT('SalesLT.ProductCategory'),default,GETDATE(),default,default,null,null,default,default);
select * from [SalesLT].[Product];


UPDATE [SalesLT].[Product]
SET ListPrice = ListPrice * 1.1
WHERE ProductCategoryID =
	(SELECT [ProductCategoryID]  FROM [SalesLT].[ProductCategory] WHERE Name = 'Bells and Horns');
select [Name],[ProductCategoryID] from [SalesLT].[Product];
update [SalesLT].[Product] set [DiscontinuedDate]= GETDATE() where [Name] != 'LED Lights';select * from [SalesLT].[Product];DELETE FROM [SalesLT].[Product]
WHERE [ProductCategoryID] =
	(SELECT [ProductCategoryID] FROM [SalesLT].[ProductCategory] WHERE Name = 'Bells and Horns');

DELETE FROM [SalesLT].[ProductCategory]
WHERE [ProductCategoryID] =
	(SELECT [ProductCategoryID] FROM [SalesLT].[ProductCategory] WHERE Name = 'Bells and Horns');delete from [SalesLT].[ProductCategory] where  Name='Bells and Horns';