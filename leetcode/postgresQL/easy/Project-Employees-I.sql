-- Write your PostgreSQL query statement below
select p.project_id,
        round(avg(e.experience_years),2) average_years
from employee e
inner join project p on (e.employee_id = p.employee_id)
group by p.project_id
order by p.project_id