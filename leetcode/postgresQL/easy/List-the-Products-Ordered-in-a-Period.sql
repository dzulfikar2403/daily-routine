-- Write your PostgreSQL query statement below
select p.product_name,
        sum(o.unit) as unit
from products p
join orders o using (product_id) 
where to_char(order_date,'MM-yyyy') = '02-2020'
group by product_name
having sum(o.unit) >= 100;
-- link soal: https://leetcode.com/problems/list-the-products-ordered-in-a-period