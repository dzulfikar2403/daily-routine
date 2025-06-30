with cte as (
    select  id_guest,
            sum(n_messages) as sum_n_messages
    from airbnb_contacts
    group by id_guest
)
select dense_rank() over(
        order by sum_n_messages desc
    ),
    id_guest,
    sum_n_messages
from cte;
-- harunsya bisa langsung tanpa with query/CTE.
-- link soal: https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=1