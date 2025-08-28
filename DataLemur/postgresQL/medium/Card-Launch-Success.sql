with cte as (
  SELECT card_name,
        issued_amount,
        issue_month,
        issue_year,
        dense_rank() over(
          partition by card_name
          order by issue_year,issue_month
        )
  FROM monthly_cards_issued
)
select card_name,
        issued_amount
from cte
where dense_rank = 1
order by issued_amount desc;
-- link soal: https://datalemur.com/questions/card-launch-success