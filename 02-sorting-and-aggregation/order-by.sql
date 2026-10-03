-- Purpose: Sorting and limiting results
-- Requires: 08-projects/02-employee-management

SELECT fname, salary FROM employees ORDER BY salary DESC;
SELECT fname, dept_id, salary FROM employees ORDER BY dept_id ASC, salary DESC;

-- Top 3 highest paid
SELECT fname, salary FROM employees ORDER BY salary DESC LIMIT 3;

-- Pagination: skip 3 rows, take next 3
SELECT fname, salary FROM employees ORDER BY salary DESC LIMIT 3 OFFSET 3;

-- NULLs last
SELECT fname, hire_date FROM employees ORDER BY hire_date DESC NULLS LAST;
