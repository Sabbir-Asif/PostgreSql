CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price NUMERIC(10, 2),
    sale_date DATE
);



INSERT INTO sales (customer_name, product, category, quantity, price, sale_date) VALUES
('Alice', 'Laptop', 'Electronics', 1, 1200.00, '2025-01-10'),
('Bob', 'Smartphone', 'Electronics', 2, 800.00, '2025-01-12'),
('Charlie', 'Headphones', 'Electronics', 3, 150.00, '2025-02-15'),
('Alice', 'Desk Chair', 'Furniture', 1, 180.00, '2025-02-18'),
('Eve', 'Notebook', 'Stationery', 5, 20.00, '2025-02-20'),
('Frank', 'Desk', 'Furniture', 1, 300.00, '2025-03-01'),
('Grace', 'Pen', 'Stationery', 10, 2.50, '2025-03-04'),
('Bob', 'Monitor', 'Electronics', 1, 250.00, '2025-03-10'),
('Eve', 'Tablet', 'Electronics', 1, 400.00, '2025-03-15'),
('Charlie', 'Office Chair', 'Furniture', 2, 150.00, '2025-03-20'),
('Alice', 'Whiteboard', 'Stationery', 1, 45.00, '2025-03-22'),
('Frank', 'Mouse', 'Electronics', 2, 25.00, '2025-03-25'),
('Grace', 'Keyboard', 'Electronics', 1, 70.00, '2025-03-27'),
('Bob', 'Desk Lamp', 'Furniture', 1, 60.00, '2025-04-01'),
('Charlie', 'Notebook', 'Stationery', 3, 20.00, '2025-04-03'),
('Eve', 'Laptop', 'Electronics', 1, 1100.00, '2025-04-05'),
('Alice', 'Pen', 'Stationery', 20, 2.50, '2025-04-07'),
('Frank', 'Monitor', 'Electronics', 1, 270.00, '2025-04-10'),
('Grace', 'Desk', 'Furniture', 1, 320.00, '2025-04-12'),
('Bob', 'Headphones', 'Electronics', 1, 150.00, '2025-04-15'),
('Charlie', 'Tablet', 'Electronics', 1, 420.00, '2025-04-18'),
('Eve', 'Whiteboard', 'Stationery', 2, 45.00, '2025-04-20');



SELECT * FROM sales;

-- Total Revenue by Category
SELECT category, SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY category;

-- Customers with Total Purchase Quantity > 5
SELECT customer_name, SUM(quantity) AS total_items
FROM sales
GROUP BY customer_name
HAVING SUM(quantity) > 5;


-- Average Product Price per Category (rounded)
SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM sales
GROUP BY category;


-- SELECT category, COUNT(DISTINCT product) AS unique_products
SELECT category, COUNT(DISTINCT product) AS unique_products
FROM sales
GROUP BY category;

-- Monthly Revenue per Category
SELECT 
  DATE_TRUNC('month', sale_date) AS month,
  category,
  SUM(quantity * price) AS revenue
FROM sales
GROUP BY month, category
ORDER BY month, category;


-- SELECT customer_name, COUNT(DISTINCT product) AS products_bought
SELECT customer_name, COUNT(DISTINCT product) AS products_bought
FROM sales
GROUP BY customer_name
HAVING COUNT(DISTINCT product) > 1;

-- Top-Selling Product in Total Quantity
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 1;

-- Total Sales per Customer and Category

SELECT customer_name, category, SUM(quantity * price) AS total_spent
FROM sales
GROUP BY customer_name, category
ORDER BY customer_name, total_spent DESC;

-- High-Value Sales by Category (Average Sale > 500)
SELECT category, AVG(quantity * price) AS avg_sale_value
FROM sales
GROUP BY category
HAVING AVG(quantity * price) > 500;

