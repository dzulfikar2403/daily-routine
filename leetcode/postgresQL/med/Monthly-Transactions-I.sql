-- Write your PostgreSQL query statement below
select to_char(trans_date,'yyyy-mm') as month,
        country,
        count(id) as trans_count,
        count(id) filter (where state = 'approved') as approved_count,
        coalesce(sum(amount),0) as trans_total_amount,
        coalesce(sum(amount) filter (where state = 'approved'),0) as approved_total_amount
from transactions
group by month,country;
-- link soal: https://leetcode.com/problems/monthly-transactions-i/description/