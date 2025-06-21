with cte as (
    select company_name,
            count(product_name) launch_product_2019
    from car_launches
    where year = 2019
    group by company_name,year
),
cte2 as (
    select company_name,
            count(product_name) launch_product_2020
    from car_launches
    where year = 2020
    group by company_name,year
)
select cte.company_name,
        (launch_product_2020 - launch_product_2019) as net_products
from cte
inner join cte2 on cte.company_name = cte2.company_name
-- link soal: https://platform.stratascratch.com/coding/10318-new-products?code_type=1