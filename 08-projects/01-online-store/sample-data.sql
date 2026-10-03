-- Online Store Database - sample data
INSERT INTO customers (cust_name, email, city) VALUES
 ('Rahim Uddin',   'rahim@example.com',  'Dhaka'),
 ('Karim Hossain', 'karim@example.com',  'Khulna'),
 ('Nusrat Jahan',  'nusrat@example.com', 'Chattogram'),
 ('Tania Akter',   'tania@example.com',  'Dhaka'),
 ('Sabbir Ahmed',  'sabbir@example.com', 'Rajshahi');   -- never orders

INSERT INTO products (p_name, price, stock) VALUES
 ('Laptop',     65000.00, 10),
 ('Smartphone', 25000.00, 25),
 ('Headphones',  2500.00, 50),
 ('Keyboard',    1800.00, 40),
 ('Mouse',        900.00, 60),
 ('Monitor',    15000.00,  0);                         -- never ordered

INSERT INTO orders (cust_id, ord_date) VALUES
 (1, '2026-01-05'),
 (1, '2026-02-10'),
 (2, '2026-02-12'),
 (3, '2026-03-01'),
 (4, '2026-03-15');

INSERT INTO order_items (ord_id, p_id, quantity) VALUES
 (1, 1, 1),
 (1, 5, 2),
 (2, 3, 1),
 (3, 2, 1),
 (3, 4, 1),
 (4, 2, 2),
 (4, 5, 3),
 (5, 3, 2),
 (5, 4, 1);
