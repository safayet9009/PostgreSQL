-- Purpose: Common Table Expressions (WITH)
-- Requires: 08-projects/02-employee-management

-- Basic CTE
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY dept_id
)
SELECT e.fname, e.salary, d.avg_sal
FROM employees e
JOIN dept_avg d ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_sal;

-- Multiple CTEs
WITH dept_max AS (
    SELECT dept_id, MAX(salary) AS max_sal FROM employees GROUP BY dept_id
),
top_emp AS (
    SELECT e.*
    FROM employees e
    JOIN dept_max m ON e.dept_id = m.dept_id AND e.salary = m.max_sal
)
SELECT t.fname, d.dept_name, t.salary
FROM top_emp t
JOIN departments d ON t.dept_id = d.dept_id;

-- Recursive CTE: numbers 1..10
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 10
)
SELECT n FROM nums;
