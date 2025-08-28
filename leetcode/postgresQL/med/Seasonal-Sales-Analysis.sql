-- Write your PostgreSQL query statement below
with Seasonal_Sales_Analysis as (
    select case
            when extract(month from sale_date) in (12,1,2) then 'Winter' 
            when extract(month from sale_date) in (3,4,5) then 'Spring' 
            when extract(month from sale_date) in (6,7,8) then 'Summer' 
            when extract(month from sale_date) in (9,10,11) then 'Fall' 
        end as season,
        p.category,
        sum(s.quantity) as total_quantity,
        sum(quantity * price) as total_revenue
    from sales s
    left join products p on (s.product_id = p.product_id)
    group by season,category
),
rank_sales_per_season as (
    select *,
            dense_rank() over(
                partition by season
                order by total_quantity desc,total_revenue desc
            )
    from Seasonal_Sales_Analysis
)
select season,
        category,
        total_quantity,
        total_revenue 
from rank_sales_per_season
where dense_rank = 1;
-- link soal: https://leetcode.com/problems/seasonal-sales-analysis/description/