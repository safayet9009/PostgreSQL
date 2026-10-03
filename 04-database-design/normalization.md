# Normalization

Normalization organizes tables to reduce redundancy and avoid update, insert and delete anomalies.

## Relationships

| Type | Example | How to model |
|------|---------|--------------|
| One-to-One | user ↔ user_profile | FK with UNIQUE constraint |
| One-to-Many | customer → orders | FK on the "many" side |
| Many-to-Many | orders ↔ products | Junction table (`order_items`) |

## 1NF – First Normal Form
* Every column holds atomic (single) values.
* No repeating groups.

**Bad**

| order_id | products |
|----------|----------|
| 1 | Pen, Book |

**Good** – one row per product (`order_items`).

## 2NF – Second Normal Form
* Must be in 1NF.
* No partial dependency: non-key columns depend on the *whole* composite key.

**Bad:** `order_items(ord_id, p_id, quantity, p_name)` – `p_name` depends only on `p_id`.
**Good:** move `p_name` to `products`.

## 3NF – Third Normal Form
* Must be in 2NF.
* No transitive dependency: non-key columns must not depend on other non-key columns.

**Bad:** `employees(emp_id, dept_id, dept_name)` – `dept_name` depends on `dept_id`.
**Good:** move `dept_name` to `departments`.

## Example from this repo
`customers`, `orders`, `products`, `order_items` are in 3NF. See `er-diagram.png`.

## When to denormalize?
Only for measured performance needs (reporting tables, caching totals), and knowingly.
