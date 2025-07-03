with cte as (
    select id,
            number_of_reviews,
            price,
            case
                when number_of_reviews = 0 then 'New'
                when number_of_reviews between 1 and 5 then 'Rising'
                when number_of_reviews between 6 and 15 then 'Trending Up'
                when number_of_reviews between 16 and 40 then 'Popular'
                when number_of_reviews > 40 then 'Hot'
            end as hosts_popularity_rating
    from airbnb_host_searches
    order by number_of_reviews asc
)
select hosts_popularity_rating,
        min(price) min_price,
        avg(price) avg_price,
        max(price) max_price
from cte
group by hosts_popularity_rating
order by min_price;
-- link soal: https://platform.stratascratch.com/coding/9632-host-popularity-rental-prices?code_type=1