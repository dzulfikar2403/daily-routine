-- Write your PostgreSQL query statement below
with category_list as (
    select column1 as category 
    from (values('Low Salary'),
        ('Average Salary'),
        ('High Salary'))
),
cte2 as (
    select account_id,
        case
            when income < 20000 then 'Low Salary'
            when income between 20000 and 50000 then 'Average Salary'
            else 'High Salary'
        end as category
from accounts
)
select cl.category,
        count(c.account_id) as accounts_count
from category_list cl
left join cte2 c using (category)
group by cl.category;
-- link soal: https://leetcode.com/problems/count-salary-categories