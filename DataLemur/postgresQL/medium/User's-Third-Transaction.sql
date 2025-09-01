with rank_transaction_each_user as (
  SELECT *,
          row_number() over(
            partition by user_id 
            order by transaction_date
          ) as rank
  FROM transactions
)
select user_id,
        spend,
        transaction_date
from rank_transaction_each_user
where rank = 3;
-- link soal: https://datalemur.com/questions/sql-third-transaction