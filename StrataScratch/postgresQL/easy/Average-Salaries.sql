with avg_salary_by_dep as (
    select department, 
            avg(salary) avg_salary
    from employee
    group by department
)
select e.department,
        e.first_name,
        e.salary,
        a.avg_salary
from employee e
inner join avg_salary_by_dep a on (e.department = a.department)
order by department;
-- link soal: https://platform.stratascratch.com/coding/9917-average-salaries?code_type=1