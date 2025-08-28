-- Write your PostgreSQL query statement below
with compare_with_yesterday as (
    select id,
        temperature,
        recordDate,
        lag(temperature) over(
            order by recordDate::date
        ) as temperature_yesterday,
        lag(recordDate) over(
            order by recordDate::date
        ) as recordDate_yesterday
    from weather
)
select id
from compare_with_yesterday
where temperature > temperature_yesterday and (recordDate - recordDate_yesterday) = 1;
-- pastikan temperature lebih besar dari temperatu kemarin, serta hari ini dan row sebelumnya hanya berselisih 1 hari (untuk memastikan wakut kemarin)
-- link soal: https://leetcode.com/problems/rising-temperature/description/