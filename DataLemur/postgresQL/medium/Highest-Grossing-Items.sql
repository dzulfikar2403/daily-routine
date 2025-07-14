with cte as (
SELECT category,
        product,
        sum(spend) total_spend,
        dense_rank() over(
          PARTITION by category
          order by category asc,sum(spend) desc
        )
FROM product_spend
where extract(year from transaction_date) = '2022'
group by category,product
)
select category,
        product,
        total_spend
from cte
where dense_rank BETWEEN 1 and 2;
-- link soal: https://datalemur.com/questions/sql-highest-grossing