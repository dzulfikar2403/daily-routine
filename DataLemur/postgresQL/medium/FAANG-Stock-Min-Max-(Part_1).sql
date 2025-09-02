with cte as (
  SELECT *,
          row_number() over(
            partition by ticker
            order by open
          ) as rank_open_price_lowest,
          row_number() over(
            partition by ticker
            order by open desc
          ) as rank_open_price_highest
  FROM stock_prices
)
select ticker,
        min(to_char(date, 'Mon-YYYY')) filter (where rank_open_price_highest = 1) month_largest,
        min(open) filter (where rank_open_price_highest = 1) price_largest,
        min(to_char(date, 'Mon-YYYY')) filter (where rank_open_price_lowest = 1) month_lowest,
        min(open) filter (where rank_open_price_lowest = 1) price_lowest
from cte
group by ticker
order by ticker;
-- link soal: https://datalemur.com/questions/sql-bloomberg-stock-min-max-1