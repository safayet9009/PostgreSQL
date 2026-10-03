-- Purpose: RIGHT JOIN keeps all rows from the right table
-- Requires: 08-projects/01-online-store (schema.sql + sample-data.sql)

-- All products, even those never ordered
SELECT p.p_name, oi.ord_id
FROM order_items oi
RIGHT JOIN products p ON oi.p_id = p.p_id;

-- Products never ordered
SELECT p.p_name
FROM order_items oi
RIGHT JOIN products p ON oi.p_id = p.p_id
WHERE oi.item_id IS NULL;
