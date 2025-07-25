with cte as (
  SELECT measurement_time::date as measurement_day,
          measurement_value,
          dense_rank() over(
            partition by measurement_time::date
            order by measurement_time
          )
  FROM measurements
)
select measurement_day,
        sum(measurement_value) filter (where dense_rank % 2 = 1) as odd_sum,
        sum(measurement_value) filter (where dense_rank % 2 = 0) as even_sum
from cte
group by measurement_day;
-- link soal: https://datalemur.com/questions/odd-even-measurements