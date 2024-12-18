--SORTING AND FELTRING DATA



-- 1-Concatrenation
USE Northwind
SELECT FirstName + ' ' + LastName AS FullName
FROM Employees;
GO

--ADDING CUSTOM STRING TO A COLUMN VALUE
SELECT 'ID-' + CustomerID AS PrefixedCustomerID
FROM Customers;

--Conncatenating Address field
SELECT CompanyName, 
       Address + ', ' + City + ', ' + ISNULL(Region, 'TOMOCA') + ', ' + PostalCode + ', ' + Country AS FullAddress
FROM Customers;

--Concatinate with conditional logi using case expression
	select * from Employees
	SELECT (
		CASE TitleOfCourtesy
			WHEN 'Ms.' THEN 'Manager Service'
			WHEN 'Dr.' THEN 'Directive Retriver'
			WHEN 'Mrs.' THEN 'Manager Retriver Service'
			ELSE 'Un Recoreded role'
		END
	) +' '+ FirstName + ' ' + LastName AS FormalName
	FROM Employees;
	GO

--Concatenating and Formatting Dates
--Sometimes you might want to concatenate and format dates. 
--Here's an example that concatenates the employee name with their birthdate in a specific format:
SELECT FirstName + ' ' + LastName + ' was born on ' +CONVERT(VARCHAR , BirthDate, 101) AS "E.BIRTHINFOS"
FROM Employees