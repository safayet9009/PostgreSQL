-- Purpose: User-defined functions in PL/pgSQL
-- Requires: 08-projects/02-employee-management

-- 1) Simple function with variable
CREATE OR REPLACE FUNCTION annual_salary(p_emp_id INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    v_salary NUMERIC;
BEGIN
    SELECT salary INTO v_salary FROM employees WHERE emp_id = p_emp_id;
    IF v_salary IS NULL THEN
        RAISE EXCEPTION 'Employee % not found', p_emp_id;
    END IF;
    RETURN v_salary * 12;
END;
$$;

SELECT annual_salary(1);

-- 2) Function returning a table: highest paid employee of each department
CREATE OR REPLACE FUNCTION dept_max_sel_emp1()
RETURNS TABLE (dept_name VARCHAR, fname VARCHAR, salary NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT d.dept_name, e.fname, e.salary
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    WHERE e.salary = (SELECT MAX(e2.salary) FROM employees e2 WHERE e2.dept_id = e.dept_id);
END;
$$;

SELECT * FROM dept_max_sel_emp1();

-- 3) Control structures: loop + exception handling
CREATE OR REPLACE FUNCTION safe_divide(a NUMERIC, b NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN a / b;
EXCEPTION
    WHEN division_by_zero THEN
        RAISE NOTICE 'Division by zero, returning NULL';
        RETURN NULL;
END;
$$;

SELECT safe_divide(10, 0);
