--Create DataBase 
Create Database Day3Db
GO
Use Day3Db
GO
--------------------
--boolean True / false 
--DDL (Create , alter , Drop )   Database , table , Data Type Columns
Create Table Employees (ID int Primary Key Identity,
                        FirstName nvarchar(150) Not null,
						LastName nvarchar(100) Not Null,
						email varchar(150) Not NULL,
						Salary decimal(7,2),
						Gender nvarchar(10),  --0 For Male 1 For Femaile
						IsAttend bit ) --0,1 default(0)

--DML (Insert , Update , Delete , Select )
Select * from employees

Insert into Employees (FirstName,LastName,email, Salary , Gender , IsAttend) 
Values ('Sayed','Hawas','Some@yahoo.com',15000,'Male',1)

Insert into Employees (FirstName,LastName,email) 
Values ('Retaj','Hawas','Some@yahoo.com')

Insert into Employees Values ('Mariam','Hawas','Some@yahoo.com',15000,'female',0)
GO
Insert into Employees Values ('Mariam','Hawas','Some@yahoo.com',15000,'female',0)
,('Ahmed','Hawas','Some@yahoo.com',15000,'female',0)
,('Ali','Hawas','Some@yahoo.com',15000,'female',0)
,('Osama','Hawas','Some@yahoo.com',15000,'female',0)

----------------------------------------------
Update Employees Set Salary=20000 , Gender = 'Female' , IsAttend = 1 Where ID =2
Delete From Employees  --OOPS
--DML  Delete Data 
Delete From Employees Where ID = 14  --- Phy Delete ->  Soft Delete 
--DDL  --> Reset Table 
truncate table Employees
--DDL Delete table as structure 
Drop table Employees


Declare @x int = 100
Set @x = 1000;
Select len(@x),@x

Select @x

Select 5+10
Select 10/5
Select 5*10
Select 5-10
Select @@version

--------------------------------------------
--Select 
Use Northwind
GO
Select * from Employees 
Select Region from Employees



Select FirstName , LastName , FirstName + ' ' + LastName  As FullName from Employees

Select FirstName , LastName , FirstName + ' ' + LastName  As FullName 
,Country + ' ' + City +' '+ ISNULL(region,' ')+' ' + Address As FullAddress
from Employees

GO
Select region , ISNULL(region,' No Region ') As[NEW Region]  from Employees
------------------------------------------------------------------------
--Filter 
Select * from Employees Where EmployeeID = 1


Select * from Employees Where EmployeeID > 5

Select * from Employees Where EmployeeID >= 5

Select * from Employees Where EmployeeID < 5

Select * from Employees Where EmployeeID <= 5

Select * from Employees Where EmployeeID <> 5

Select * from Employees Where EmployeeID  = 4 OR EmployeeID  = 5 OR EmployeeID  = 6
Select * from Employees Where EmployeeID in (4,5,6)
Select * from Employees Where EmployeeID between 4 AND 6
Select * from Employees Where EmployeeID <=6  AND  EmployeeID >=4

Select * from Employees Where HireDate >='1993-01-01' AND HireDate <= '1993-10-31' 
Select * from Employees Where HireDate between '1993-01-01' AND  '1993-10-31' 

Select * from Employees Where FirstName ='steven'

Select * from Employees Where FirstName LIKE 'M%' -- start With 

Select * from Employees Where FirstName LIKE '%t'  --End With 

Select * from Employees Where FirstName LIKE '%e%'  

Select * from Employees Where FirstName LIKE '_a%'  

----% 
----_
--Anne


Select Distinct Country from Employees

Select Distinct Country from Customers
