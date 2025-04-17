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
        (1,'2025-04-01', 2500),
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

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;