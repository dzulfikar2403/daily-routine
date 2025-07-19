SELECT u.city,
        count(t.order_id) filter (where t.status = 'Completed') total_orders
FROM trades t
left join users u on(t.user_id = u.user_id)
group by u.city
order by total_orders desc 
limit 3;
-- link soal: https://datalemur.com/questions/completed-trades