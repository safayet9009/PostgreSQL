-- Purpose: Window functions and ranking
-- Requires: 08-projects/02-employee-management

-- ROW_NUMBER / RANK / DENSE_RANK per department
SELECT dept_id, fname, salary,
       ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS row_num,
       RANK()       OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk,
       DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dense_rnk
FROM employees;

-- Top earner per department using a window function
SELECT * FROM (
    SELECT dept_id, fname, salary,
           RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 1;

-- Aggregate as window: compare each salary to department average
SELECT fname, dept_id, salary,
       ROUND(AVG(salary) OVER (PARTITION BY dept_id), 2) AS dept_avg,
       salary - AVG(salary) OVER (PARTITION BY dept_id) AS diff_from_avg
FROM employees;

-- Running total
SELECT emp_id, salary,
       SUM(salary) OVER (ORDER BY emp_id) AS running_total
FROM employees;

-- LAG / LEAD
SELECT emp_id, salary,
       LAG(salary)  OVER (ORDER BY emp_id) AS prev_salary,
       LEAD(salary) OVER (ORDER BY emp_id) AS next_salary
FROM employees;

-- NTILE: split into 4 groups
SELECT fname, salary, NTILE(4) OVER (ORDER BY salary DESC) AS quartile FROM employees;
