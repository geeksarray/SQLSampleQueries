CREATE TABLE EmployeeDetails (
      EmpId int PRIMARY KEY,
      EmpFirstName VARCHAR(50),
      EmpLastName VARCHAR(50),
      Department VARCHAR(50),
      DepartID INT
    )
          

CREATE TABLE EmpSalary (
      EmpID INT,
      EmpFullName VARCHAR(80),
      EmpSalary INT,
      EmpWorkingYears INT,
      DepartID INT
    )
            

CREATE FUNCTION fn_Salaryinc (@DepartmentID int)
    RETURNS TABLE
    AS
    RETURN
    (
      SELECT 
        EmpID, EmpFullName,
        EmpSalary+5000 AS Salaryinc
      FROM
        Empsalary
      WHERE
       DepartID = @DepartmentID 
  
    )
    GO

               
SELECT EmpID, Salaryinc FROM fn_Salaryinc(2)
Go

 SELECT
      e.EmpFirstName,
      e.EmpLastName,
      f.Salaryinc
    FROM
      EmployeeDetails AS e
    CROSS APPLY
      fn_Salaryinc  (e.DepartID) AS f
GO

CREATE TABLE EmployeeDetails (
      EmpId int PRIMARY KEY,
      EmpFirstName VARCHAR(50),
      EmpLastName VARCHAR(50),
      Department VARCHAR(50),
      DepartID INT
    )
GO

CREATE TABLE EmployeeProject (
          EmpID INT,
          DepartmentName VARCHAR(100),
          DepartID INT,
          ProjectName VARCHAR(100),
          Projectid VARCHAR(50)
    )
          
GO

 CREATE FUNCTION fn_Project(@DepartID INT)
    RETURNS TABLE
    AS
    RETURN
    (
        SELECT
            EmpID,
            DepartmentName,
            ProjectName
        FROM
            EmployeeProject
        WHERE
            DepartID = @DepartID
    )
    GO

 SELECT  * FROM fn_Project(2)
GO

SELECT 
        e.EmpID, 
        e.EmpFirstName ,
        fn.DepartmentName, 
        fn.Projectname 
    FROM
 	    Employeedetails e 
    OUTER APPLY
  	    fn_Project (e.departID) AS fn


SELECT  
        e.EmpID, 
        e.EmpFirstName,
 	    fn.DepartmentName, 
        fn.Projectname 
    FROM
 	    Employeedetails e 
    Cross APPLY
  	    fn_Project (e.departID) AS fn
