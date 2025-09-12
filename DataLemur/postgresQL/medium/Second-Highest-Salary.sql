with cte as (
  SELECT salary,
          dense_rank() over(
            order by salary desc
          ) as rank_salary
  FROM employee
)
select distinct salary
from cte 
where rank_salary = 2;
-- link soal: https://datalemur.com/questions/sql-second-highest-salary