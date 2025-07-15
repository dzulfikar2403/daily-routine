SELECT ticker,
        min(open)
FROM stock_prices
group by ticker 
having min(open) > 100;
-- link soal: https://datalemur.com/questions/sql-having-min-practice-exercise