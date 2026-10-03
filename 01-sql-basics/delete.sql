-- Purpose: Deleting rows (ALWAYS use WHERE!)
-- Requires: 08-projects/02-employee-management

-- Delete one employee
DELETE FROM employees WHERE emp_id = 10;

-- Delete with condition
DELETE FROM employees WHERE salary < 20000;

-- Delete and return deleted rows
DELETE FROM employees WHERE emp_id = 11 RETURNING *;

-- TRUNCATE removes all rows quickly (cannot be filtered)
-- TRUNCATE TABLE some_table RESTART IDENTITY;
