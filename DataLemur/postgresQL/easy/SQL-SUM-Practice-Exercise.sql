SELECT count(DISTINCT drug) filter (where manufacturer = 'Pfizer'),
        sum(total_sales) filter (where manufacturer = 'Pfizer')
FROM pharmacy_sales;
-- link soal: https://datalemur.com/questions/sql-sum-practice-exercise