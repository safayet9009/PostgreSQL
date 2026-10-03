-- Purpose: INNER JOIN returns only rows that match in both tables
-- Requires: 08-projects/01-online-store (schema.sql + sample-data.sql)

-- Orders with customer names
SELECT c.cust_name, o.ord_id, o.ord_date
FROM orders o
INNER JOIN customers c ON o.cust_id = c.cust_id;

-- Multi-table join: full order details
-- order_items is the main table
--   -> products  joined by p_id
--   -> orders    joined by ord_id
--   -> customers joined via orders.cust_id
SELECT
    c.cust_name,
    o.ord_date,
    p.p_name,
    oi.quantity
FROM order_items oi
JOIN products p  ON oi.p_id = p.p_id
JOIN orders o    ON oi.ord_id = o.ord_id
JOIN customers c ON o.cust_id = c.cust_id;
