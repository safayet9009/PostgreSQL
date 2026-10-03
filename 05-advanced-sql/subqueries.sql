-- Purpose: Subqueries
-- Requires: 08-projects/02-employee-management

-- Scalar subquery: employees earning above average
SELECT fname, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- IN subquery: employees in departments located in Dhaka
SELECT fname FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE location = 'Dhaka');

-- Correlated subquery: highest paid employee in each department
SELECT e.dept_id, e.fname, e.salary
FROM employees e
WHERE e.salary = (
    SELECT MAX(salary) FROM employees WHERE dept_id = e.dept_id
);

-- EXISTS: departments that have at least one employee
SELECT d.dept_name
FROM departments d
WHERE EXISTS (SELECT 1 FROM employees e WHERE e.dept_id = d.dept_id);

-- Subquery in FROM
SELECT dept_id, avg_sal
FROM (SELECT dept_id, AVG(salary) AS avg_sal FROM employees GROUP BY dept_id) t
WHERE avg_sal > 50000;
