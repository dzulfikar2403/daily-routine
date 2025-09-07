with cte as (
  SELECT policy_holder_id,
          count(distinct case_id)
  FROM callers
  group by policy_holder_id
  having count(distinct case_id) >= 3
)
select count(policy_holder_id) as policy_holder_count
from cte;
-- link soal: https://datalemur.com/questions/frequent-callers