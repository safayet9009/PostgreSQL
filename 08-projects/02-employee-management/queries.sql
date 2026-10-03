-- Employee Management Database - queries
-- Run schema.sql and sample-data.sql first.

-- 1) Employee count per department
SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY emp_count DESC;

-- 2) Highest and lowest salary overall
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM employees;

-- 3) Highest paid employee(s) in each department
SELECT d.dept_name, e.fname, e.lname, e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary = (SELECT MAX(salary) FROM employees WHERE dept_id = e.dept_id)
ORDER BY d.dept_name;

-- 4) Update salary using the stored procedure
--    (create it first: 06-plpgsql/stored-procedures.sql)
-- CALL update_emp_salary(1, 80000);

-- 5) Salary ranking within each department
SELECT d.dept_name, e.fname, e.salary,
       RANK() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) AS dept_rank
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
ORDER BY d.dept_name, dept_rank;

-- Bonus: average salary per department vs company average
SELECT d.dept_name,
       ROUND(AVG(e.salary),2) AS dept_avg,
       ROUND((SELECT AVG(salary) FROM employees),2) AS company_avg
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
