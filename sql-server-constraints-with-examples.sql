Select * from EmployeeDetails

Create table EmployeeDetails1 
(
EmpID int Constraint empid_PK PRIMARY Key ,
EmpFirstName varchar(80),
EmpLastName varchar(80),
Department varchar(30),
DepartID int
)

SELECT * --constraint_name, 
       --constraint_type,
       --search_condition
  FROM user_constraints
 WHERE table_name = 'EmployeeDetails';
 
 SELECT OBJECT_NAME(OBJECT_ID) AS NameofConstraint,
SCHEMA_NAME(schema_id) AS SchemaName,
OBJECT_NAME(parent_object_id) AS TableName,
type_desc AS ConstraintType
FROM sys.objects
WHERE type_desc LIKE '%CONSTRAINT'
GO

SELECT CONSTRAINT_NAME,
 TABLE_SCHEMA ,
 TABLE_NAME,
 CONSTRAINT_TYPE
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='EmployeeDetails1'