/*
Declaring variables
*/

Declare @Myvar int
Set @Myvar = 40
Select @Myvar as ResultMyVar
GO
--OR

Declare @MVar int = 30
Select @MVar as SecondVar
GO
--Example Of Bult in functions
SELECT GETDATE() AS WhatTimeIsNow
GO

--Examples of Operators
USE Northwind
SELECT * FROM Employees WHERE EmployeeID > 2
GO

--EXAMPLES OF PREDICATES
SELECT * FROM Employees WHERE FirstName LIKE '%A%'
GO

SELECT * FROM Employees WHERE City IN ('London' , 'Seattle' , 'Tacoma')
GO

--EXAMPLE OF LOGICAL QUERY PROCESSING
SELECT EmployeeID, YEAR(OrderDate) As OrderYear--5 
FROM Orders                       --1
WHERE CustomerID = 'TOMSP'        --2
GROUP BY EmployeeID  ,OrderDate   --3
Having Count(*) >=1               --4
Order by EmployeeID , OrderDate   --6
GO

SELECT * FROM Orders

