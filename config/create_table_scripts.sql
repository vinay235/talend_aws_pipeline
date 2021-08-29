drop table if exists dimcurrency cascade;
drop table if exists DimDate cascade; 
drop table if exists DimPromotion cascade; 
drop table if exists DimCustomer cascade; 
drop table if exists DimGeography cascade;  
drop table if exists DimProduct cascade; 
drop table if exists DimProductCategory cascade; 
drop table if exists DimProductSubcategory cascade;
drop table if exists FactInternetSales cascade; 
drop table if exists FactInternetSalesReason cascade;

CREATE TABLE IF NOT EXISTS  DimDate(
	DateKey int NOT NULL,
	FullDateAlternateKey date NOT NULL,
	DayNumberOfWeek smallint NOT NULL,
	EnglishDayNameOfWeek varchar(10) NOT NULL,
	SpanishDayNameOfWeek varchar(10) NOT NULL,
	FrenchDayNameOfWeek varchar(10) NOT NULL,
	DayNumberOfMonth smallint NOT NULL,
	DayNumberOfYear smallint NOT NULL,
	WeekNumberOfYear smallint NOT NULL,
	EnglishMonthName varchar(10) NOT NULL,
	SpanishMonthName varchar(10) NOT NULL,
	FrenchMonthName varchar(10) NOT NULL,
	MonthNumberOfYear smallint NOT NULL,
	CalendarQuarter smallint NOT NULL,
	CalendarYear smallint NOT NULL,
	CalendarSemester smallint NOT NULL,
	FiscalQuarter smallint NOT NULL,
	FiscalYear smallint NOT NULL,
	FiscalSemester smallint NOT NULL,
	load_time timestamp, primary key (DateKey)
	);
	
	
CREATE TABLE IF NOT EXISTS  DimPromotion(
	PromotionKey int  NOT NULL,
	PromotionAlternateKey int NULL,
	EnglishPromotionName varchar(255) NULL,
	SpanishPromotionName varchar(255) NULL,
	FrenchPromotionName varchar(255) NULL,
	DiscountPct float NULL,
	EnglishPromotionType varchar(50) NULL,
	SpanishPromotionType varchar(50) NULL,
	FrenchPromotionType varchar(50) NULL,
	EnglishPromotionCategory varchar(50) NULL,
	SpanishPromotionCategory varchar(50) NULL,
	FrenchPromotionCategory varchar(50) NULL,
	StartDate timestamp NOT NULL,
	EndDate timestamp NULL,
	MinQty int NULL,
	MaxQty int NULL,
	load_time timestamp, primary key(PromotionKey));
	
CREATE TABLE IF NOT EXISTS  DimCustomer(
	CustomerKey int  NOT NULL,
	GeographyKey int NULL,
	CustomerAlternateKey varchar(15) NOT NULL,
	Title varchar(8) NULL,
	FirstName varchar(50) NULL,
	MiddleName varchar(50) NULL,
	LastName varchar(50) NULL,
	NameStyle char NULL,
	BirthDate date NULL,
	MaritalStatus nchar(1) NULL,
	Suffix varchar(10) NULL,
	Gender varchar(1) NULL,
	EmailAddress varchar(50) NULL,
	YearlyIncome decimal(15,2) NULL,
	TotalChildren smallint NULL,
	NumberChildrenAtHome smallint NULL,
	EnglishEducation varchar(40) NULL,
	SpanishEducation varchar(40) NULL,
	FrenchEducation varchar(40) NULL,
	EnglishOccupation varchar(100) NULL,
	SpanishOccupation varchar(100) NULL,
	FrenchOccupation varchar(100) NULL,
	HouseOwnerFlag nchar(1) NULL,
	NumberCarsOwned smallint NULL,
	AddressLine1 varchar(120) NULL,
	AddressLine2 varchar(120) NULL,
	Phone varchar(20) NULL,
	DateFirstPurchase date NULL,
	CommuteDistance varchar(15) NULL,
    load_time timestamp, primary key(CustomerKey));
	

CREATE TABLE IF NOT EXISTS  DimGeography(
	GeographyKey int  NOT NULL,
	City varchar(30) NULL,
	StateProvinceCode varchar(3) NULL,
	StateProvinceName varchar(50) NULL,
	CountryRegionCode varchar(3) NULL,
	EnglishCountryRegionName varchar(50) NULL,
	SpanishCountryRegionName varchar(50) NULL,
	FrenchCountryRegionName varchar(50) NULL,
	PostalCode varchar(15) NULL,
	SalesTerritoryKey int NULL,
	IpAddressLocator varchar(15) NULL,
    load_time timestamp, primary key (GeographyKey));


 
CREATE TABLE IF NOT EXISTS  DimCurrency(
	CurrencyKey int  NOT NULL,
	CurrencyAlternateKey nchar(3) NOT NULL,
	CurrencyName varchar(50) NOT NULL,
	load_time timestamp, primary key (CurrencyKey));
 
