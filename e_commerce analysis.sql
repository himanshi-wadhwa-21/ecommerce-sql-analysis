CREATE TABLE customers (
customer_id TEXT,
customer_unique_id TEXT,
customer_zip_code_prefix INTEGER,
customer_city TEXT,
customer_state TEXT
);

SELECT COUNT(*)
FROM customers;

SELECT*
FROM customers
LIMIT 5;

ALTER TABLE order
SELECT *
FROM orders
LIMIT 5;



-- 1. Check customer row count

SELECT COUNT(*)
FROM customers;


-- 2. Preview customer data

SELECT *
FROM customers
LIMIT 5;


-- 3. What is the total revenue?

SELECT
    SUM(price) AS total_revenue
FROM order_items;


-- 4. How much revenue did each product category generate
--    and how many items were sold?

SELECT
    products.product_category_name,
    SUM(order_items.price) AS category_revenue,
    COUNT(order_items.order_item_id) AS items_sold
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY items_sold DESC;


-- 5. Which products generated the most revenue?

SELECT
    products.product_id,
    SUM(order_items.price) AS product_revenue
FROM order_items
JOIN products
    ON products.product_id = order_items.product_id
GROUP BY products.product_id
ORDER BY product_revenue DESC
LIMIT 10;


-- 6. What is the average order value?

SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_totals;


-- 7. How did revenue change month by month?

SELECT
    DATE_TRUNC('month', orders.order_purchase_timestamp) AS month,
    SUM(order_items.price) AS monthly_revenue
FROM order_items
JOIN orders
    ON orders.order_id = order_items.order_id
GROUP BY month
ORDER BY month;


-- 8. Which product categories generated the most revenue?

SELECT
    products.product_category_name,
    SUM(order_items.price) AS category_revenue
FROM order_items
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY category_revenue DESC
LIMIT 10;


-- 9. Which customers spent the most?

SELECT
    orders.customer_id,
    SUM(order_items.price) AS total_spent,
    COUNT(DISTINCT orders.order_id) AS order_count
FROM order_items
JOIN orders
    ON order_items.order_id = orders.order_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;


-- 10. Which customers made more than one order?

SELECT
    orders.customer_id,
    SUM(order_items.price) AS total_spent,
    COUNT(DISTINCT orders.order_id) AS order_count
FROM order_items
JOIN orders
    ON order_items.order_id = orders.order_id
GROUP BY orders.customer_id
HAVING COUNT(DISTINCT orders.order_id) > 1
ORDER BY total_spent DESC;


-- 11. Which cities have the most customers?

SELECT
    customer_city,
    COUNT(DISTINCT customer_id) AS customer_count
FROM customers
GROUP BY customer_city
ORDER BY customer_count DESC;


-- 12. What percentage of revenue came from repeat customers?

SELECT
    SUM(repeat_customer_revenue)
    / (SELECT SUM(price) FROM order_items)
    * 100 AS repeat_customer_revenue_percentage
FROM (
    SELECT
        orders.customer_id,
        SUM(order_items.price) AS repeat_customer_revenue
    FROM order_items
    JOIN orders
        ON order_items.order_id = orders.order_id
    GROUP BY orders.customer_id
    HAVING COUNT(DISTINCT orders.order_id) > 1
) AS repeat_customers;


-- 13. How do product categories compare by sales volume,
--     average selling price, and revenue?

SELECT
    products.product_category_name,
    COUNT(order_items.order_item_id) AS items_sold,
    AVG(order_items.price) AS avg_selling_price,
    SUM(order_items.price) AS category_revenue
FROM order_items
JOIN products
    ON products.product_id = order_items.product_id
GROUP BY products.product_category_name
ORDER BY avg_selling_price DESC;


-- 14. Which product categories have the highest
--     average review scores?

SELECT
    products.product_category_name,
    AVG(order_reviews.review_score) AS average_review_score
FROM order_reviews
JOIN order_items
    ON order_reviews.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY products.product_category_name
ORDER BY average_review_score DESC;


-- 15. Which products have the fewest recorded sales?

SELECT
    products.product_id,
    COUNT(order_items.order_id) AS times_sold
FROM products
LEFT JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY products.product_id
ORDER BY times_sold ASC;


-- 16. What is the average delivery time?

SELECT
    AVG(
        order_delivered_customer_date
        - order_purchase_timestamp
    ) AS average_delivery_time
FROM orders;


-- 17. Which customer states have the longest
--     average delivery time?

SELECT
    customers.customer_state,
    AVG(
        orders.order_delivered_customer_date
        - orders.order_purchase_timestamp
    ) AS average_delivery_time
FROM orders
JOIN customers
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_state
ORDER BY average_delivery_time DESC
LIMIT 10;


-- 18. How many orders were delivered late?

SELECT
    SUM(
        CASE
            WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN 1
            ELSE 0
        END
    ) AS late_orders
FROM orders;


-- 19. Do late deliveries have different average
--     review scores?

SELECT
    CASE
        WHEN orders.order_delivered_customer_date
             > orders.order_estimated_delivery_date
        THEN 'late'
        ELSE 'not late'
    END AS delivery_status,
    AVG(order_reviews.review_score) AS average_review_score
FROM orders
JOIN order_reviews
    ON orders.order_id = order_reviews.order_id
GROUP BY delivery_status;


