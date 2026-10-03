-- Purpose: Stored procedures (CALL, can COMMIT/ROLLBACK)
-- Requires: 08-projects/02-employee-management

CREATE OR REPLACE PROCEDURE update_emp_salary(p_emp_id INT, p_new_salary NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_new_salary <= 0 THEN
        RAISE EXCEPTION 'Salary must be positive';
    END IF;

    UPDATE employees SET salary = p_new_salary WHERE emp_id = p_emp_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Employee % not found', p_emp_id;
    END IF;

    RAISE NOTICE 'Salary of employee % updated to %', p_emp_id, p_new_salary;
END;
$$;

CALL update_emp_salary(1, 65000);

-- Function vs Procedure
--  Function : called with SELECT, must return a value, cannot manage transactions
--  Procedure: called with CALL, may return nothing, can COMMIT / ROLLBACK
