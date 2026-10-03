-- Purpose: COUNT, SUM, AVG, MIN, MAX
-- Requires: 08-projects/02-employee-management

SELECT COUNT(*)            AS total_employees,
       SUM(salary)         AS total_salary,
       ROUND(AVG(salary),2) AS avg_salary,
       MIN(salary)         AS min_salary,
       MAX(salary)         AS max_salary
FROM employees;

-- COUNT(column) ignores NULLs, COUNT(*) does not
SELECT COUNT(*) AS all_rows, COUNT(hire_date) AS rows_with_hire_date FROM employees;

-- Count unique departments
SELECT COUNT(DISTINCT dept_id) FROM employees;
