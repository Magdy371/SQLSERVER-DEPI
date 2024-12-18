Create View Vw_ShowOrder
As
Select O.OrderID ,o.OrderDate,concat(e.FirstName ,' ', e.LastName)As FullName ,
C.CompanyName,
P.ProductName, Ca.CategoryName,
s.CompanyName as SupplierName,
OD.Quantity, OD.UnitPrice
From Orders as O Join [Order Details] as od 
On o.OrderID = Od.OrderID JOIN Employees as E
ON e.EmployeeID = O.EmployeeID Join Customers as C 
ON C.CustomerID = O.CustomerID Join Products as P 
ON P.ProductID = Od.ProductID Join Categories as Ca
ON Ca.CategoryID = P.CategoryID Join Suppliers as S 
ON s.SupplierID = P.SupplierID
