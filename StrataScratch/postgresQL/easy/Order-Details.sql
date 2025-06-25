select c.first_name,
        o.order_date,
        o.order_details,
        o.total_order_cost
from customers c
left join orders o on (c.id = o.cust_id)
where c.first_name ilike 'jill' or c.first_name ilike 'eva'
order by c.id;
-- link soal: https://platform.stratascratch.com/coding/9913-order-details?code_type=1