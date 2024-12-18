--Day 5
----------
--Case Expression & Query Filter , Sort                Done 
--Offset / Fetch  Top ()-->Order Sort                  Done
--Grouping and Aggregating                             Done 
--MAx , Min , SUM , Count , Group By ,                 Done 
--Having                                               Done
--JOIN - RelationShip                                  Done 
--Using DML to Modify Data  Insert , Update , delete   Done
--Create , alter , Drop   GUI                          Done
--Executing Stored Procedures             Done Proc + Dynamic  sp_executesql 
--TVF , View 
---------------------------------------------------------------------
--Merge     
--Using Sub Query                         Done 
--Using Table Expressions                 Done (TVF , View , CTE)             
--Using Set Operators                     Done                 
--Using Window Ranking                    Done
--Writing Queries with PIVOT              Done
--Programming with T-SQL                  While
--Implementing Error Handling
--Implementing Transactions

--Loop 
Declare @x int = 0 ; 
while (@x<=10)
begin 
    print @x
	Set @x = @x+1;
end 




use Northwind 
go 
Create table EmployeesCase
(
ID int identity Primary Key ,
Name nvarchar(50),
Salary decimal(9,2),
Attend bit 
)
go 
insert into EmployeesCase values 
('Ahmed',2000,Null),
('Ali',3000,0),
('Retaj',4000,1),
('Mariam',5000,1),
('sayed',6000,0)

select * from EmployeesCase

Select * ,
Case Attend
When 0 then 'Not Attend'
When 1 Then 'Attend'
else 'Not yet' 
END AS NewAttend,
Case Salary 
When 2000 Then 'badSalary'
else 'Yes'
END As NewSalary
from EmployeesCase



-----------------------------
--Two Forms of CASE Expressions:
--1-Simple CASE
--EX:

select ID, Name , attend , salary
from EmployeesCase

select ID, Name , case  attend 
when 1 then 'attend'
when 0 then 'No attend'
else 'Not Yet'
end as [status Attend]
from EmployeesCase

---------------------------------------------------------------------------
/*
 2) Searched CASE expressions :-
 -------------------------------
 - Allows comparison operators, and the use of AND and/or OR between each Boolean expression. 
-- Searched Case Syntax :- 
-------------------------
     CASE
	 WHEN Boolean_expression1 THEN expression1
     [[WHEN Boolean_expression2 THEN expression2] [...]] 
     [ELSE expressionN] 
	 END
*/
--2-Searched CASE (with conditions or predicates)
--EX:
select ID , Name ,Salary from EmployeesCase 

select ID , Name ,  Salary  , 
case 
when salary >1000 AND salary <=2000  then 'Low'
when salary >2000 and salary <=3000 then 'medium'
else 'high'
end  As [salary range]
from EmployeesCase



Select country from Employees
UNION 
Select country from Customers

Select country From Employees 
EXCEPT
Select country From Customers

Select country From Customers 
EXCEPT
Select country From Employees 

Select country From Employees
INTERSECT 
Select country From Customers;


