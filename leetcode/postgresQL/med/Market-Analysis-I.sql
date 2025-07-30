-- Write your PostgreSQL query statement below
select u.user_id as buyer_id,
        u.join_date,
        count(o.order_id) filter (where extract(year from o.order_date) = 2019) as orders_in_2019
from users u
left join orders o on (u.user_id = o.buyer_id)
group by u.user_id,u.join_date
order by join_date;
-- link soal: https://leetcode.com/problems/market-analysis-i/description/