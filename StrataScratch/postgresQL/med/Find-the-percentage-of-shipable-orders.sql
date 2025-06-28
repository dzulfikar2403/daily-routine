select round((count(c.id) filter (where c.address is not null)::numeric / count(o.id)::numeric) * 100,2)
from orders o
left join customers c on (c.id = o.cust_id);
-- link soal: https://platform.stratascratch.com/coding/10090-find-the-percentage-of-shipable-orders?code_type=1