-- Purpose: Views save a query as a virtual table
-- Requires: 08-projects/02-employee-management

CREATE OR REPLACE VIEW v_employee_details AS
SELECT e.emp_id,
       e.fname || ' ' || e.lname AS full_name,
       d.dept_name,
       e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

SELECT * FROM v_employee_details WHERE salary > 50000;

-- Highest paid employee in each department
CREATE OR REPLACE VIEW v_dept_top_earner AS
SELECT DISTINCT ON (d.dept_id)
       d.dept_name, e.fname, e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
ORDER BY d.dept_id, e.salary DESC;

SELECT * FROM v_dept_top_earner;

-- Materialized view: stores the result physically
CREATE MATERIALIZED VIEW IF NOT EXISTS mv_dept_stats AS
SELECT dept_id, COUNT(*) AS emp_count, ROUND(AVG(salary),2) AS avg_salary
FROM employees GROUP BY dept_id;

REFRESH MATERIALIZED VIEW mv_dept_stats;

-- DROP VIEW v_employee_details;
