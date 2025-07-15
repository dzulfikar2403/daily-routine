SELECT ticker,
        min(open) 
FROM stock_prices
group by ticker
order by min desc;
-- link soal: https://datalemur.com/questions/sql-group-by-practice-exercise-easy