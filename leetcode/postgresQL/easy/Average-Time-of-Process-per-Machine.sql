-- Write your PostgreSQL query statement below
with cte as (
    select machine_id,
        process_id,
        sum(timestamp) filter (where activity_type = 'end') - sum(timestamp) filter (where activity_type = 'start') as time_process_per_machine
from activity
group by machine_id,process_id 
)
select machine_id,
        round(avg(time_process_per_machine)::decimal,3) as processing_time 
from cte 
group by machine_id;
-- link soal: https://leetcode.com/problems/average-time-of-process-per-machine/description/