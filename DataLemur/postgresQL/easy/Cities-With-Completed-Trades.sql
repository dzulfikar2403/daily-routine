SELECT city,
        count(user_id) filter (where status ilike 'completed')
FROM trades
left join users using(user_id)
group by city 
order by count desc
limit 3;
-- link soal: https://datalemur.com/questions/completed-trades