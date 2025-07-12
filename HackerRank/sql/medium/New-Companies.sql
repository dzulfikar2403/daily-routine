-- query company_code,founder_name,total_lead_man,total_senior_man,total_man,total_employee.
-- order by company_code asc
select c.company_code,
        c.founder,
        count(distinct lm.lead_manager_code),
        count(distinct sm.senior_manager_code),
        count(distinct m.manager_code),
        count(distinct e.employee_code)
from company c
left join lead_manager lm using (company_code)
join senior_manager sm using (company_code)
join manager m using (company_code)
join employee e using (company_code)
group by company_code,founder
order by c.company_code asc;
-- link soal: https://www.hackerrank.com/challenges/the-company/problem