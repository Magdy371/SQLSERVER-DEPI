-- 1. Basic String Comparison using = Operator
USE Northwind
SELECT City, FormalTitle =
	(CASE ContactTitle
		WHEN 'Sales Representative' THEN 'SR: '
		WHEN 'Sales Agent' THEN 'SA: '
		WHEN 'Sales Associate' THEN 'SAS: '
		WHEN 'Sales Manager' THEN 'SM: '
		ELSE 'Customer'
	END) + CompanyName + ContactTitle
FROM Customers
WHERE City = 'London';
GO

---------------------------------------------------------------------------------------


--USING LIKE KEYWORD
SELECT CustomerID, CompanyName, City
FROM Customers
WHERE CompanyName LIKE 'A%';
GO

--USING NOT LIKE
SELECT CustomerID, CompanyName, City
FROM Customers
WHERE CompanyName NOT LIKE '%a%';

--Focusing on like operations
--Using Wildcards %
--%: Represents zero or more characters.
--_: Represents a single character.

--Find all customers whose CompanyName contains the letter 'a'.
SELECT CompanyName 
FROM Customers
where CompanyName LIKE '%a%';
GO

--Find all customers whose CompanyName has 'a' as the second character.
SELECT CompanyName 
FROM Customers
WHERE CompanyName LIKE '_a%';
GO

--Combining LIKE with Other Conditions
--Find all customers from 'London' whose CompanyName starts with 'A'.
SELECT CompanyName , ContactName 
FROM Customers
WHERE City = 'London' and CompanyName LIKE '%A%';
GO

--CASE SENSETIVE SEARCH
--Using COLLATE to perform case-insensitive searches.
--Find all customers whose CompanyName starts with 'a' (case-insensitive).
SELECT CustomerID, CompanyName, City 
FROM Customers 
WHERE CompanyName COLLATE SQL_Latin1_General_CP1_CI_AS LIKE 'A%';
GO

SELECT ProductName , UnitPrice 
FROM Products


--find all products whose ProductName ends with 'FU'.
SELECT ProductName , UnitPrice 
FROM Products
WHERE ProductName LIKE '%FU';
GO

--Last collection
SELECT * FROM  Employees where FirstName like 'a[d,n]%' ;   --and 
go
SELECT * FROM  Employees where FirstName like 'an[d-n]%'   -- to 
SELECT * FROM  Employees where FirstName like 'an[^d]%'
SELECT * FROM  Employees where FirstName like 'a[^d-n]%'
SELECT * FROM  Employees where LastName like 'd%o'             
SELECT CompanyName FROM Customers WHERE CompanyName NOT LIKE 'A_[f,t]%'

--FILTERING AND ORDER BY
USE northwind
SELECT TOP 5 orderid,productid ,quantity
FROM [order details]
ORDER BY quantity desc
GO
