-- weaves

-- From wikipedia

-- Explicit cross join

USE Contacts;
go

SELECT *
FROM employee CROSS JOIN department;

-- Implicit cross join

SELECT *
FROM employee, department;

-- Inner join

SELECT *
FROM employee INNER JOIN department
  ON employee.DepartmentID = department.DepartmentID;

-- Implicit join

SELECT *
FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID;

-- Equi join

SELECT *
FROM employee JOIN department
  ON employee.DepartmentID = department.DepartmentID;

/* 

-- SQL 92 allows the USING clause.

SELECT *
FROM employee INNER JOIN department USING (DepartmentID);

*/

-- Left outer

SELECT *
FROM employee LEFT OUTER JOIN department
  ON employee.DepartmentID = department.DepartmentID;

-- Right outer

SELECT *
FROM employee RIGHT OUTER JOIN department
  ON employee.DepartmentID = department.DepartmentID;

-- Full outer

SELECT *
FROM employee FULL OUTER JOIN department
  ON employee.DepartmentID = department.DepartmentID;

-- Full outer using union

SELECT employee.LastName, employee.DepartmentID,
       department.DepartmentName, department.DepartmentID
FROM employee
INNER JOIN department ON employee.DepartmentID = department.DepartmentID
 
UNION ALL
 
SELECT employee.LastName, employee.DepartmentID,
       CAST(NULL AS VARCHAR(20)), CAST(NULL AS INTEGER)
FROM employee
WHERE NOT EXISTS (
    SELECT * FROM department
             WHERE employee.DepartmentID = department.DepartmentID)
 
UNION ALL
 
SELECT CAST(NULL AS VARCHAR(20)), CAST(NULL AS INTEGER),
       department.DepartmentName, department.DepartmentID
FROM department
WHERE NOT EXISTS (
    SELECT * FROM employee
             WHERE employee.DepartmentID = department.DepartmentID)

-- Self-join

SELECT F.EmployeeID, F.LastName, S.EmployeeID, S.LastName, F.Country
FROM Employee F INNER JOIN Employee S ON F.Country = S.Country
WHERE F.EmployeeID < S.EmployeeID
ORDER BY F.EmployeeID, S.EmployeeID;

