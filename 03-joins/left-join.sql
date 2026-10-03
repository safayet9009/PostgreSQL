-- Purpose: LEFT JOIN keeps all rows from the left table
-- Requires: 08-projects/01-online-store (schema.sql + sample-data.sql)

-- All customers, even those with no orders
SELECT c.cust_name, o.ord_id
FROM customers c
LEFT JOIN orders o ON c.cust_id = o.cust_id;

-- Customers who never ordered
SELECT c.cust_name
FROM customers c
LEFT JOIN orders o ON c.cust_id = o.cust_id
WHERE o.ord_id IS NULL;
