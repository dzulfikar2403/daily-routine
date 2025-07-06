-- Write your PostgreSQL query statement below
with cte as (
    select name,
            count(movie_id)
    from users
    join movieRating using (user_id)
    group by name
    order by count desc,name asc
    limit 1
),
cte2 as (
    select m.title,
            avg(rating) 
    from movies m
    join movieRating using (movie_id)
    where to_char(created_at,'yyyy-mm') = '2020-02'
    group by m.title
    order by avg desc,title
    limit 1
)
select name as results
from cte
union all
select title as results
from cte2;
-- link soal: https://leetcode.com/problems/movie-rating