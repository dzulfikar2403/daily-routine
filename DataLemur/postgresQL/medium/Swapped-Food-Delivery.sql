with cte as (
  SELECT order_id,
        item,
        lag(item,1) over(
          order by order_id
        ) as prev_1,
        lead(item,1) over(
          order by order_id
        ) as next_1
FROM orders
)
SELECT order_id,
        COALESCE(case
          when order_id % 2 = 0 then prev_1
          when order_id % 2 = 1 then next_1
        end,item) as "item"
from cte;
-- link soal: https://datalemur.com/questions/sql-swapped-food-delivery