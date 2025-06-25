select max(salary) as salary
from employee
where salary < (select max(salary) from employee);
-- link soal: https://platform.stratascratch.com/coding/9892-second-highest-salary?code_type=1
-- disarankan menggunakan with query dengan dense_rank, lebih punya banyak fleksibilitas.