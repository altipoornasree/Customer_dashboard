

-- SELECT gender,SUM(purchase_amount) as revunue_generated_by_female_customer
-- FROM customer_records
-- GROUP BY gender
--Q2 which are top5 products with highest ratings
-- SELECT category,ROUND(AVG(review_rating) :: NUMERIC,2) as avg_review
-- FROM customer_records
-- GROUP BY category
-- ORDER BY avg_review DESC LIMIT 5
-- Q3 which customer use discount but still spent more money than avg purchase amount
-- SELECT customer_id ,purchase_amount FROM customer_records
-- WHERE discount_applied='Yes'
-- AND purchase_amount>(SELECT AVG(purchase_amount) FROM customer_records)
--q4 compare the avg purchase amount between standard and express shipping
-- SELECT shipping_type,AVG(purchase_amount) as avg_price
-- FROM customer_records
-- GROUP BY shipping_type
-- HAVING shipping_type IN ('Standard','Express')
--q5  do subscribers customers spend more or non subscribed compare avg spend and total spend between themn
--q6 seggrigating the customer based upon the prexious purchase
-- with new as(
--     SELECT customer_id,previous_purchases,
--     CASE 
--         WHEN previous_purchases=1 THEN 'NEW'
--         WHEN previous_purchases BETWEEN 2 AND 20 THEN 'Returning'
--         WHEN previous_purchases >20 THEN 'LOyal'
--         END  as details
--     FROM customer_records
-- )
-- SELECT details ,COUNT(customer_id)
-- FROM new 
-- GROUP BY details
--q7 in each category we should write the top 3 products


