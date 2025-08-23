-- identify project yang overbudget, overbudget = (total_gaji_project_karywan > budget_project),
-- convert gaji tahunan karyawan jadi per bulan project => (annual_salary * (day_project/365))
-- return project_name,project_budget,total_gaji_project_karyawan -> di round ke terdekat

with project_month as (
    select id,
            title,
            (end_date-start_date)::decimal as day
    from linkedin_projects
),
actual_expenses_budget as(
    select lp.title,
            lp.budget,
            ceiling(sum(le.salary * (pm.day / 365))) as expenses_budget
    from linkedin_projects lp
    left join linkedin_emp_projects lep on (lp.id = lep.project_id)
    inner join linkedin_employees le on (lep.emp_id = le.id)
    inner join project_month pm on (lp.id = pm.id) 
    group by lp.title,lp.budget
)
select *
from actual_expenses_budget
where expenses_budget > budget
order by title;
-- link soal: https://platform.stratascratch.com/coding/10304-risky-projects?code_type=1