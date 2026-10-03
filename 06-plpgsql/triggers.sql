-- Purpose: Triggers run automatically on INSERT / UPDATE / DELETE
-- Requires: 08-projects/02-employee-management (uses the `salaries` history table)

-- Log every salary change into the salaries table
CREATE OR REPLACE FUNCTION trg_log_salary_change()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.salary IS DISTINCT FROM OLD.salary THEN
        INSERT INTO salaries (emp_id, old_salary, new_salary)
        VALUES (OLD.emp_id, OLD.salary, NEW.salary);
    END IF;
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS salary_change_trigger ON employees;

CREATE TRIGGER salary_change_trigger
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION trg_log_salary_change();

-- Test it
UPDATE employees SET salary = salary + 1000 WHERE emp_id = 1;
SELECT * FROM salaries ORDER BY changed_at DESC;

-- BEFORE trigger example: prevent salary decrease
CREATE OR REPLACE FUNCTION trg_block_salary_cut()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.salary < OLD.salary THEN
        RAISE EXCEPTION 'Salary cannot be decreased (% -> %)', OLD.salary, NEW.salary;
    END IF;
    RETURN NEW;
END;
$$;

-- Uncomment to enable:
-- CREATE TRIGGER block_salary_cut BEFORE UPDATE ON employees
-- FOR EACH ROW EXECUTE FUNCTION trg_block_salary_cut();
