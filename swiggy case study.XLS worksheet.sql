# 1 Find the customer who have never orderd
SELECT name 
FROM users 
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM orders);

#2 Average price of dishes
SELECT f.f_name, avg(m.price) as avg_price
FROM menu m
JOIN food f ON m.f_id = f.f_id
GROUP BY f.f_name

#3 Find the top restaurants in term of the numbers of the orders for a given month
SELECT r.r_name, COUNT(o.order_id) as total_orders
FROM orders o
JOIN restaurants r ON o.r_id = r.r_id
WHERE DATE_FORMAT(o.date, '%Y-%m') = '2022-06'
GROUP BY r.r_name
ORDER BY total_orders DESC
LIMIT 1;

# 4Restaurants with monthly sales grater then x amount
SELECT r.r_name, SUM(o.amount) as revenue
FROM orders o 
JOIN restaurants r on o.r_id = r.r_id
WHERE date_format(o.date, '%Y-%m') = '2022-06'
GROUP BY r.r_name
HAVING revenue > 500;


# 5show all orders with orders details for a particular cutoner in a particualr date range 
SELECT o.order_id, r.r_name, f.f_name, o.amount, o.date
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN food f ON od.f_id = f.f_id
JOIN restaurants r ON o.r_id = r.r_id
WHERE o.user_id = 1 
  AND o.date BETWEEN '2022-05-10' AND '2022-07-10';
  
  
  #6 Find restaurants with max repeated customers
SELECT r.r_name, COUNT(*) as loyal_customers
FROM ( 
       SELECT r_id, user_id, COUNT(*) as visits
       FROM orders 
       GROUP BY r_id, user_id 
       HAVING visits > 1 
       ) t 
JOIN restaurants r ON t.r_id = r.r_id
GROUP BY r.r_name
ORDER BY loyal_customers DESC
LIMIT 1;


#7Month over month revenue growth of Swiggy
WITH monthly_sales AS (
    SELECT DATE_FORMAT(date, '%Y-%m') as month, SUM(amount) as revenue
    FROM orders
    GROUP BY month
)
SELECT month, revenue,
       LAG(revenue, 1) OVER (ORDER BY month) as prev_month_revenue,
       ((revenue - LAG(revenue, 1) OVER (ORDER BY month)) / LAG(revenue, 1) OVER (ORDER BY month)) * 100 as growth_pct
FROM monthly_sales;


# 8 Month over month revenue growth of Swiggy
WITH monthly_sales AS (
    SELECT DATE_FORMAT(date, '%Y-%m') as month, SUM(amount) as revenue
    FROM orders
    GROUP BY month
)
SELECT month, revenue,
       LAG(revenue, 1) OVER (ORDER BY month) as prev_month_revenue,
       ((revenue - LAG(revenue, 1) OVER (ORDER BY month)) / LAG(revenue, 1) OVER (ORDER BY month)) * 100 as growth_pct
FROM monthly_sales;