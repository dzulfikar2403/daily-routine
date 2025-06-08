with sales_id_infected_red_company as (
    select sales_id 
    from orders o 
    inner join company c on o.com_id = c.com_id  
    where c.name ilike 'red'
)
select name
from salesperson
where sales_id not in (select * from sales_id_infected_red_company)