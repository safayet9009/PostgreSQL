-- Purpose: Grouping rows
-- Requires: 08-projects/02-employee-management

-- Employees per department
SELECT dept_id, COUNT(*) AS emp_count
FROM employees
GROUP BY dept_id;

-- Average and max salary per department
SELECT dept_id, ROUND(AVG(salary),2) AS avg_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY dept_id
ORDER BY avg_salary DESC;

-- Hires per year
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*)
FROM employees
GROUP BY hire_year
ORDER BY hire_year;
