-- Write your PostgreSQL query statement below
SELECT 
    p1.product_id AS product1_id,
    p2.product_id AS product2_id,
    pi1.category as product1_category,
    pi2.category as product2_category,
    COUNT(DISTINCT p1.user_id) AS customer_count
FROM ProductPurchases p1
inner join ProductPurchases p2 on (p1.user_id = p2.user_id)
left join ProductInfo pi1 on (p1.product_id = pi1.product_id)
left join ProductInfo pi2 on (p2.product_id = pi2.product_id)
where p1.product_id < p2.product_id
group by p1.product_id,p2.product_id,pi1.category,pi2.category
having COUNT(DISTINCT p1.user_id) >= 3
order by customer_count desc, p1.product_id asc, p2.product_id asc; 
-- link soal: https://leetcode.com/problems/find-product-recommendation-pairs/description/