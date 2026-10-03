-- Purpose: CROSS JOIN returns every combination (Cartesian product)
-- Requires: 08-projects/01-online-store (schema.sql + sample-data.sql)

-- Every customer paired with every product
SELECT c.cust_name, p.p_name
FROM customers c
CROSS JOIN products p;

-- Row count = customers x products
SELECT (SELECT COUNT(*) FROM customers) * (SELECT COUNT(*) FROM products) AS expected_rows;
