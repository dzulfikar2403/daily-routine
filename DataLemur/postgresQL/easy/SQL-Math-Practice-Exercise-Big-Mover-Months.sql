SELECT ticker,
        count(EXTRACT(month from date)) filter (where  abs((close - open) / open) > 0.10)
FROM stock_prices
group by ticker
order by count desc;
-- link soal: https://datalemur.com/questions/sql-math-practice-exercise-big-mover-months