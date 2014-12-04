-- weaves

-- From Wikipedia.

-- http://en.wikipedia.org/wiki/Join_%28SQL%29

CREATE TABLE department
(
 DepartmentID INT,
 DepartmentName VARCHAR(20)
);
 
CREATE TABLE employee
(
 LastName VARCHAR(20),
 DepartmentID INT
);
 
INSERT INTO department VALUES(31, 'Sales');
INSERT INTO department VALUES(33, 'Engineering');
INSERT INTO department VALUES(34, 'Clerical');
INSERT INTO department VALUES(35, 'Marketing');
 
INSERT INTO employee VALUES('Rafferty', 31);
INSERT INTO employee VALUES('Jones', 33);
INSERT INTO employee VALUES('Heisenberg', 33);
INSERT INTO employee VALUES('Robinson', 34);
INSERT INTO employee VALUES('Smith', 34);
INSERT INTO employee VALUES('Williams', NULL);

