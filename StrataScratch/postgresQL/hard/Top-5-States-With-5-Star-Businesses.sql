-- Find the states with the Top 5 counts
-- order record 5 star business desc,state asc
with cte as (
select state,
        count(stars) as n_businesses,
        dense_rank() over(
            order by count(stars) desc
        )
from yelp_business
where stars = 5
group by state
)
select state,
        n_businesses
from cte 
where dense_rank <= 5;
-- link soal: https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses?code_type=1