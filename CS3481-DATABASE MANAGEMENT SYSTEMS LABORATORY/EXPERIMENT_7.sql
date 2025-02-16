/*
Execute complex transactions and realize DCL and TCL commands. 
*/
create schema EXPERIMENT_7;

-- Try Execution 2ND time This Code First 
-- drop schema EXPERIMENT_7

use EXPERIMENT_7;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE salaries (
    employee_id INT PRIMARY KEY,
    salary DECIMAL(10,2),
    effective_date DATE
);
START TRANSACTION;
-- Insert into employees table
INSERT INTO employees (employee_id, name, department)
VALUES (101, 'John Doe', 'Engineering');

-- Insert into salaries table
INSERT INTO salaries (employee_id, salary, effective_date)
VALUES (101, 70000, '2025-02-16');

-- If no errors, commit the transaction
COMMIT;

START TRANSACTION;
-- Insert into employees table
INSERT INTO employees (employee_id, name, department)
VALUES (102, 'Jane Smith', 'Marketing');

-- Insert into salaries table
INSERT INTO salaries (employee_id, salary, effective_date)
VALUES (102, 80000, '2025-02-16');

-- Simulate an error by inserting a duplicate entry
INSERT INTO employees (employee_id, name, department)
VALUES (102, 'Jane Smith', 'Marketing');

-- If an error occurs, roll back the transaction
ROLLBACK;

-- DCL Commands

GRANT SELECT, INSERT, UPDATE ON employees TO 'user1'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

REVOKE INSERT, UPDATE ON employees FROM 'user1'@'localhost';
FLUSH PRIVILEGES;

-- TCL Commands
START TRANSACTION;
-- Insert into employees table
INSERT INTO employees (employee_id, name, department)
VALUES (103, 'Alice Brown', 'Sales');

-- Create a savepoint
SAVEPOINT sp1;

-- Insert into salaries table
INSERT INTO salaries (employee_id, salary, effective_date)
VALUES (103, 75000, '2025-02-16');

-- Roll back to the savepoint if needed
ROLLBACK TO sp1;

-- Commit the transaction
COMMIT;




