with cte as (
  SELECT EXTRACT(year from transaction_date) as year,
          product_id,
          sum(spend) as curr_year_spend,
          lag(sum(spend),1) over(
            partition by product_id
            order by EXTRACT(year from transaction_date)
          ) as prev_year_spend
  FROM user_transactions
  group by year,product_id
)
select *,
        round(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100,2) as yoy_rate
from cte;
-- link soal: https://datalemur.com/questions/yoy-growth-rate