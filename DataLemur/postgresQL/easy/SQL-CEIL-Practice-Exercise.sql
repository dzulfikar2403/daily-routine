SELECT drug,
        ceil(total_sales / units_sold) unit_cost
FROM pharmacy_sales
where manufacturer = 'Merck'
order by unit_cost asc;
-- link soal: https://datalemur.com/questions/sql-ceil-practice-exercise