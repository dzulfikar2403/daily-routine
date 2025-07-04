with cte as (
    select city,
            max(array_length(amenities::text[],1)),
            dense_rank() over(
                order by max(array_length(amenities::text[],1)) desc
            )
    from airbnb_search_details
    group by city
)
select city
from cte
where dense_rank = 1
-- agak bingung sama pertanyaannya, di sum atau ngk. bruhh... (keknya di sum, keliatan dari judul soalnya)
-- link soal: https://platform.stratascratch.com/coding/9633-city-with-most-amenities?code_type=1