-- calculate total revenue tiap cust di march 2019,
-- hanya include yang active di march 2019,
-- active user adalah cust yang membuat transaksi min sekali 
with cte as (
    select cust_id,
            sum(total_order_cost) filter (where order_date between '2019-03-01' and '2019-03-31') as total_revenue
    from orders
    group by cust_id
)
select * 
from cte
where total_revenue is not null
order by total_revenue desc;
-- link soal: https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=1