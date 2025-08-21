with revenue_each_month as (
    select to_char(created_at,'yyyy-mm') as month,
            sum(value) as this_month_revenue
    from sf_transactions
    group by month
    order by month
),
revenue_each_month_w_prev as (
    select *,
            lag(this_month_revenue) over(
                order by month
            ) as last_month_revenue
    from revenue_each_month
)
select month,
        round(((this_month_revenue - last_month_revenue) / last_month_revenue) * 100 ,2) as revenue_diff_pct
from revenue_each_month_w_prev;
-- link soal: https://platform.stratascratch.com/coding/10319-monthly-percentage-difference?code_type=1