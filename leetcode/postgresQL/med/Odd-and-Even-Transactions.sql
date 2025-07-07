-- Write your PostgreSQL query statement below
select transaction_date,
        coalesce(sum(amount) filter (where amount % 2 = 1) ,0) as odd_sum,
        coalesce(sum(amount) filter (where amount % 2 = 0) ,0) as even_sum
from transactions
group by transaction_date
order by transaction_date;
-- link soal: https://leetcode.com/problems/odd-and-even-transactions

-- select extract(day from transaction_date) from transactions
