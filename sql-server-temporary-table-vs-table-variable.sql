CREATE TABLE ##temp_Employee
(
 EmpID int,
 EmpFullName varchar(100),
 Designation Varchar(50)
)

INSERT INTO ##temp_Employee
 VALUES (1001,'Spence Huge','IT Manager')
 INSERT INTO ##temp_Employee
 VALUES (1002,'Mellisa Karl','Accountant')
 
 SELECT * FROM ##temp_Employee
 
 -- Local Temporary Tables

CREATE TABLE #temp_Students
(
StudentName varchar(100),
Stream Varchar(20),
TotalMarks int
)

INSERT INTO #temp_Students
 VALUES ('Rakhi Sharma','Science',450)
 INSERT INTO #temp_Students
 VALUES ('Veer Khanna','Accounts',430)

 SELECT * FROM #temp_Students
 
 
 DECLARE @ProductInfo TABLE
(
  ProductID int, 
  ProductName Varchar(100),
  Cost int
)

INSERT INTO @ProductInfo
 VALUES (101,'PLC',15000)
 INSERT INTO @ProductInfo
 VALUES (201,'Automatic Drives',35000)
 
 SELECT * FROM @ProductInfo