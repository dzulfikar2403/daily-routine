select COALESCE(a.user_id,dp.user_id) as u_id,
        case
          when status in ('NEW','EXISTING','RESURRECT') and paid is not null then 'EXISTING'
          when status = 'CHURN' and paid is not null then 'RESURRECT'
          when dp.user_id is not null and paid is not null then 'NEW'
          else 'CHURN'
        end as new_status
FROM advertiser a
full join daily_pay dp on (a.user_id = dp.user_id)
order by u_id;
-- link soal: https://datalemur.com/questions/updated-status