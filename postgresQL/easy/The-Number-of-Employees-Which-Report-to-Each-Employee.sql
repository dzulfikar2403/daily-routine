-- Write your PostgreSQL query statement below
select man.employee_id,
        man.name,
        count(e.reports_to) as reports_count,
        round(avg(e.age)) as average_age
from employees e
left join employees man on (e.reports_to = man.employee_id)
group by man.employee_id,man.name
having count(e.reports_to) >= 1
order by employee_id;
/* 
 count(e.reports_to) lebih baik diganti jadi count(e.employee_id), 
 karena kan udah di join dan lebih bagus karena id itu unique.
 */