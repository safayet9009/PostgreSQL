-- Purpose: Filtering groups (WHERE filters rows, HAVING filters groups)
-- Requires: 08-projects/02-employee-management

-- Departments with more than 2 employees
SELECT dept_id, COUNT(*) AS emp_count
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 2;

-- Departments whose average salary is above 50000
SELECT dept_id, ROUND(AVG(salary),2) AS avg_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 50000;

-- WHERE + HAVING together
SELECT dept_id, COUNT(*) AS emp_count
FROM employees
WHERE salary > 40000
GROUP BY dept_id
HAVING COUNT(*) >= 2;
