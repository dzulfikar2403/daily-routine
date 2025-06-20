-- Write your PostgreSQL query statement below
with cte as (
    select activity_date as day,
            user_id as active_users
    from activity
    where  activity_date > '2019-07-27'::timestamp - interval '30day' and activity_date <= '2019-07-27'::timestamp
    group by day,user_id
)
select day,
        count(active_users) as active_users
from cte 
group by day
order by day;

-- solution
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE (activity_date > "2019-06-27" AND activity_date <= "2019-07-27")
GROUP BY activity_date; -- ternyata agg func columnnya bisa di distinct cu..!!