select e.first_name,
        e.salary
from employee e
left join employee man on (e.manager_id = man.id)
where e.salary > man.salary;
-- link soal: https://platform.stratascratch.com/coding/9894-employee-and-manager-salaries?code_type=1