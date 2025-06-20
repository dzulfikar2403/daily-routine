with cte as (
    select c.first_name,
            o.order_date,
            sum(o.total_order_cost) max_cost
    from customers c
    left join orders o on (c.id = o.cust_id)
    where o.order_date between '2019-02-01'::date and '2019-05-01'::date
    group by c.first_name,o.order_date
)
select cte.*        
from cte,(select max(max_cost) from cte) func
where max_cost = func.max

-- link soal : https://platform.stratascratch.com/coding/9915-highest-cost-orders?code_type=1