# SQL E-commerce Sales & Customer Analysis

## Overview

This project uses SQL to analyze an e-commerce dataset and identify business insights related to sales, customers, products, categories, orders, delivery, and customer reviews.

The analysis was performed using PostgreSQL and pgAdmin.

The project focuses on using SQL to answer practical business questions and convert the results into findings and recommendations.

_______

## Business Problem

An e-commerce business generates data across different areas such as customers, orders, products, payments, sellers, and reviews.

The business needs to understand:

* How much revenue is being generated?
* Which product categories generate the most revenue?
* Which categories sell the most items?
* Which products generate the most revenue?
* How much do customers spend?
* Do customers make repeat purchases?
* How does revenue change over time?
* How long do orders take to be delivered?
* How many orders are delivered late?
* Is there a relationship between delivery status and customer review scores?

SQL was used to retrieve, combine, filter, group, and summarize the data to answer these questions.

_______

## Objective

The objectives of this project were to:

* Analyze overall sales performance.
* Compare revenue and sales volume across product categories.
* Identify high-revenue products.
* Analyze customer spending and repeat purchasing behavior.
* Examine revenue over time.
* Analyze order delivery performance.
* Compare customer review scores for late and on-time deliveries.
* Convert the SQL results into business findings and recommendations.

_______

## Dataset

The dataset contains e-commerce information across multiple related tables.

The tables used in the project include:

* `customers`
* `orders`
* `order_items`
* `order_payments`
* `order_reviews`
* `products`
* `sellers`
* `geolocation`
* `product_category_translation`

The data contains information about customers, orders, products, payments, sellers, delivery dates, product categories, and customer reviews.

_______

## Tools Used

* PostgreSQL
* pgAdmin
* SQL

_______

## Data Preparation

The dataset was imported into PostgreSQL and organized into separate tables.

The tables were checked and used according to their relationships.

Examples of relationships used during the analysis included:

* Customers → Orders
* Orders → Order Items
* Orders → Payments
* Orders → Reviews
* Order Items → Products
* Order Items → Sellers

SQL joins were used when information from more than one table was required.

_______

## SQL Analysis

The analysis used basic SQL operations to answer the business questions.

The main SQL concepts used were:

* `SELECT`
* `FROM`
* `WHERE`
* `JOIN`
* `LEFT JOIN`
* `ON`
* `SUM()`
* `AVG()`
* `COUNT()`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `CASE WHEN`
* `DATE_TRUNC()`

These were used to retrieve data, combine tables, calculate totals and averages, group results, identify patterns, and compare different business segments.

_______

## Key Business Findings

### 1. Overall Revenue

The total revenue calculated from the analyzed order items was approximately **13.59 million**.

The average order value was approximately **137.75**.

_______

### 2. Category Performance

**Cama, Mesa e Banho** had the highest number of items sold among the categories analyzed, with **11,115 items**.

However, the category with the highest revenue was **Beleza e Saúde**, generating approximately **1.26 million**.

**Relógios e Presentes** was also a high-revenue category, generating approximately **1.21 million**.

This shows that the category selling the highest number of items is not necessarily the category generating the highest revenue.

_______

### 3. Product Performance

The highest-revenue product identified in the analysis generated approximately **63,885** in revenue.

The analysis grouped products by product ID and calculated their revenue to identify the highest-revenue products.

_______

### 4. Product Price Differences

Average product prices varied considerably between categories.

For example:

* `pcs` had an average price of approximately **1,098.34**.
* `portateis_casa_forno_e_cafe` had an average price of approximately **624.29**.
* `relogios_presentes` had an average price of approximately **201.14**.
* `telefonia` had an average price of approximately **71.21**.
* `casa_conforto_2` had an average price of approximately **25.34**.

This shows that categories differ substantially in their average product price.

_______

### 5. Revenue Over Time

Monthly revenue was analyzed using the order date information and `DATE_TRUNC()`.

The results showed changes in revenue across different months, with revenue increasing substantially during parts of the analyzed period.

For example, the monthly results included approximately:

* **January 2017:** 80,124.74
* **May 2017:** 505,655.46
* **September 2017:** 617,046.12
* **November 2017:** 883,351.63
* **May 2018:** 1,084,358.55
* **August 2018:** 1,072,147.70

_______

### 6. Delivery Performance

The analysis identified approximately **83,042 late orders**.

Delivery performance was analyzed by comparing the order purchase date with the customer delivery date.

A `CASE WHEN` statement was used to classify orders according to their delivery status.

_______

### 7. Delivery Status and Review Scores

The average review score for on-time deliveries was approximately **3.98**.

The average review score for late deliveries was approximately **4.11**.

Therefore, the results of this analysis did **not** show that late deliveries automatically resulted in lower average review scores.

Other factors may also influence customer review scores.

_______

## Business Recommendations

Based on the analysis, the following recommendations can be considered:

### 1. Monitor Revenue and Sales Volume Together

The business should monitor both the number of items sold and the revenue generated.

A category can sell a large number of products without generating the highest revenue, so both measures are useful when evaluating performance.

### 2. Investigate High-Revenue Categories

Categories such as **Beleza e Saúde** and **Relógios e Presentes** generated high revenue in the analysis.

These categories could be investigated further to understand their product mix, pricing, and demand.

### 3. Monitor High-Revenue Products

High-revenue products should be monitored for continued demand, inventory availability, pricing, and customer feedback.

### 4. Compare Categories by Price

The large differences in average category prices suggest that categories should be considered separately when analyzing sales performance.

High-volume, lower-priced categories may require a different business approach from lower-volume, higher-priced categories.

### 5. Investigate Late Orders

The large number of late orders suggests that delivery performance should be investigated further.

The business could examine late orders by:

* Seller
* Product category
* Location
* Time period

This could help identify where delivery delays occur most frequently.

### 6. Do Not Assume Late Delivery Is the Only Cause of Lower Reviews

The review-score analysis did not show lower average scores for late deliveries in this dataset.

Therefore, customer satisfaction should be analyzed using multiple factors rather than assuming that delivery status alone explains review scores.

_______

## Conclusion

This project demonstrated how SQL can be used to analyze e-commerce data and answer practical business questions.

The analysis covered sales performance, category revenue, product performance, customer behavior, revenue over time, delivery performance, and customer reviews.

The project also showed the importance of combining SQL results with business interpretation rather than looking only at individual numbers.

_______

## Skills Demonstrated

* SQL data retrieval
* Filtering data
* Joining related tables
* Aggregating data using `SUM()`, `AVG()`, and `COUNT()`
* Grouping data using `GROUP BY`
* Sorting and limiting results
* Conditional logic using `CASE WHEN`
* Date-based analysis using `DATE_TRUNC()`
* Basic customer and sales analysis
* Delivery performance analysis
* Translating SQL results into business findings
* Developing business recommendations from data

_______

## Project Files

* `README.md` — Project overview, analysis, findings, and recommendations
* `sql/ecommerce_analysis.sql` — SQL queries used for the analysis
* `images/` — Selected screenshots of SQL results
