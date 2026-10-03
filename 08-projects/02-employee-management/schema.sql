-- Employee Management Database - schema
DROP TABLE IF EXISTS salaries, employees, departments CASCADE;

CREATE TABLE departments (
    dept_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location  VARCHAR(100)
);

CREATE TABLE employees (
    emp_id    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fname     VARCHAR(50) NOT NULL,
    lname     VARCHAR(50) NOT NULL,
    dept_id   INT REFERENCES departments(dept_id) ON DELETE SET NULL,
    hire_date DATE,
    salary    NUMERIC(10,2) NOT NULL CHECK (salary > 0)
);

-- Salary history (filled automatically by the trigger in 06-plpgsql/triggers.sql)
CREATE TABLE salaries (
    sal_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    emp_id     INT NOT NULL REFERENCES employees(emp_id) ON DELETE CASCADE,
    old_salary NUMERIC(10,2),
    new_salary NUMERIC(10,2) NOT NULL,
    changed_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_emp_dept ON employees (dept_id);
