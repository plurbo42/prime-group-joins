--	1.	Get all customers and their addresses.

SELECT *
FROM customers c
	JOIN addresses a ON c.id = a.customer_id;

--	2.	Get all orders and their line items.

SELECT *
FROM orders o 
	JOIN line_items li ON o.id = li.order_id;

--	3.	Which warehouses have cheetos?

SELECT w.warehouse
FROM warehouse w
	JOIN warehouse_product wp ON w.id = wp.warehouse_id
	JOIN products p ON p.id = wp.product_id
WHERE p.description = 'cheetos';

--	4.	Which warehouses have diet pepsi?

SELECT w.warehouse
FROM warehouse w
	JOIN warehouse_product wp ON w.id = wp.warehouse_id
	JOIN products p ON p.id = wp.product_id
WHERE p.description = 'diet pepsi';

--	5.	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT c.id, c.first_name, c.last_name, COUNT(o.id) AS order_count
FROM customers c
	JOIN addresses a ON c.id = a.customer_id
	JOIN orders o ON a.id = o.address_id
GROUP BY c.id;
	 
--	6.	How many customers do we have?

SELECT COUNT(c.id)
FROM customers c;

--	7.	How many products do we carry?
SELECT COUNT(p.id)
FROM products p;

--	8.	What is the total available on-hand quantity of diet pepsi?

SELECT SUM(wp.on_hand)
FROM products p
	JOIN warehouse_product wp ON p.id = wp.product_id
WHERE p.description = 'diet pepsi';