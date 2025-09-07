with cte as (
  SELECT user_id,
        transaction_date,
        count(user_id) OVER (
          partition by user_id
          ORDER BY transaction_date
          RANGE BETWEEN INTERVAL '3day' PRECEDING AND CURRENT ROW
        ) as total_consecutive_each_user
  FROM transactions
)
select distinct user_id
from cte
where total_consecutive_each_user >= 3;
-- link soal: https://datalemur.com/questions/amazon-shopping-spree