-- Write your PostgreSQL query statement below
select name
from employee
where id in (
    select managerId
    from employee  
    group by managerId
    having count(id) >= 5
)