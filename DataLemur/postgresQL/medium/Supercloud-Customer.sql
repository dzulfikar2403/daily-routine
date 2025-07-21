with category as (
  SELECT distinct product_category FROM products
)
select cc.customer_id
from customer_contracts cc
left join products p on (cc.product_id = p.product_id)
group by customer_id
having count(distinct p.product_category) = (select count(*) from category);
-- link soal: https://datalemur.com/questions/supercloud-customer