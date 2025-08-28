with cte as(
  SELECT  transaction_date,
          user_id,
          count(product_id) as purchase_count,
          dense_rank() over(
            partition by user_id
            order by transaction_date desc
          )
  FROM user_transactions
  group by transaction_date,user_id
)
select transaction_date,
        user_id,
        purchase_count
from cte
where dense_rank = 1
order by transaction_date;
-- link soal: https://datalemur.com/questions/histogram-users-purchases