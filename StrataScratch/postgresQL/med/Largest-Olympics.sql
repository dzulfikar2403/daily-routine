with cte as (
    select games,
            count(distinct id) as athletes_count,
            dense_rank() over(
                order by count(distinct id) desc
            )
    from olympics_athletes_events
    group by games
)
select games,
        athletes_count
from cte
where dense_rank = 1;
-- link soal: https://platform.stratascratch.com/coding/9942-largest-olympics?code_type=1