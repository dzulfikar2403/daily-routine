select id,
        first_name,
        last_name,
        department_id,
        max(distinct salary)
from ms_employee_salary
group by id,first_name,last_name,department_id;
-- link soal: https://platform.stratascratch.com/coding/10299-finding-updated-records?code_type=1