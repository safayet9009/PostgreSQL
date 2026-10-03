-- Online Store Database - queries
-- Run schema.sql and sample-data.sql first.

-- 1) All orders of a customer (cust_id = 1)
SELECT o.ord_id, o.ord_date, p.p_name, oi.quantity
FROM orders o
JOIN order_items oi ON o.ord_id = oi.ord_id
JOIN products p     ON oi.p_id = p.p_id
WHERE o.cust_id = 1
ORDER BY o.ord_date;

-- 2) Total spending per customer
SELECT c.cust_name, COALESCE(SUM(oi.quantity * p.price), 0) AS total_spent
FROM customers c
LEFT JOIN orders o       ON c.cust_id = o.cust_id
LEFT JOIN order_items oi ON o.ord_id = oi.ord_id
LEFT JOIN products p     ON oi.p_id = p.p_id
GROUP BY c.cust_id, c.cust_name
ORDER BY total_spent DESC;

-- 3) Best-selling product (by quantity)
SELECT p.p_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.p_id = p.p_id
GROUP BY p.p_id, p.p_name
ORDER BY total_sold DESC
LIMIT 1;

-- 4) Total price of each order
SELECT o.ord_id, c.cust_name, SUM(oi.quantity * p.price) AS order_total
FROM orders o
JOIN customers c   ON o.cust_id = c.cust_id
JOIN order_items oi ON o.ord_id = oi.ord_id
JOIN products p    ON oi.p_id = p.p_id
GROUP BY o.ord_id, c.cust_name
ORDER BY o.ord_id;

-- 5) Customers who never placed an order
SELECT c.cust_name
FROM customers c
LEFT JOIN orders o ON c.cust_id = o.cust_id
WHERE o.ord_id IS NULL;

-- Bonus: products that were never ordered
SELECT p.p_name
FROM products p
WHERE NOT EXISTS (SELECT 1 FROM order_items oi WHERE oi.p_id = p.p_id);

-- Bonus: monthly revenue
SELECT DATE_TRUNC('month', o.ord_date) AS month, SUM(oi.quantity * p.price) AS revenue
FROM orders o
JOIN order_items oi ON o.ord_id = oi.ord_id
JOIN products p ON oi.p_id = p.p_id
GROUP BY 1 ORDER BY 1;
