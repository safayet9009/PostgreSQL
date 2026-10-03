-- Purpose: Updating rows (ALWAYS use WHERE!)
-- Requires: 08-projects/02-employee-management

-- Update one employee's salary
UPDATE employees
SET salary = 60000
WHERE emp_id = 1;

-- Give 10% raise to a department
UPDATE employees
SET salary = salary * 1.10
WHERE dept_id = 2;

-- Update and see the result
UPDATE employees
SET salary = salary + 2000
WHERE emp_id = 3
RETURNING emp_id, fname, salary;
