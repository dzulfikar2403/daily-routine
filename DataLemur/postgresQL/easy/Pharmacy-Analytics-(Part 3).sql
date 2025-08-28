SELECT manufacturer,
        concat('$',round((sum(total_sales) / 1000000)),' million') as sales_mil
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc,manufacturer;
-- link soal: https://datalemur.com/questions/total-drugs-sales