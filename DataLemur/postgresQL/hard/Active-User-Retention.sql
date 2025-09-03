with user_active_july_june as (
  SELECT EXTRACT(month from event_date) as month,
          user_id,
          count(distinct user_id) filter (where event_type in ('sign-in', 'like', 'comment'))
  FROM user_actions
  where EXTRACT(month from event_date) in (6,7) and EXTRACT(year from event_date) = 2022
  group by month,user_id
)
select month as month,
        count(distinct user_id) as active_unique_user_july_june_2022
from user_active_july_june
where month = 7 and user_id in (
  select user_id
  from user_active_july_june
  where month = 6
)
group by month;
-- link soal: https://datalemur.com/questions/user-retention