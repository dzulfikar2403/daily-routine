-- Write your PostgreSQL query statement below
with empWithSingleDepartment as (
    select employee_id
    from employee
    group by employee_id
    having count(employee_id) = 1
)
select employee_id,
        department_id
from employee 
where primary_flag = 'Y' or employee_id in (select * from empWithSingleDepartment);
