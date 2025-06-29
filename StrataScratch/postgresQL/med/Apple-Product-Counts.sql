
select pu.language,
        count(distinct pe.user_id) filter (where device in ( 'macbook pro', 'iphone 5s','ipad air')) 	n_apple_users,
        count(distinct pe.user_id) n_total_users
from playbook_events pe
inner join playbook_users pu on (pe.user_id = pu.user_id)
group by language
order by n_total_users desc;
-- link soal: https://platform.stratascratch.com/coding/10141-apple-product-counts?code_type=1
