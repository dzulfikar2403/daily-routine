with in_date_user_id as (
    select cust_id 
    from orders
    where order_date between '2019-02-01'::date and '2019-03-01'::date
)
select distinct first_name
from customers c
left join orders o on(c.id = o.cust_id)
where o.cust_id is null or c.id not in (select * from in_date_user_id)
order by first_name;
-- link soal: https://platform.stratascratch.com/coding/10142-no-order-customers?code_type=1