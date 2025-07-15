SELECT category,
        count(distinct product)
FROM product_spend
group by category;
-- link soal: https://datalemur.com/questions/sql-count-distinct-practice-exercise