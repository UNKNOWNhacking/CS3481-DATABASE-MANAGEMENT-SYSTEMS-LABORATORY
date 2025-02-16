/*
Execute complex transactions and realize DCL and TCL commands. 
*/
create schema EXPERIMENT_8;

-- Try Execution 2ND time This Code First 
-- drop schema EXPERIMENT_8

use EXPERIMENT_8;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(10,2)
);

DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
  -- Insert logic here
  INSERT INTO audit_log (action, employee_id, action_time)
  VALUES ('INSERT', NEW.employee_id, NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
  -- Delete logic here
  INSERT INTO audit_log (action, employee_id, action_time)
  VALUES ('DELETE', OLD.employee_id, NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
  -- Update logic here
  INSERT INTO audit_log (action, employee_id, action_time)
  VALUES ('UPDATE', NEW.employee_id, NOW());
END;
//
DELIMITER ;

CREATE TABLE audit_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  action VARCHAR(10),
  employee_id INT,
  action_time DATETIME
);




