/*Create a database called ‘EmployeesDB1’*/

CREATE DATABASE EmployeesDB1

/* A 10 rowed table named Employees1 with the following columns*/

CREATE TABLE Employees1 (
EmployeeID INT Primary key,
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL,
Department VARCHAR(50) NOT NULL,
Salary DECIMAL);

/*Insert the following data into the table*/

INSERT INTO Employees1 VALUES
(001, 'John','Dona', 'IT', 60000.00),
(002, 'Jane', 'Smith', 'HR', 55000.00),
(003, 'Robert', 'Brown', 'Finance', 75000.00),
(004, 'Emily', 'Jones', 'Marketing', 50000.00),
(005, 'Michael', 'Davis', 'IT', 65000.00),
(006, 'Sarah', 'Wilson', 'Finance', 70000.00),
(007, 'David', 'Taylor', 'HR', 52000.00),
(008, 'Laura', 'Anderson', 'Marketing', 48000.00),
(009,'James','Thomas', 'IT', 72000.00),
(010, 'Elizabeth', 'Jackson', 'Finance', 68000.00);

/*Retrieve all columns and rows from the Employees1 table*/

SELECT * FROM Employees1;

/*Retrieve the FirstName and Salary of employees in the 'IT' department*/

SELECT FirstName,Salary 
FROM Employees1 WHERE Department='IT';

/*Retrieve all employees with a salary greater than 60000*/

SELECT * FROM Employees1 WHERE Salary > 60000;

/*Retrieve the records of the first 6 employees*/

SELECT TOP 6 * FROM Employees1;

/*Retrieve the FirstName and Department of employees
whose last name starts with 'J'*/

SELECT  FirstName,Department  FROM Employees1
WHERE LastName LIKE 'J%';

/*Insert a new employee into the Employees1 table*/

INSERT INTO Employees1 VALUES
(011,'Kevin','White','Markerting', 50000.00);

/*Update the salary of 'Emily Jones' to 52000.00.*/

UPDATE Employees1 SET Salary = 52000.00
WHERE FirstName ='Emily' AND LastName ='Jones';

/*Delete the employee with EmployeeID 010*/

DELETE FROM Employees1
WHERE EmployeeID = '010';

/*Increase the salary of all employees in the 'HR' department by 10%*/

UPDATE Employees1
SET Salary *=1.10
WHERE Department = 'HR';

/*Edit  the names of the following columns:
FirstName to FName,LastName to LName,Salary to Wages*/

EXEC sp_rename 'Employees1.FirstName', 'FName', 'COLUMN';
EXEC sp_rename 'Employees1.LastName', 'LName', 'COLUMN';
EXEC sp_rename 'Employees1.Salary', 'Wages', 'COLUMN';


/*Create another table called EmployeesXX
with the same columns and add just 5 employee records.*/

CREATE TABLE EmployeesXX (
  EmployeeID VARCHAR(10),
  FName VARCHAR(50),
  LName VARCHAR(50),
  Department VARCHAR(50),
  Wages DECIMAL(10, 2)
);
ALTER TABLE EmployeesXX ALTER COLUMN EmployeeID INT

INSERT INTO EmployeesXX (EmployeeID, FName, LName, Department, Wages)
VALUES
(012, 'Alex', 'Martin', 'IT', 60000.00),
(013, 'Ben', 'Lee', 'Finance', 70000.00),
(014, 'Charlie', 'Hall', 'Marketing', 50000.00),
(015, 'David', 'Kim', 'HR', 55000.00),
(016, 'Eva', 'Patel', 'IT', 65000.00);

/*Combine the Employees1 table and the EmployeesXX table*/

SELECT * FROM Employees1
UNION SELECT * FROM EmployeesXX ;

/*Combine the two tables
taking only the EmployeeID, FirstName, LastName from both tables*/

SELECT EmployeeID,FName,LName from EmployeesXX
union select EmployeeID,FName,LName from Employees1
select * from EmployeesXX
/*Display all unique record records from employeesxx.*/

SELECT DISTINCT * FROM  EmployeesXX

/* Combining the first four rows of the Employees1 table and the first three
rows of the EmployeesXX*/

SELECT TOP 4 * FROM Employees1
UNION SELECT TOP 3 * FROM EmployeesXX;





