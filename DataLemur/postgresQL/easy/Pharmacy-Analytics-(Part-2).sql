SELECT manufacturer,
        count(distinct drug),
        sum(cogs-total_sales) as total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
group by 1
order by 3 desc;
-- link soal: https://datalemur.com/questions/non-profitable-drugs