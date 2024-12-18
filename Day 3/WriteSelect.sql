--USING CALCULATIONS IN SELECT
SELECT 10+5 AS AddNumbers
SELECT 10*5 AS MulNumbers
SELECT 10/5 AS DivNumbers
GO;

-- Basic Select statement
-- ----------------------
-- A basic SELECT statement only requires two parts: 
-- A select list of columns to show  
-- A FROM clause indicating the table that holds the data.

USE Northwind
SELECT * FROM Employees;
GO

select FirstName ,LastName, City
from Employees;
Go


--USING ALISASES
SELECT EmployeeID , FirstName+' '+LastName AS FullName 
from Employees;
GO
--OR
SELECT EmployeeID , FirstName+' '+LastName FullName 
from Employees;
 --OR
SELECT EmployeeID , FullName = (FirstName+' '+LastName) 
from Employees;


--USING BULTIN FUNCTIONS
SELECT EmployeeID, FirstName+' '+LastName AS FullName, 
YEAR(HireDate) AS HIREDYEAR 
FROM Employees;
GO

SELECT GETDATE() AS "Full Date"
SELECT YEAR(GETDATE())AS "The Year"
SELECT MONTH(GETDATE()) AS "The Month"
GO

--Removing duplicates
SELECT Country FROM Customers;
GO
--OR
SELECT ALL Country FROM Customers;
GO
 --TO REMOVE DUPLICATES
 --WE USE DISTINCT KEYWORD
 SELECT DISTINCT Country FROM Customers;
 GO

SELECT DISTINCT title,city 
From Employees ;
GO


--USING ALISASES TO REFER TO A TABLE
SELECT Products.CategoryID , Products.ProductName, Products.Discontinued
FROM Products

--OR
SELECT P.CategoryID AS CATID, P.ProductName AS PRON, P.Discontinued AS NOTDIS
FROM Products AS P


--WRITING SIMPLE CASE EXPRESSIONS
/*
a simple case expression is:
	a way to provide if-then-else type logic
	to sql queries.
	it allows you to return different values based on certain
	conditions.
	The syntax is straightforward and useful for transforming data and
	adding logical control within your SQL statements.
*/
SELECT "Fuul Name" = FirstName + ' '+LastName, Country, 
"Country Name" =
	CASE Country
		WHEN 'UK' THEN 'UNITED KINGDOM'
		WHEN 'USA'THEN 'UNITES STATES'
		ELSE 'UN REGISTERD COUNTRY'
	END
FROM Employees;
GO

/*
SEARCHED CASE EXPRESSION:
	A searched CASE expression in SQL allows for more complex conditional logic 
	by using Boolean expressions instead of simple comparisons. 
	This type of CASE expression provides greater flexibility and can handle a wider range of conditions.
*/



SELECT ProductID, ProductName, UnitPrice, "Price Range" = 
	CASE 
		 WHEN unitPrice =  0 THEN 'item - not for resale'
         WHEN unitPrice < 50 THEN 'Under $50'
         WHEN unitPrice >= 50 and unitPrice < 250 THEN 'Under $250'
         WHEN unitPrice >= 250 and unitPrice < 1000 THEN 'Under $1000'
         ELSE 'Over $1000'
	END
FROM Products;
GO


SELECT EmployeeID, FullName = (FirstName + ' ' + LastName), ReportsTo, "# Leaders"=
	CASE
		WHEN ReportsTo = 1 THEN 'GENERAL MANGER'
		WHEN ReportsTo = 2 OR ReportsTo = 3 THEN 'HEAD OF DEPARTMENT'
		WHEN ReportsTo  = 4                      THEN 'High Employee'
        WHEN ReportsTo  = 5                      THEN  'this is Developer'
		ELSE 'Office Boy'
	END
FROM Employees;