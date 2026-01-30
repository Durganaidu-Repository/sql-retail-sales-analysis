-- 1. Total revenue by region
SELECT region,
       SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;


-- 2. Top-selling products by revenue
SELECT product,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;


-- 3. Monthly sales trend
SELECT MONTH(order_date) AS month,
       SUM(quantity * price) AS monthly_revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;


-- 4. Customers with highest total spending
SELECT customer_id,
       SUM(quantity * price) AS total_spent
FROM sales
GROUP BY customer_id
ORDER BY total_spent DESC;


-- 5. Category-wise revenue greater than 50,000
SELECT category,
       SUM(quantity * price) AS category_revenue
FROM sales
GROUP BY category
HAVING SUM(quantity * price) > 50000;
