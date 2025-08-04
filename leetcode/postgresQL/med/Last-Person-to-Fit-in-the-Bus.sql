-- Write your PostgreSQL query statement below
with queue_with_total_weight as (
    select turn,
        person_id,
        person_name,
        weight,
        sum(weight) over(
            order by turn
        ) as total_weight
    from queue 
)
select person_name 
from queue_with_total_weight
where total_weight <= 1000
order by turn desc
limit 1;
-- link soal: https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/