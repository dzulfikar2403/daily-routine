SELECT app_id,
        round(count(*) filter (where event_type = 'click')::decimal / count(*) filter (where event_type = 'impression') * 100 ,2) as ctr
FROM events
where extract(year from timestamp) = 2022
group by app_id;
-- link soal: https://datalemur.com/questions/click-through-rate