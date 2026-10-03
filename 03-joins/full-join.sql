-- Purpose: FULL JOIN keeps all rows from both tables
-- Requires: 08-projects/01-online-store (schema.sql + sample-data.sql)

SELECT c.cust_name, o.ord_id
FROM customers c
FULL JOIN orders o ON c.cust_id = o.cust_id;

-- Rows that have no match on either side
SELECT c.cust_name, o.ord_id
FROM customers c
FULL JOIN orders o ON c.cust_id = o.cust_id
WHERE c.cust_id IS NULL OR o.ord_id IS NULL;
