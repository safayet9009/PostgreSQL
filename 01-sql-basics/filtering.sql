-- Purpose: Filtering rows with WHERE
-- Requires: 08-projects/02-employee-management

-- Comparison
SELECT fname, salary FROM employees WHERE salary > 50000;

-- AND / OR / NOT
SELECT * FROM employees WHERE dept_id = 1 AND salary >= 50000;
SELECT * FROM employees WHERE dept_id = 1 OR dept_id = 2;
SELECT * FROM employees WHERE NOT dept_id = 1;

-- BETWEEN
SELECT * FROM employees WHERE salary BETWEEN 40000 AND 60000;

-- IN
SELECT * FROM employees WHERE dept_id IN (1, 3);

-- LIKE / ILIKE (case-insensitive)
SELECT * FROM employees WHERE fname LIKE 'A%';
SELECT * FROM employees WHERE fname ILIKE '%an%';

-- NULL checks
SELECT * FROM employees WHERE hire_date IS NULL;
SELECT * FROM employees WHERE hire_date IS NOT NULL;
