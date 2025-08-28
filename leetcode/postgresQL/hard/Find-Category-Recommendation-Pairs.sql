-- Write your PostgreSQL query statement below
with cte as (
    select pp.user_id,
            p1.category
    from productPurchases pp
    left join productInfo p1 on (p1.product_id = pp.product_id)
)
select c1.category as category1,
        c2.category as category2,
        count(distinct c1.user_id) as customer_count
from cte c1
inner join cte c2 on (c1.user_id = c2.user_id and c1.category < c2.category) 
group by category1,category2
having count(distinct c1.user_id) >= 3
order by customer_count desc,category1,category2;
-- link soal: https://leetcode.com/problems/find-category-recommendation-pairs/description/