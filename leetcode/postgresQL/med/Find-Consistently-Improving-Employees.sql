-- Write your PostgreSQL query statement below
with cte as (
    select e.employee_id,
        e.name,
        pr.review_date,
        pr.rating,
        dense_rank() over(
            partition by e.employee_id
            order by pr.review_date desc
        )
    from employees e
    left join performance_reviews pr on (e.employee_id = pr.employee_id)
),
top_3_latest_data_with_previous_rating as (
    select *,
            coalesce(lead(rating) over(
                partition by employee_id
                order by review_date desc
            ),0) as previous_rating
    from cte
    where dense_rank between 1 and 3
)
select employee_id,
        name,
        max(rating) filter (where dense_rank = 1) - max(rating) filter (where dense_rank = 3) as improvement_score
from top_3_latest_data_with_previous_rating
where rating > previous_rating 
group by employee_id,name
having count(employee_id) >= 3
order by improvement_score desc,name;
-- link soal: https://leetcode.com/problems/find-consistently-improving-employees/description/