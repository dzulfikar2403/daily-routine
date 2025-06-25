with highest_salary_in_dep as (
    select department,
            first_name,
            salary,
            dense_rank() over(
                partition by department
                order by salary desc
            ) as rank_by_dep
    from employee
)
select department,
        first_name,
        salary
from highest_salary_in_dep
where rank_by_dep = 1;
-- link soal: https://platform.stratascratch.com/coding/9897-highest-salary-in-department?code_type=1