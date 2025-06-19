-- Write your PostgreSQL query statement below
select s.product_id,
        year first_year,
        quantity,
        price
from sales s
where (product_id,year) in (select product_id,min(year) from sales group by product_id)