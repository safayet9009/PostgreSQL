-- Purpose: CASE expressions (if / else in SQL)
-- Requires: 08-projects/02-employee-management

SELECT fname, salary,
       CASE
           WHEN salary >= 70000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_band
FROM employees;

-- Conditional aggregation
SELECT
    COUNT(*) FILTER (WHERE salary >= 50000) AS high_paid,
    COUNT(*) FILTER (WHERE salary <  50000) AS low_paid
FROM employees;

-- COALESCE / NULLIF
SELECT fname, COALESCE(hire_date::text, 'unknown') FROM employees;
