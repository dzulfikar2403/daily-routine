select max(e.salary) filter(where d.department ilike 'marketing') 
        - max(e.salary) filter(where d.department ilike 'engineering') salary_difference 
from db_employee e
left join db_dept d on (e.department_id = d.id);
-- link soal: https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=1