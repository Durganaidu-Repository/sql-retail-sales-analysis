
# Retail Sales Analysis Using SQL

## 📌 Project Overview
This project focuses on analyzing retail sales data using SQL to extract meaningful business insights such as customer behavior, sales performance, top products, and revenue trends.  
It is designed to showcase **SQL skills for fresher Data Analyst / SQL roles**.

---

## 🎯 Objectives
- Analyze customer purchasing behavior
- Identify top customers and best-selling products
- Track revenue trends over time
- Practice real-world SQL querying techniques

---

## 🛠 Tools & Technologies
- SQL (MySQL / PostgreSQL)
- MySQL Workbench / DB Browser
- CSV datasets imported into SQL tables

---

## 🗂 Database Schema

### Customers
| customer_id | customer_name | city | signup_date |

### Orders
| order_id | customer_id | order_date | total_amount |

### Order_Items
| item_id | order_id | product_id | quantity | price |

### Products
| product_id | product_name | category |

---

## 📊 Business Questions & SQL Queries

### 1. Total Revenue Generated
```sql
SELECT SUM(total_amount) AS total_revenue
FROM orders;
```

---

### 2. Top 5 Customers by Total Spend
```sql
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
```

---

### 3. Monthly Sales Trend
```sql
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;
```

---

### 4. Customers with No Orders
```sql
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

---

### 5. Best-Selling Products
```sql
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;
```

---

### 6. Revenue by Product Category
```sql
SELECT p.category, SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;
```

---

### 7. Customers Who Spent More Than Average
```sql
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) >
       (SELECT AVG(total_amount) FROM orders);
```

---

### 8. Highest Order per Customer (Window Function)
```sql
SELECT customer_id, order_id, total_amount
FROM (
    SELECT customer_id, order_id, total_amount,
           RANK() OVER (PARTITION BY customer_id ORDER BY total_amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = 1;
```

---

## ✅ SQL Concepts Demonstrated
- Joins (INNER, LEFT)
- Aggregate functions (SUM, AVG, COUNT)
- Subqueries & Correlated Subqueries
- Window Functions (RANK)
- GROUP BY & HAVING
- Date-based analysis

---

## 📌 Resume Description
**Retail Sales Analysis using SQL**
- Designed and analyzed a retail sales database using SQL to derive business insights.
- Used complex queries involving joins, subqueries, window functions, and aggregations.
- Analyzed customer spending patterns, monthly sales trends, and product performance.
- Identified top customers, best-selling products, and revenue by category.

---

## 👤 Author
**Durga Rao Thaddi**  
B.Sc Computers | Data Science Learner  

---

⭐ *This project is created for learning and interview preparation purposes.*