CREATE TABLE IF NOT EXISTS  DimProduct(
	ProductKey int  NOT NULL,
	ProductAlternateKey varchar(25) NULL,
	ProductSubcategoryKey int NULL,
	WeightUnitMeasureCode nchar(3) NULL,
	SizeUnitMeasureCode nchar(3) NULL,
	EnglishProductName varchar(50) NOT NULL,
	SpanishProductName varchar(50) NOT NULL,
	FrenchProductName varchar(50) NOT NULL,
	StandardCost decimal(15,2) NULL,
	FinishedGoodsFlag char NOT NULL,
	Color varchar(15) NOT NULL,
	SafetyStockLevel smallint NULL,
	ReorderPoint smallint NULL,
	ListPrice decimal(15,2) NULL,
	Size varchar(50) NULL,
	SizeRange varchar(50) NULL,
	Weight float NULL,
	DaysToManufacture int NULL,
	ProductLine nchar(2) NULL,
	DealerPrice decimal(15,2) NULL,
	Class nchar(2) NULL,
	Style nchar(2) NULL,
	ModelName varchar(50) NULL,
	LargePhoto varchar(65000) NULL,
	EnglishDescription varchar(400) NULL,
	FrenchDescription varchar(400) NULL,
	ChineseDescription varchar(400) NULL,
	ArabicDescription varchar(400) NULL,
	HebrewDescription varchar(400) NULL,
	ThaiDescription varchar(400) NULL,
	GermanDescription varchar(400) NULL,
	JapaneseDescription varchar(400) NULL,
	TurkishDescription varchar(400) NULL,
	StartDate timestamp NULL,
	EndDate timestamp NULL,
	Status varchar(7) NULL,
	load_time timestamp, primary key (ProductKey));
 

CREATE TABLE IF NOT EXISTS  DimProductCategory(
	ProductCategoryKey int  NOT NULL,
	ProductCategoryAlternateKey int NULL,
	EnglishProductCategoryName varchar(50) NOT NULL,
	SpanishProductCategoryName varchar(50) NOT NULL,
	FrenchProductCategoryName varchar(50) NOT NULL,
	load_time timestamp, primary key (ProductCategoryKey));
 
 
CREATE TABLE IF NOT EXISTS  DimProductSubcategory(
	ProductSubcategoryKey int  NOT NULL,
	ProductSubcategoryAlternateKey int NULL,
	EnglishProductSubcategoryName varchar(50) NOT NULL,
	SpanishProductSubcategoryName varchar(50) NOT NULL,
	FrenchProductSubcategoryName varchar(50) NOT NULL,
	ProductCategoryKey int NULL,
	load_time timestamp, primary key (ProductSubcategoryKey));
 

CREATE TABLE IF NOT EXISTS  FactInternetSales(
	ProductKey int NOT NULL,
	OrderDateKey int NOT NULL,
	DueDateKey int NOT NULL,
	ShipDateKey int NOT NULL,
	CustomerKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	SalesTerritoryKey int NOT NULL,
	SalesOrderNumber varchar(20) NOT NULL,
	SalesOrderLineNumber smallint NOT NULL,
	RevisionNumber smallint NOT NULL,
	OrderQuantity smallint NOT NULL,
	UnitPrice decimal(15,2) NOT NULL,
	ExtendedAmount decimal(15,2) NOT NULL,
	UnitPriceDiscountPct float NOT NULL,
	DiscountAmount float NOT NULL,
	ProductStandardCost decimal(15,2) NOT NULL,
	TotalProductCost decimal(15,2) NOT NULL,
	SalesAmount decimal(15,2) NOT NULL,
	TaxAmt decimal(15,2) NOT NULL,
	Freight decimal(15,2) NOT NULL,
	CarrierTrackingNumber varchar(25) NULL,
	CustomerPONumber varchar(25) NULL,
	OrderDate timestamp NULL,
	DueDate timestamp NULL,
	ShipDate timestamp NULL,
	load_time timestamp, primary key(SalesOrderNumber),
	foreign key(CurrencyKey) references DimCurrency(CurrencyKey),
	foreign key(CustomerKey) references DimCustomer(CustomerKey),
	foreign key(OrderDateKey) references DimDate(DateKey),
	foreign key(DueDateKey) references DimDate(DateKey),
	foreign key(ShipDateKey) references DimDate(DateKey),
	foreign key(ProductKey) references DimProduct(ProductKey),
	foreign key(PromotionKey) references DimPromotion(PromotionKey)
	);
	
CREATE TABLE IF NOT EXISTS  FactInternetSalesReason(
	SalesOrderNumber varchar(20) NOT NULL,
	SalesOrderLineNumber smallint NOT NULL,
	SalesReasonKey int NOT NULL,
	load_time timestamp,
	foreign key(SalesOrderNumber) references FactInternetSales(SalesOrderNumber));
