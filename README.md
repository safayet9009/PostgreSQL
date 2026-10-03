# PostgreSQL Learning & Projects

A structured repository documenting my journey of learning PostgreSQL, SQL, database design, and database performance optimization.

## Technologies

* PostgreSQL
* SQL
* PL/pgSQL
* pgAdmin 4

## Topics Covered

* SQL Fundamentals
* Filtering and Aggregation
* SQL Joins
* Database Design and Normalization
* Subqueries and CTEs
* Views and Window Functions
* Functions, Procedures, and Triggers
* Indexing and Query Optimization

## Repository Structure

```text
postgresql-learning-and-projects/
├── 01-sql-basics/               SELECT, INSERT, UPDATE, DELETE, filtering
├── 02-sorting-and-aggregation/  ORDER BY, DISTINCT, GROUP BY, HAVING, aggregates
├── 03-joins/                    INNER, LEFT, RIGHT, FULL, CROSS JOIN
├── 04-database-design/          Keys, constraints, normalization, ER diagram
├── 05-advanced-sql/             Subqueries, CTE, Views, CASE, Window functions
├── 06-plpgsql/                  Functions, stored procedures, triggers
├── 07-performance/              Indexes, EXPLAIN ANALYZE, optimization
├── 08-projects/                 Real-world projects
│   ├── 01-online-store/
│   └── 02-employee-management/
└── notes/                       Cheatsheet and common errors
```

## Projects

### 1. Online Store Database
A relational database for managing customers, orders, products, and order items.
See [`08-projects/01-online-store`](08-projects/01-online-store).

### 2. Employee Management Database
A database for managing employees, departments, salaries, and employee reports.
See [`08-projects/02-employee-management`](08-projects/02-employee-management).

## How to Run

```bash
# 1. Create a database
createdb learning_db

# 2. Load a project (example: online store)
psql -d learning_db -f 08-projects/01-online-store/schema.sql
psql -d learning_db -f 08-projects/01-online-store/sample-data.sql

# 3. Run any practice file
psql -d learning_db -f 03-joins/inner-join.sql
```

> Topic folders `01`–`03` and `05`–`07` use the tables from the two projects.
> Load the project schema + sample data first. Each SQL file's header says which one it needs.

## Learning Goals

* Understand relational database concepts.
* Write efficient SQL queries.
* Design normalized relational databases.
* Build practical database projects.
* Learn PostgreSQL performance optimization.
