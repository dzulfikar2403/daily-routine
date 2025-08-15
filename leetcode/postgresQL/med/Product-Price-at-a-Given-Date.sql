-- Write your PostgreSQL query statement below
select product_id,
        new_price as price
from products
where (product_id,change_date) in (
    select product_id,max(change_date) 
    from products 
    where change_date <= '2019-08-16'::date
    group by product_id) 
union
select product_id,
    10 as price
from products
group by product_id
having min(change_date) > '2019-08-16'::date;
-- l question...
-- link soal: https://leetcode.com/problems/product-price-at-a-given-date/description/