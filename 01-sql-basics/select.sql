-- Purpose: Basic SELECT queries
-- Requires: 08-projects/02-employee-management (schema.sql + sample-data.sql)

-- Select all employees
SELECT * FROM employees;

-- Select specific columns
SELECT fname, lname, salary FROM employees;

-- Column alias
SELECT fname AS first_name, salary AS monthly_salary FROM employees;

-- Calculated column (annual salary)
SELECT fname, salary * 12 AS annual_salary FROM employees;

-- String concatenation
SELECT fname || ' ' || lname AS full_name FROM employees;
