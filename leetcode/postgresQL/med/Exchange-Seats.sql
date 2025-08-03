-- Write your PostgreSQL query statement below
with cte as (
    select id,
        case
            when id % 2 = 1 then id + 1
            when id % 2 = 0 then id - 1
        end as seat_swap
    from seat
)
select coalesce(c.id,s.id) as id,
        s.student
from seat s
left join cte c on (s.id = c.seat_swap)
order by c.id;
-- link soal: https://leetcode.com/problems/exchange-seats/description/
