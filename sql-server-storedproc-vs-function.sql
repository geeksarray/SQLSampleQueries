
Select * from EmployeeDetails


CREATE PROC ListofEMP @Department char(50)
AS
BEGIN
	SELECT EmpID,EmpFirstName+' '+EmpLastName AS EmpName 
	FROM EmployeeDetails
	WHERE Department = @Department
END

EXEC ListofEMP 'IT'

CREATE PROC SingleEMP @EmpID int,
					  @Department char(50) OUTPUT,
					  @EmpName char(100) OUTPUT
AS
BEGIN
	IF Exists ( Select * from EmployeeDetails where EmpID = @EmpID)
	BEGIN
	
	SELECT 
	@Department = Department,
	@EmpName = EmpFirstName+' '+EmpLastName 
	FROM EmployeeDetails
	WHERE EmpID = @EmpID
	Return 0
	END
ELSE
RETURN 1
END

DECLARE @Department_output char(50),@EmpName_output char(100)

EXEC SingleEMP 1001,
	@Department = @Department_output OUTPUT,
	@EmpName = @EmpName_output OUTPUT
	PRINT @Department_output
	PRINT @EmpName_output
	PRINT 'Execution complete'
	
	
-- Functions

CREATE FUNCTION dbo.FirstLetter_Upper (@Name varchar(100))
RETURNS varchar(100)
AS
BEGIN
RETURN
	(
	UPPER(LEFT(@Name,1))+LOWER(SUBSTRING(@Name,2,LEN(@Name)))
	)
END

DECLARE @Name varchar(100)
SET @Name = dbo.FirstLetter_Upper('bhAvana')
PRINT @Name 



SELECT dbo.FirstLetter_Upper(EmpFirstName) AS FirstName
 FROM EmployeeDetails
WHERE EmpID = 1001



CREATE FUNCTION dbo.Department_Wise (@department varchar(100))
RETURNS TABLE
AS
RETURN
	(
	SELECT * 
	FROM EmployeeDetails
	WHERE Department = @department
	)
GO

SELECT * FROM dbo.Department_Wise('IT')



SELECT * FROM EmployeeDetails