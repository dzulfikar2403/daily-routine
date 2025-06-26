-- cari emp yang managernya = 13 dan punya target paling tinggi.
with cte as (
    select first_name,
            target,
            manager_id,
            dense_rank() over(
                partition by manager_id
                order by target desc
            )
    from salesforce_employees
)
select first_name,
        target
from cte
where dense_rank = 1 and manager_id = 13; 
-- link soal: https://platform.stratascratch.com/coding/9905-highest-target-under-manager?code_type=1