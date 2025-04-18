-- Creating Database 
CREATE DATABASE ecommerce;

-- Using Created Database
USE ecommerce;

-- Creating Tables 
-- 1.Customers Table :-
CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
	name VARCHAR(100),
	email VARCHAR(150),
	address VARCHAR(300)
);

-- 2.Orders Table :-
CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id),
	order_date DATE,
	total_amount DECIMAL(10,2)
);

-- 3.Products Table :-
CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
	name VARCHAR(200),
	price DECIMAL(10,2),
	description VARCHAR(300)
);

-- Insert Sample Data into Tables
-- 1.Insert Sample Data into Customers Table :-
INSERT INTO customers(name, email, address) 
VALUES 	('Logu', 'logu@gmail.com','53, Norway Street, Chennai - 600001'),
		('Ramu', 'ramu@gmail.com','50, Ganesh Street, Salem - 636501'),
        ('Karthick', 'karthick@gmail.com','29, Krishna Street, Erode - 637101'),
        ('Nandha', 'nandha@gmail.com','53, Adhiyaman Street, Chennai - 600001'),
        ('Deepak', 'deepak@gmail.com','53, Gandhi Street, Chennai - 600001');
        
-- 2.Insert Sample Data into Orders Table :-
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES	(1,'2025-03-01', 5000),
		(2,'2025-03-10', 2000),
        (3,'2025-03-15', 500),
        (4,'2025-03-25', 750),
        (5,'2025-03-31', 100),
        (1,'2025-03-10', 2500),
        (2,'2025-04-08', 3000),
        (3,'2025-04-14', 150),
        (4,'2025-04-17', 100),
        (5,'2025-04-18', 4700);

-- 3.Insert Sample Data into Orders Table :-
INSERT INTO products(name, price, description)
VALUES	('Product-A', 50, 'Description-A'),
		('Product-B', 100, 'Description-B'),
        ('Product-C', 75, 'Description-C'),
        ('Product-D', 150, 'Description-D'),
        ('Product-E', 30, 'Description-E');

-- Queries :-
-- Retrieving all customers who have placed an order in the last 30 days.        
SELECT 
	id AS Customer_ID, 
	name AS Customer_Name, 
    email AS Customer_Email, 
    address AS Customer_Address 
FROM customers
WHERE id IN (
    SELECT customer_id FROM orders
    WHERE order_date >= CURDATE() - INTERVAL 30 DAY
);

-- Getting the Total Amount of All Orders Placed by Each Customer.
SELECT 
	customer_id AS Customer_ID, 
    SUM(total_amount) AS Total_Spent
FROM orders
GROUP BY customer_id;

-- Updating the Price of Product-C to 45.00 in Products Table.
UPDATE products
SET price = 45.00
WHERE name = 'Product-C';

-- Adding New Discount Column to the Products Table.
ALTER TABLE products
ADD discount DECIMAL(5,2) DEFAULT 0.00;

-- Retrieving the top 3 products with the highest price.
SELECT 
	id AS Product_ID, 
    name AS Product_Name, 
    price AS Product_Price,
    description AS Product_Description,
    discount as Discount 
FROM products
ORDER BY price DESC
LIMIT 3;

-- Normalize orders table with order_items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert Sample Data into order_items Table 
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 2),  -- 2x Product A
(2, 2, 1),  -- 1x Product B
(3, 3, 1),  -- 1x Product C
(4, 4, 1),  -- 1x Product D
(5, 5, 1);  -- 1x Product E
SELECT * FROM order_items;

-- Get names of customers who ordered Product A
SELECT DISTINCT customers.name AS Customer_Name FROM customers 
JOIN orders ON customers.id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE products.name = 'Product-A';

-- Joining Orders & Customers Tables to retrieve the Customer's Name & Order Date for Each Order. 
SELECT 
    orders.id AS Order_ID,
    customers.name AS Customer_Name,
    orders.order_date AS Order_Date
FROM orders 
JOIN customers  ON orders.customer_id = customers.id
ORDER BY orders.order_date;

-- Retrieving Orders with a Total Amount greater than 150.00
SELECT 
    orders.id AS Order_ID,
    customers.name AS Customer_Name,
    orders.order_date AS Order_Date,
    orders.total_amount AS Total_Amount
FROM orders
JOIN customers ON orders.customer_id = customers.id
WHERE orders.total_amount > 150.00
ORDER BY orders.total_amount DESC;

-- Retrieving the Average Total Amount of All Orders
SELECT 
    ROUND(AVG(total_amount), 2) AS Average_Order_Total
FROM orders;
