-- Write your PostgreSQL query statement below
with stocks_with_capital_gain_loss as (
    select stock_name,
            case
                when operation = 'Buy' then -price
                when operation = 'Sell' then price
            end as condition_price
    from stocks
)
select stock_name,
        sum(condition_price) as capital_gain_loss
from stocks_with_capital_gain_loss
group by stock_name;
-- sebenernya bisa langsung di sum saat case when, nnti tinggal di group stock_name
-- link soal: https://leetcode.com/problems/capital-gainloss/description/