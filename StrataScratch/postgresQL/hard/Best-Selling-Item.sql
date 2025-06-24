with highest_total_sales_amount as (
    select extract(month from invoicedate) as month,
            description,
            sum(unitprice * quantity) as total_paid
    from online_retail
    group by month,description
    order by month
),
highest_total_a_month as (
    select month,
            max(total_paid) as highest_total_paid
    from highest_total_sales_amount
    group by month
    order by month
)
select h2.*
from highest_total_a_month h1
inner join highest_total_sales_amount h2 on (h1.month = h2.month and h1.highest_total_paid = h2.total_paid);
-- link soal: https://platform.stratascratch.com/coding/10172-best-selling-item?code_type=1 