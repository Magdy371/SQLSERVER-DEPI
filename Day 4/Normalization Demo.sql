--Normal Forms
--1NF , 2NF, 3NF and 4NF
--------------------------
 --Orders Details 
 --Sales Records :-
 ------------------
 /*
 Customer Name 
 Item
 Shipping address 
 ItemDescription 
 Supplier 
 SupplierPhone
 Price
 */
 create database NormalizationDB
 go 
 use NormalizationDB
 go 
 
 create table SalesRecord (customerName nvarchar(50),
                            Item nvarchar(50),
							ShippingAddress nvarchar(50),
							ItemDescription nvarchar(50),
							Supplier nvarchar(50),
							SupplierPhone varchar(20),
							Price decimal(9,2));
go
insert into SalesRecord values ('Sayed','xbox','35 st, Miami','XBox new ','Microsoft','800-234333',5000),
                               ('retaj','PlayStation4','80 st, alex','PlayStation new ','Sony','800-255433',6000),
							   ('Sayed','PlayStation4','35 st, Cairo','PlayStation new ','Microsoft','800-2434333',7000),
							   ('Mariam','XBox One , Ps vita ','35 st, Mansoura','XBox new ','Sony','800-333933',7000)

  go
  /**************************
    1st Normal Form
	----------------
	-Each cell to be single valued 
	-Entries in a column are same type 
	-Rows Uniquely identified - Add Unique Id m Or Add More columns to make unique
	(Note: the Order of the Rows and the Order of the columns are irrelevant)
  */

  go
  create table SalesRecord1NF ( CustomerId  int identity primary Key  ,customerName nvarchar(50),
                            Item nvarchar(50),
							ShippingAddress nvarchar(50),
							ItemDescription nvarchar(50),
							Supplier nvarchar(50),
							SupplierPhone varchar(20),
							Price decimal(9,2));
go
insert into SalesRecord1NF values ('Sayed','xbox','35 st, Miami','XBox new ','Microsoft','800-234333',5000),
                               ('retaj','PlayStation4','80 st, alex','PlayStation new ','Sony','800-255433',6000),
							   ('Sayed','PlayStation4','35 st, Cairo','PlayStation new ','Microsoft','800-2434333',7000),
							   ('Mariam','XBox One ','35 st, Mansoura','XBox new ','Sony','800-255433',4000),
							   ('Mariam',' Ps vita ','35 st, Mansoura','XBox new ','Sony','800-255433',3000)

go
select * from SalesRecord
select * from SalesRecord1NF

--What the RelationShip Between the CustomerID And Price  OOP ? Not RelationShip 

/**************************
    2st Normal Form
	----------------
	-Must Sure Make the 1st Normal Form 
	-All attributes (Non-Key columns )dependent on the key 

  */
   create table Customers2NF ( CustomerId  int identity primary Key  ,
                                customerName nvarchar(50),
							    ShippingAddress nvarchar(50));

 go
insert into Customers2NF values ('Sayed','5 st, Miami'),
                                  ('retaj','80 st, alex'),
							      ('Sayed','35 st, Cairo'),
							      ('Mariam','35 st Mansoura')
go
  Create table Items2NF (itemId  int identity primary Key  ,ItemName nvarchar(50),
                                ItemDescription nvarchar(50),       
                                Supplier nvarchar(50),
							    SupplierPhone varchar(20),
							    Price decimal(9,2))

 go

insert into Items2NF values ('XBox','XBox new ','Microsoft','800-234333',5000),
                               ('PlayStation3','PlayStation new ','Sony','800-255433',6000),
							   ('PlayStation4','PlayStation new ','Sony','800-255433',7000),
							   (' Ps vita ','PS old ','Sony','800-255433',4000)
select * from Customers2NF
select * from Items2NF	
------------------------------------------------------------
--Where the Orders (transaction)
/**************************
    3st Normal Form
	---------------
	All fields (Columns) can be determind Only by the key in the table and no other column 
*/
Create table Orders3NF (CustomerId  int,  
                         ItemId int,
                         DateOrder Date,
						 Constraint Pk_Orders Primary key (CustomerId,ItemId),
						 Constraint FK_CustomerId_Customers foreign key (CustomerId) References Customers2NF(CustomerID),
						 Constraint FK_ItemId_items foreign key (ItemId) References Items2NF(ItemID)
						 )

