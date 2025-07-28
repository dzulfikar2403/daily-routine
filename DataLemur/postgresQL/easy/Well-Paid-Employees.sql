SELECT e.employee_id,
        e.name
FROM employee e
left join employee man on (e.manager_id = man.employee_id)
where e.salary > man.salary;
-- link soal: https://datalemur.com/questions/sql-well-paid-employees