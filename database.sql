create database KjsCompany2
go
use KjsCompany2
go

create table ErrorLogs
(
	Id int identity(1,1) primary key,
	Title nvarchar(max) not null,
	Descript nvarchar(max) null
)

create table CustomerAddresses
(
	Id int identity(1,1) primary key,
	HouseNumber nvarchar(12) not null,
	StreetName nvarchar(64) not null,
	PostCode nvarchar(12) not null,
	City nvarchar(64) not null,
	Country nvarchar(64) not null
)

create table Customers
(
	Id int identity(1,1) primary key,
	Title nvarchar(64) not null,
	Notes nvarchar(max) null,
	IsActive bit not null,
	CreationDate datetime not null,
	ModificationDate datetime not null,
	CompanyName nvarchar(64) null,
	FirstName nvarchar(64) not null,
	SecondName nvarchar(64) not null,
	CustomerAddressId int foreign key references CustomerAddresses,
	PhoneNumber nvarchar(32) not null
)

create table Shippers
(
	Id int identity(1,1) primary key,
	CompanyName nvarchar(64) not null,
	Phone nvarchar(32) not null,
	IsActive bit not null
)

create table Categories
(	
	Id int identity(1,1) primary key,
	CategoryDescription nvarchar(64) not null,
	Picture nvarchar(64) null,
	IsActive bit not null
)

create table SupplierAddresses
(
	Id int identity(1,1) primary key,
	StreetName nvarchar(64) not null,
	PostCode nvarchar(12) not null,
	City nvarchar(64) not null,
	Country nvarchar(64) not null,
	Phone nvarchar(64) not null,
	Fax nvarchar(64) null,
	HomePage nvarchar(64) null,
)


create table Suppliers
(
	Id int identity(1,1) primary key,
	CompanyName nvarchar(64) not null,
	ContactName nvarchar(64) not null,
	ContactTitle nvarchar(64) not null,
	SupplierAddressId int foreign key references SupplierAddresses,
	IsActive bit not null
)

create table QuantityTypes
(
	Id int identity(1,1) primary key,
	title nvarchar(64) not null,
	IsActive bit not null,
	CreationDate datetime not null,
	ModyficationDate datetime not null
)

create table ProductLogs
(
	Id int identity(1,1) primary key,
	LogsDate datetime not null,
	ProductLogDescrition nvarchar(64) not null,
	OldPrice money not null,
	NewPrice money not null,
)

create table Products
(
	Id int identity(1,1) primary key,
	Title nvarchar(64) not null,
	Notes nvarchar(max) null,
	IsActive bit not null,
	CreationDate datetime not null,
	ModificationDate datetime not null,
	ProductName nvarchar(64) not null,
	ProductCode nvarchar(64) not null,
	CategoryId int foreign key references Categories,
	SupplierId int foreign key references Suppliers,
	ProductLogId int foreign key references ProductLogs,
	ActualQuantity decimal not null,
	ActualPrice money not null,
	QuantityType int foreign key references QuantityTypes,
	Discount decimal not null
)

create table PaymentMethods
(
	Id int identity(1,1) primary key,
	Title nvarchar(64) not null,
	IsActive bit not null
)

create table EmployeeAddresses
(
	Id int identity(1,1) primary key,
	Flatnumber nvarchar(12) not null,
	HouseNumber nvarchar(12) not null,
	StreetName nvarchar(64) not null,
	PostCode nvarchar(12) not null,
	City nvarchar(64) not null,
	Country nvarchar(64) not null
)

create table EmployeeAnnualLeaves
(
	Id int identity(1,1) primary key,
	ModificationDate datetime not null,
	StartDate datetime null,
	EndDate datetime null,
	DaysLeft int not null
)

create table Employees
(
	Id int identity(1,1) primary key,
	Title nvarchar(64) not null,
	Notes nvarchar(max) null,
	IsActive bit not null,
	CreationDate datetime not null,
	ModificationDate datetime not null,
	FirstName nvarchar(64) not null,
	LastName nvarchar(64) not null,
	EmployeeAddressId int foreign key references EmployeeAddresses,
	EmployeeAnnualLeave int foreign key references EmployeeAnnualLeaves,
	Phone nvarchar(64) not null,
	HireDate datetime not null,
	JobTitle nvarchar(64) not null
)

create table Orders
(
	Id int identity(1,1) primary key,
	Title nvarchar(64) not null,
	Notes nvarchar(max) null,
	IsActive bit not null,
	CreationDate datetime not null,
	ModificationDate datetime not null,
	CustmerId int foreign key references Customers,
	ShipperId int foreign key references Shippers,
	EmployeeId int foreign key references Employees,
	AddDate datetime not null,
	PricePaid money not null,
	Discount decimal not null
)

create table OrdersPositions
(
	Id int identity(1,1) primary key,
	Tytul nvarchar(64) not null,
	Notatki nvarchar(max) null,
	CzyAktywny bit not null,
	ProductId int foreign key references Products,
	OrderId int foreign key references Orders,
	CenaJednostkowa money not null,
	Ilosc decimal not null
)

create table Invoices
(
	Id int identity(1,1) primary key,
	Title nvarchar(64) not null,
	Notes nvarchar(max) null,
	IsActive bit not null,
	CreationDate datetime not null,
	ModificationDate datetime not null,
	InvoiceNumber nvarchar(64) not null,
	OrderId int foreign key references Orders,
	PaymentMethodId int foreign key references PaymentMethods,
	IsConfirmed bit not null
)

