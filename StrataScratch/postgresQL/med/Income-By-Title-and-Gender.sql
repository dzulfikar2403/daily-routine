with total_bonus_each_emp as (
    select worker_ref_id,
            sum(bonus) as total_bonus
    from sf_bonus
    group by worker_ref_id
)
select e.employee_title,
        e.sex,
        avg(e.salary + tbem.total_bonus)
from sf_employee e
inner join total_bonus_each_emp tbem on (e.id = tbem.worker_ref_id)
group by employee_title,sex;
-- link soal: https://platform.stratascratch.com/coding/10077-income-by-title-and-gender?code_type=1