# Project 2: Employee Management Database

A database for managing employees, departments, salaries, and employee reports.

## Tables
| Table | Description |
|-------|-------------|
| `departments` | Department name and location |
| `employees` | Employee details, current salary, department |
| `salaries` | Salary change history (filled by trigger) |

## Setup
```bash
createdb employee_mgmt
psql -d employee_mgmt -f schema.sql
psql -d employee_mgmt -f sample-data.sql
psql -d employee_mgmt -f queries.sql
```

## Related files
* Function `dept_max_sel_emp1()` → `06-plpgsql/functions.sql`
* Procedure `update_emp_salary()` → `06-plpgsql/stored-procedures.sql`
* Trigger logging salary changes → `06-plpgsql/triggers.sql`

## Queries included
* Employee count per department
* Highest and lowest salary
* Highest paid employee per department
* Salary update via stored procedure
* Salary ranking per department
