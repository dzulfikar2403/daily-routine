-- Write your PostgreSQL query statement below
with cte as (
    select visited_on,
            sum(amount) as sum_amount_a_day
    from customer
    group by visited_on
)
select visited_on,
        sum(sum_amount_a_day) over(
            order by visited_on
            range between interval '6 day' preceding and current row
        ) as amount ,
        round(avg(sum_amount_a_day) over(
            order by visited_on
            range between interval '6 day' preceding and current row
        ),2) as average_amount
from cte
group by visited_on,sum_amount_a_day
order by visited_on
offset 6;
-- link soal: https://leetcode.com/problems/restaurant-growth/description/