-- Purpose: Inserting rows
-- Requires: 08-projects/02-employee-management

-- Insert a single row
INSERT INTO employees (fname, lname, dept_id, hire_date, salary)
VALUES ('Rahim', 'Uddin', 1, '2026-01-10', 45000);

-- Insert multiple rows
INSERT INTO employees (fname, lname, dept_id, hire_date, salary)
VALUES
    ('Karim', 'Hossain', 2, '2026-02-01', 52000),
    ('Nusrat', 'Jahan', 3, '2026-02-15', 48000);

-- Insert and return the new row
INSERT INTO employees (fname, lname, dept_id, hire_date, salary)
VALUES ('Tania', 'Akter', 1, '2026-03-01', 50000)
RETURNING emp_id, fname;
