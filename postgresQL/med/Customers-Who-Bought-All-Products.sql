-- Write your PostgreSQL query statement below
with total_product as (
    select count(product_key)
    from product
)
select customer_id
from customer c
group by customer_id
having count(distinct product_key) = (select * from total_product);