-- Write your PostgreSQL query statement below
with first_delivery_order_with_status as (
    select *,
        case
            when order_date = customer_pref_delivery_date then 'immediate'
            else 'scheduled'
        end as status,
        dense_rank() over(
            partition by customer_id
            order by order_date
        )
    from delivery
)
select round((count(distinct delivery_id) filter (where status = 'immediate') * 100)::decimal / count(distinct delivery_id) ,2) as immediate_percentage
from first_delivery_order_with_status
where dense_rank = 1;
-- link soal: https://leetcode.com/problems/immediate-food-delivery-ii/description/