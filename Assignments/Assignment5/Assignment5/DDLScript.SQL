/*
Created: 2/10/2016
Modified: 2/18/2016
Model: MySQL 5.6
Database: MySQL 5.6
*/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `Assignment_DimensionalModeling`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `Assignment_DimensionalModeling`;


USE `Assignment_DimensionalModeling`;


-- Create tables section -------------------------------------------------


-- Table DimVendor

CREATE TABLE `DimVendor`
(
  `VendorID` Int NOT NULL,
  `VendorName` Varchar(60) NOT NULL,
  `AccountNumber` Varchar(30) NOT NULL,
  `PreferredVendorStatus` Bool NOT NULL,
  `VendorActiveFlag` Bool NOT NULL,
  `VendorAddressLine` Varchar(40) NOT NULL,
  `VendorCity` Varchar(20) NOT NULL,
  `VendorStateProvinceName` Varchar(20) NOT NULL,
  `VendorPostalCode` Int NOT NULL,
  `VendorCountryRegionName` Varchar(20) NOT NULL
)
;

ALTER TABLE `DimVendor` ADD  PRIMARY KEY (`VendorID`)
;

ALTER TABLE `DimVendor` ADD UNIQUE `AccountNumber` (`AccountNumber`)
;

-- Table DimProduct

CREATE TABLE `DimProduct`
(
  `ProductID` Int NOT NULL,
  `ProductName` Varchar(20) NOT NULL,
  `ProductNumber` Varchar(20) NOT NULL,
  `MakeFlag` Bool NOT NULL,
  `FinishedGoodFlag` Bool NOT NULL,
  `ProductSize` Varchar(10),
  `SizeUnitMeasureCode` Varchar(10),
  `WeightUnitMeasureCode` Varchar(10),
  `Class` Varchar(20),
  `Style` Varchar(20),
  `ProductLine` Varchar(10),
  `Color` Varchar(20),
  `ProductCategoryID` Int,
  `ProductCategoryName` Varchar(40),
  `ProductSubCategoryName` Varchar(40),
  `ProductModelName` Varchar(40),
  `ProductModelID` Int,
  `ProductSubCategoryID` Int,
  `Status` Int NOT NULL,
  `DiscontinuedDate` Datetime,
  `SellStartDate` Datetime NOT NULL,
  `SellEndDate` Datetime
)
;

ALTER TABLE `DimProduct` ADD  PRIMARY KEY (`ProductID`)
;



-- Table DimEmployee

CREATE TABLE `DimEmployee`
(
  `EmployeeID` Int NOT NULL,
  `JobTitle` Varchar(40) NOT NULL,
  `SalariedFlag` Bool NOT NULL,
  `CurrentFlag` Bool NOT NULL,
  `FirstName` Varchar(20) NOT NULL,
  `MiddleName` Varchar(20),
  `LastName` Varchar(20) NOT NULL,
  `Title` Varchar(3),
  `Suffix` Varchar(10),
  `Gender` Char(1) NOT NULL,
  `MaritalStatus` Char(1) NOT NULL,
  `NationalIDNumber` Int NOT NULL,
  `EmailAddress` Varchar(40) NOT NULL,
  `EmailPromotion` Int NOT NULL,
  `AddressLine1` Varchar(40) NOT NULL,
  `City` Varchar(20) NOT NULL,
  `StateProvinceName` Varchar(20) NOT NULL,
  `CountryRegionName` Varchar(20) NOT NULL,
  `PostalCode` Int NOT NULL,
  `AddressType` Varchar(20) NOT NULL,
  `PhoneNumber` Varchar(20) NOT NULL,
  `PhoneNumberType` Varchar(20) NOT NULL,
  `HireDate` Date NOT NULL,
  `BirthDate` Date NOT NULL
)
;

ALTER TABLE `DimEmployee` ADD  PRIMARY KEY (`EmployeeID`)
;

ALTER TABLE `DimEmployee` ADD UNIQUE `NationalIDNumber` (`NationalIDNumber`)
;



-- Table DimDate

CREATE TABLE `DimDate`
(
  `Date_SK` Varchar(30) NOT NULL,
  `Date_Value` Datetime NOT NULL
)
;

ALTER TABLE `DimDate` ADD  PRIMARY KEY (`Date_SK`)
;

ALTER TABLE `DimDate` ADD UNIQUE `Date_Value` (`Date_Value`)
;

-- Table FactOrder

CREATE TABLE `FactOrder`
(
  `FactOrderID` Int NOT NULL AUTO_INCREMENT,
  `VendorID` Int NOT NULL,
  `EmployeeID` Int NOT NULL,
  `ProductID` Int NOT NULL,
  `OrderDateKey` Varchar(30) NOT NULL,
  `DueDateKey` Varchar(30) NOT NULL,
  `ShipDateKey` Varchar(30) NOT NULL,
  `PurchaseOrderID` Int NOT NULL,
  `PurchaseOrderDetailID` Int NOT NULL,
  `ShipMethodID` Int NOT NULL,
  `OrderQty` Int NOT NULL,
  `UnitPrice` Float(16,4) NOT NULL,
  `LineTotal` Float(16,4) NOT NULL,
  `SubTotal` Float(16,4) NOT NULL,
  `TaxAmt` Float(16,4) NOT NULL,
  `Freight` Float(16,4) NOT NULL,
  `TotalDue` Double(16,4) NOT NULL,
  `ReceivedQty` Float(12,2) NOT NULL,
  `RejectedQty` Float(12,2) NOT NULL,
  `OrderDate` Datetime NOT NULL,
  `DueDate` Datetime NOT NULL,
  `ShipDate` Datetime NOT NULL,
  `DaysToManufacture` Int NOT NULL,
  `StandardCost` Float(12,4) NOT NULL,
  `ListPrice` Float(16,4) NOT NULL,
  `StockedQty` Int,
  `Weight` Float(12,2),
  `VendorCreditRating` Int NOT NULL,
  `VacationHours` Int NOT NULL,
  `SickLeaveHours` Int NOT NULL,
  `SafetyStockLevel` Int NOT NULL,
  `ReorderPoint` Int NOT NULL,
  PRIMARY KEY (`FactOrderID`)
)
;

CREATE INDEX `IX_Relationship23` ON `FactOrder` (`VendorID`)
;

CREATE INDEX `IX_Relationship24` ON `FactOrder` (`EmployeeID`)
;

CREATE INDEX `IX_Relationship25` ON `FactOrder` (`ProductID`)
;

CREATE INDEX `IX_Relationship26` ON `FactOrder` (`OrderDateKey`)
;

CREATE INDEX `IX_Relationship27` ON `FactOrder` (`DueDateKey`)
;

CREATE INDEX `IX_Relationship28` ON `FactOrder` (`ShipDateKey`)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `FactOrder` ADD CONSTRAINT `VendorID` FOREIGN KEY (`VendorID`) REFERENCES `DimVendor` (`VendorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FactOrder` ADD CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `DimEmployee` (`EmployeeID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FactOrder` ADD CONSTRAINT `ProductID` FOREIGN KEY (`ProductID`) REFERENCES `DimProduct` (`ProductID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FactOrder` ADD CONSTRAINT `OrderDateKey` FOREIGN KEY (`OrderDateKey`) REFERENCES `DimDate` (`Date_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FactOrder` ADD CONSTRAINT `DueDateKey` FOREIGN KEY (`DueDateKey`) REFERENCES `DimDate` (`Date_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FactOrder` ADD CONSTRAINT `ShipDateKey` FOREIGN KEY (`ShipDateKey`) REFERENCES `DimDate` (`Date_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;



