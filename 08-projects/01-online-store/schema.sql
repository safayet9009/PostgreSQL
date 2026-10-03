-- Online Store Database - schema
DROP TABLE IF EXISTS order_items, orders, products, customers CASCADE;

CREATE TABLE customers (
    cust_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    email     VARCHAR(150) NOT NULL UNIQUE,
    city      VARCHAR(80)
);

CREATE TABLE products (
    p_id    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    p_name  VARCHAR(100) NOT NULL,
    price   NUMERIC(10,2) NOT NULL CHECK (price > 0),
    stock   INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

CREATE TABLE orders (
    ord_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cust_id  INT NOT NULL REFERENCES customers(cust_id) ON DELETE CASCADE,
    ord_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE order_items (
    item_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ord_id   INT NOT NULL REFERENCES orders(ord_id)  ON DELETE CASCADE,
    p_id     INT NOT NULL REFERENCES products(p_id),
    quantity INT NOT NULL CHECK (quantity > 0)
);

CREATE INDEX idx_orders_cust   ON orders (cust_id);
CREATE INDEX idx_items_order   ON order_items (ord_id);
CREATE INDEX idx_items_product ON order_items (p_id);
