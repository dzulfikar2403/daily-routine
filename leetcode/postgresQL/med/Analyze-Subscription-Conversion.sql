-- Write your PostgreSQL query statement below
select user_id,
        round(avg(activity_duration) filter (where activity_type ilike 'free_trial') ,2) as trial_avg_duration,
        round(avg(activity_duration) filter (where activity_type ilike 'paid') ,2) as paid_avg_duration
from useractivity
where user_id in (select user_id from useractivity where activity_type in ('paid'))
group by user_id
order by user_id;
-- link soal: https://leetcode.com/problems/analyze-subscription-conversion/description/