-- Write your PostgreSQL query statement below
with singleNumber as (
    select num
from MyNumbers
group by num
having count(num) = 1
)
select max(num) num
from singleNumber  