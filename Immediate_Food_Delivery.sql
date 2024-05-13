-- Immediate Food Delivery Problem goes as follow: 
-- Get the average number of immediate orders from an order table where the pref_order_date = order_date and it's the customer's first order 
/*
Table Structure: 
delivery_id int
customer_id int
order_date date
customer_pref_delivery_date
*/

WITH firstOrders AS (
    SELECT 
    customer_id,
    MIN(order_date) as min_order_date
    FROM delivery
    GROUP BY customer_id
),
immediateFirstOrders AS (
SELECT 
delivery.customer_id,
SUM(CASE 
WHEN customer_pref_delivery_date = firstOrders.min_order_date 
THEN 1
ELSE 0 END) AS immediateOrders
FROM delivery
JOIN firstOrders ON 
delivery.customer_id = firstOrders.customer_id
GROUP BY delivery.customer_id
)
SELECT 
ROUND (AVG(IMMEDIATEORDERS) * 100, 2) AS 
immediate_percentage 
FROM immediateFirstOrders
