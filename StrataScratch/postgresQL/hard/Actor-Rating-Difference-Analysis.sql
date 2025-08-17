with cte as (
    select *,
            dense_rank() over(
                partition by actor_name
                order by release_date desc
            )
            
    from actor_rating_shift
)
select actor_name,
        case
            when count(*) > 1 then avg(film_rating) filter (where dense_rank > 1)
            else sum(film_rating) 
        end as avg_rating,
        sum(film_rating) filter (where dense_rank = 1) as latest_rating,
        coalesce(sum(film_rating) filter (where dense_rank = 1) - avg(film_rating) filter (where dense_rank > 1) ,0) as rating_difference
from cte
group by actor_name;
-- agak tricky bhs inggris task bagian akhirannya
-- link soal: https://platform.stratascratch.com/coding/10547-actor-rating-difference-analysis?code_type=1