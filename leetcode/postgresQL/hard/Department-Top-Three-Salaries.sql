-- Write your PostgreSQL query statement below
with cte as (
    select d.name as department,
            e.name as employee,
            e.salary,
            dense_rank() over(
                partition by d.name
                order by e.salary desc
            )
    from employee e
    left join department d on (e.departmentId = d.id)
)
select department,
        employee,
        salary
from cte
where dense_rank between 1 and 3;
-- link soal: https://leetcode.com/problems/department-top-three-salaries