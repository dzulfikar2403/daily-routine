with rank_of_department_salaries as (
  SELECT *,
        dense_rank() over(
          partition by d.department_name 
          order by d.department_name,e.salary desc
        ) as rank_salaries_each_dep
  FROM employee e
  left join department d on (e.department_id = d.department_id)
)
select department_name,
        name as emp_name,
        salary
from rank_of_department_salaries
where rank_salaries_each_dep <= 3
order by department_name,salary desc,emp_name;
-- link soal: https://datalemur.com/questions/sql-top-three-salaries