with revenueDetail as (
  SELECT artist_name,
          concert_revenue,
          genre,
          number_of_members,
          concert_revenue / number_of_members as revenue_each_member,
          dense_rank() over(
            partition by genre
            order by concert_revenue / number_of_members desc
          )
  FROM concerts
)
select artist_name,
        concert_revenue,
        genre,
        number_of_members,
        revenue_each_member
from revenueDetail
where dense_rank = 1
order by revenue_each_member desc;
-- link soal: https://datalemur.com/questions/sql-cte-subquery-concert-revenue