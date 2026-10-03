# Project 1: Online Store Database

A relational database for managing customers, orders, products, and order items.

## Tables
| Table | Description |
|-------|-------------|
| `customers` | Customer details |
| `products` | Product catalog with price and stock |
| `orders` | One row per order (belongs to a customer) |
| `order_items` | Products inside each order (junction table, many-to-many) |

## ER Overview
`customers 1 ── * orders 1 ── * order_items * ── 1 products`

See `04-database-design/er-diagram.png`.

## Setup
```bash
createdb online_store
psql -d online_store -f schema.sql
psql -d online_store -f sample-data.sql
psql -d online_store -f queries.sql
```

## Queries included
* All orders of a customer
* Total spending per customer
* Best-selling product
* Total price of each order
* Customers who never ordered
* Bonus: unsold products, monthly revenue
