-- Write your PostgreSQL query statement below
select e.employee_id
from employees e
left join employees man on (e.manager_id = man.employee_id)
where e.salary < 30000 and e.manager_id is not null and man.employee_id is null
order by employee_id;
-- ini soal subquery. bisa diubah dengan subquery serta lebih ringkas