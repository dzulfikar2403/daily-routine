-- cari aktor yang punya genre yang sering diperankan. jika total genre sama berdasarkan rating paling gede, jika total genre dan avg rating nya punya nilai sama, tampilkan keduanya.
-- tampilkan actor,genre dengan avg_rating mereka yg diurut berdasarkan desc, serta tampilkan yang top 3 rank.
with cte as (
    select actor_name,
            genre,
            count(genre),
            avg(movie_rating) average_rating,
            dense_rank() over(
                partition by actor_name
                order by count(genre) desc,avg(movie_rating) desc 
            )
    from top_actors_rating
    group by actor_name,genre
),
cte2 as (
    select actor_name,
            genre,
            average_rating as avg_rating,
            dense_rank() over(
                order by average_rating desc
            )
    from cte
    where dense_rank = 1
)
select actor_name,
        genre,
        avg_rating
from cte2
where dense_rank <= 3;
-- baca soalnya harus teliti cik xixixi...
-- link soal: https://platform.stratascratch.com/coding/10548-top-actor-ratings-by-genre?code_type=1