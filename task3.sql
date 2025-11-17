– Task 3: SQL for Data Analysis

– 1. Total customers SELECT COUNT(*) AS total_customers FROM customers;

– 2. Orders with customer details SELECT o.order_id, o.order_date,
c.customer_name, c.email FROM orders o INNER JOIN customers c ON
o.customer_id = c.customer_id;

– 3. Total revenue SELECT SUM(item_price * quantity) AS total_revenue
FROM order_items;

– 4. Products with more than 50 units sold SELECT product_id,
SUM(quantity) AS total_qty_sold FROM order_items GROUP BY product_id
HAVING SUM(quantity) > 50;

– 5. Average Revenue Per User SELECT c.customer_id, c.customer_name,
SUM(oi.item_price * oi.quantity) AS revenue, AVG(oi.item_price *
oi.quantity) AS avg_order_value FROM customers c JOIN orders o ON
c.customer_id = o.customer_id JOIN order_items oi ON o.order_id =
oi.order_id GROUP BY c.customer_id, c.customer_name;

– 6. Subquery: Customers who spent above average SELECT customer_id,
customer_name FROM ( SELECT c.customer_id, c.customer_name,
SUM(oi.item_price * oi.quantity) AS total_spent FROM customers c JOIN
orders o ON c.customer_id = o.customer_id JOIN order_items oi ON
o.order_id = oi.order_id GROUP BY c.customer_id, c.customer_name ) AS t
WHERE total_spent > (SELECT AVG(item_price * quantity) FROM
order_items);

– 7. Create view for customer revenue CREATE VIEW customer_revenue AS
SELECT c.customer_id, c.customer_name, SUM(oi.item_price * oi.quantity)
AS total_revenue FROM customers c JOIN orders o ON c.customer_id =
o.customer_id JOIN order_items oi ON o.order_id = oi.order_id GROUP BY
c.customer_id, c.customer_name;

– 8. Index optimization CREATE INDEX idx_orders_customerid ON
orders(customer_id); CREATE INDEX idx_orderitems_orderid ON
order_items(order_id);
