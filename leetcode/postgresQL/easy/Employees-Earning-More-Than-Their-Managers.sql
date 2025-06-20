select e.name employee
from employee e
inner join employee e2 on (e2.id = e.managerId)
where e.salary > e2.salary ;