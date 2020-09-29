SELECT * FROM StudentTotalMarks

WITH MarksCTE(StudentName,Percentage,TotalObtained) AS
( SELECT StudentName,
	(CAST(MarksObtained AS float)/ CAST(TotalMarks AS float)*100) Percentage,
	 MarksObtained
  FROM StudentTotalMarks
)
SELECT * FROM MarksCTE

SELECT * FROM EmployeeDuplicate

WITH DuplicateCTE(EmpID,EmpName,Department,RowID) AS
(
SELECT EmpID,
	EmpFirstname+''+EmpLastName as EmpName,
	Department, 
	ROW_NUMBER()OVER(PARTITION BY EmpFirstname,EmpLastName,
						Department ORDER BY EmpID)AS RowID
FROM EmployeeDuplicate
)
DELETE FROM DuplicateCTE WHERE RowID>1

Select * from DuplicateCTE

The query below creates a temporary result set as :
SELECT Eid,Ename,Dept, ROW_NUMBER()OVER(PARTITION BY Ename,Dept ORDER BY EID)AS RowID
FROM EMP

Select * from EmployeeDetails
Select * from EmpSalary
Select * from EmployeeProject

WITH EmployeeCTE(EmpID,EmpName,Department,DepartID,EmpSalary,Count) 
AS(
SELECT E.EmpID,
		S.EmpFullName,
		E.Department,
		E.DepartID,
		S.EmpSalary,
		1
FROM EmployeeDetails E inner join EmpSalary S 
on E.EmpID = S.EmpID
UNION ALL
SELECT S.EmpID,S.EmpFullName,E.Department,E.DepartID,S.EmpSalary,c.count +1 
from EmployeeDetails E inner join EmpSalary S
on S.DepartID = E.DepartID 
and S.EmpID = E.EmpID
inner join EmployeeCTE C
on C.EmpID = S.EmpID
)
Select EmpID,EmpName,Department,DepartID,EmpSalary,COUNT
 from EmployeeCTE C where Department in ('IT','Accounts') ;
 
 ------------------------------------------------------------------
 
 WITH EmployeeCTE(EmpID,EmpName,DepartID,EmpSalary) 
AS(
 SELECT S.EmpID,
		S.EmpFullName,
		S.DepartID,
		S.EmpSalary
FROM  EmpSalary S 
UNION ALL
SELECT S.EmpID,S.EmpFullName,E.DepartID,S.EmpSalary
FROM EmployeeDetails E INNER JOIN EmpSalary S
ON S.DepartID = E.DepartID  
INNER JOIN EmployeeCTE C ON E.EmpID = C.EmpID
)
SELECT EmpID,EmpName,DepartID,EmpSalary
 FROM EmployeeCTE    ;
 
 
 Select * from EmpSalary
 SELECT S.EmpID,
		S.EmpFullName,
		S.DepartID,
		S.EmpSalary
FROM  EmpSalary S 
UNION ALL
SELECT S.EmpID,S.EmpFullName,E.DepartID,S.EmpSalary
from EmployeeDetails E inner join EmpSalary S
on S.DepartID = E.DepartID 
and S.EmpID = E.EmpID

SELECT * FROM EmployeeDetails


Alter table EmployeeDetails
add ManagerID int
Insert into EmployeeDetails 
values (1006,'Chris','Berg','IT',2,10)
 Update EmployeeDetails
 set ManagerID = 1005
 where EmpID in (1003,1004) 2
 -----------------------------------------
 WITH
  EmployeeCTE (EmpID, FirstName, LastName, ManagerID,Department, EmpLevel)
  AS
  (
    SELECT EmpID, EmpFirstName, EmpLastName, ManagerID, Department, 1
    FROM EmployeeDetails
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT E.EmpID,E.EmpFirstName,E.EmpLastName,E.ManagerID, E.Department,
         C.EmpLevel + 1
    FROM EmployeeDetails E
      INNER JOIN EmployeeCTE C
        ON E.ManagerID = C.EmpID
  )
SELECT
  FirstName ,LastName,EmpLevel,Department,
  (SELECT EmpFirstName + ' ' + EmpLastName FROM EmployeeDetails
    WHERE EmpID = EmployeeCTE.ManagerID) AS Manager
FROM EmployeeCTE
ORDER BY EmpLevel, ManagerID


GO

USE AdventureWorks2012
GO 

WITH VendorCTE AS
        (SELECT  VendorID, SUM(TotalDue) AS TotalDue 
	        FROM Purchasing.PurchaseOrderHeader PH
	        JOIN Purchasing.PurchaseOrderDetail PD
	        ON PH.PurchaseOrderID  = PD.PurchaseOrderID	        
	        GROUP BY VendorID)
            
            SELECT	V.AccountNumber, V.Name, VC.SumTotalDue  
                FROM VendorCTE VC
                JOIN Purchasing.Vendor V
	                ON V.BusinessEntityID = VC.VendorID
                ORDER BY TotalDue DESC


GO


USE Northwind
GO

WITH OrderCTE
(  CustomerID, CompanyName, ContactName, City, OrderID, OrderDate, ShippedDate)
AS 
(
SELECT  C.CustomerID, CompanyName, ContactName, City, OrderID, OrderDate, ShippedDate
FROM Orders O JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.CustomerID = 'ALFKI'
),
 OrderDetailsCTE
( OrderID, ProductID, ProductName, UnitPrice, Quantity)
AS
(
	SELECT OD.OrderID, P.ProductID, ProductName, OD.UnitPrice, Quantity 
	FROM Products P JOIN [Order Details] OD ON P.ProductID = OD.ProductID	
)
SELECT * FROM OrderCTE O 
JOIN OrderDetailsCTE OD ON O.OrderID = OD.OrderID

GO