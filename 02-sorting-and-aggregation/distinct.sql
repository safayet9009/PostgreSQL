-- Purpose: Removing duplicates
-- Requires: 08-projects/02-employee-management

SELECT DISTINCT dept_id FROM employees;

-- Distinct on a combination of columns
SELECT DISTINCT dept_id, salary FROM employees;

-- PostgreSQL-specific: first row per group
SELECT DISTINCT ON (dept_id) dept_id, fname, salary
FROM employees
ORDER BY dept_id, salary DESC;
