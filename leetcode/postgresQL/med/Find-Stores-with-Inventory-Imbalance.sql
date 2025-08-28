-- Write your PostgreSQL query statement below
with cte as (
    select  s.store_name,
            s.location,
            i.*,
            dense_rank() over(
                partition by s.store_id
                order by i.price desc
            ) as rank_product_by_higher_price,
            dense_rank() over(
                partition by s.store_id
                order by i.price
            ) as rank_product_by_lower_price
    from stores s
    left join inventory i on (s.store_id = i.store_id)
),
identify_product as (
    select store_id,
            store_name,
            location,
            max(product_name) filter (where rank_product_by_higher_price = 1) as most_exp_product,
            max(product_name) filter (where rank_product_by_lower_price = 1) as cheapest_product,
            max(quantity) filter (where rank_product_by_higher_price = 1) as most_exp_product_quantity,
            max(quantity) filter (where rank_product_by_lower_price = 1) as cheapest_product_quantity
    from cte
    group by store_id,store_name,location
    having count(distinct inventory_id) >= 3
)
select store_id,
        store_name,
        location,
        most_exp_product,
        cheapest_product,
        round(cheapest_product_quantity::decimal/most_exp_product_quantity ,2) as imbalance_ratio
from identify_product
where most_exp_product_quantity < cheapest_product_quantity
order by imbalance_ratio desc,store_name;
-- link soal:https://leetcode.com/problems/find-stores-with-inventory-imbalance/description/