go 
insert into Orders3NF values(1,1, getdate()),
                            (2,1,getdate()),
							(3,1,getdate()),
							(3,2,getdate()),
							(4,1,getdate())
go
select * from Customers2NF
select * from Items2NF
select * from Orders3NF

---Problem the Supplier & SupplierPhone
---All fields (Columns) can be determind Only by the key in the table and no other column 
go
 create table Customers3NF ( CustomerId  int identity primary Key ,
                             customerName nvarchar(50),
							 ShippingAddress nvarchar(50));

 go
insert into Customers3NF values ('Sayed','5 st, Miami'),
                                  ('retaj','80 st, alex'),
							      ('Sayed','35 st, Cairo'),
							      ('Mariam','35 st Mansoura')
go 
create table Supplier3NF(SupplierID int primary key , 
                         SupplierName nvarchar(50),
						 SupplierPhone varchar(20))
go 
insert into Supplier3NF values (1,'Microsoft','800-234333'),(2,'Sony','800-255433')
                                
go 

Create table Items3NF (itemId  int identity primary Key  ,ItemName nvarchar(50),
                       ItemDescription nvarchar(50),       
                       SupplierID int ,
					   Price decimal(9,2),
					   Constraint FK_itemsId_supplier foreign key (SupplierID) References Supplier3NF(SupplierID))
 go

insert into Items3NF values ('XBox','XBox new ',2,5000),
                               ('PlayStation3','PlayStation new ',1,6000),
							   ('PlayStation4','PlayStation new ',1,7000),
							   (' Ps vita ','PS old ',2,4000)
select * from Customers3NF
select * from Items3NF	
select * from Supplier3NF
select * from Orders3NF
/**************************
    4st Normal Form
	---------------
	No multi-valued dependencies
*/
--??? Shipping address ? in Customers 
create table Customers4NF ( CustomerId  int identity primary Key ,
                             customerName nvarchar(50));

 go
insert into Customers4NF values ('Sayed'),('retaj'),('Sayed'),('Mariam')
go 
create table Shipping4NF (shippingID  int identity primary Key ,
                           customerID int,
						   ShippingAddress nvarchar(50),
						   Constraint FK_customerID_Shipping foreign key (customerID) References customers3NF(customerID));
go
insert into Shipping4NF values (1,'5 st, Miami') ,
                                  (2,'80 st, alex'),
							      (3,'35 st, Cairo'),
							      (4,'35 st Mansoura'),
								  (1,'120 st Cairo')

go 
create table Supplier4NF(SupplierID int primary key , 
                         SupplierName nvarchar(50),
						 SupplierPhone varchar(20))
go 
insert into Supplier4NF values (1,'Microsoft','800-234333'),(2,'Sony','800-255433')
                                
go 

Create table Items4NF (itemId  int identity primary Key  ,ItemName nvarchar(50),
                       ItemDescription nvarchar(50),       
                       SupplierID int ,
					   Price decimal(9,2),
					   Constraint FK_itemsId_supplier4 foreign key (SupplierID) References Supplier3NF(SupplierID))
 go

insert into Items4NF values ('XBox','XBox new ',2,5000),
                            ('PlayStation3','PlayStation new ',1,6000),
							('PlayStation4','PlayStation new ',1,7000),
							(' Ps vita ','PS old ',2,4000)
go
Create table Orders4NF (CustomerId  int,  
                         ItemId int,
                         DateOrder Date,
						 Constraint Pk_Orders4 Primary key (CustomerId,ItemId),
						 Constraint FK_CustomerId_Customers4 foreign key (CustomerId) References Customers2NF(CustomerID),
						 Constraint FK_ItemId_item4s foreign key (ItemId) References Items2NF(ItemID)
						 )

go 
insert into Orders4NF values(1,1, getdate()),
                            (2,1,getdate()),
							(3,1,getdate()),
							(3,2,getdate()),
							(4,1,getdate())
go
select * from Customers4NF
select * from Items4NF	
select * from Orders4NF
select * from Supplier4NF
select * from Shipping4NF

