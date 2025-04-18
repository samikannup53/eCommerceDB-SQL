# 🛒 E-Commerce Database Management System

This project demonstrates a simple **E-Commerce** system using SQL to manage **customers**, **orders**, and **products**. It allows the creation and management of key tables, sample data, and SQL queries to interact with the database.

## 🗂️ **Database Structure**

1. **Customers Table**: Stores customer details such as name, email, and address.
2. **Orders Table**: Records customer orders including order date, total amount, and the customer who placed the order.
3. **Products Table**: Contains information about products such as name, price, and description.
4. **Order Items Table**: Normalizes the orders by linking products to the specific order along with quantity.

## 🛠️ **Features**

- 📥 **Create Database & Tables**: Sets up tables for customers, orders, products, and their relationships.
- 📊 **Data Insertion**: Sample data for customers, orders, and products.
- 🔄 **SQL Queries**: Several key queries to retrieve relevant information like customer spending, order details, product price updates, and average order totals.
- 🧑‍💻 **Normalization**: Normalizes the orders table by creating an `order_items` table to handle product and quantity relationships.
  
## 💻 **Key Queries**

- **Retrieve Customers Who Ordered in the Last 30 Days**: Identifies active customers.
- **Total Amount Spent by Each Customer**: Retrieves the total amount spent by each customer.
- **Update Product Price**: Modify product prices in the database.
- **Add Discount to Products**: Adds a discount column to the products table.
- **Top 3 Products by Price**: Identifies the top-priced products.
- **Retrieve Orders Over 150**: Lists orders where the total amount exceeds $150.
- **Average Order Amount**: Calculates the average order value for all orders.

## 🚀 **Tech Stacks**
- **SQL** : MySQL for database management
- **Database Design** : Relational tables for customers, orders, and products
