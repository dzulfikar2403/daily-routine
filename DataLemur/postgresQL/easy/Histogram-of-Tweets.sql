with cte as (
  SELECT user_id,
        count(tweet_id)
FROM tweets
where extract(year from tweet_date) = 2022
group by user_id
order by 1
)
select count,
        count(distinct user_id)
from cte
group by 1;
-- link soal: https://datalemur.com/questions/sql-histogram-tweets