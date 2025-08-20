with remove_dup_date_by_user as (
    select distinct user_id,
            created_at
    from amazon_transactions
),
second_purchases_by_user as (
    select *,
            count(user_id) over(
                partition by user_id
                order by created_at
                range between current row and interval '7day' following 
                ),
            row_number() over(
                partition by user_id
                order by created_at 
            )
    from remove_dup_date_by_user
)
select distinct user_id 
from second_purchases_by_user
where count > 1 and row_number = 1;
-- link soal: https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=1