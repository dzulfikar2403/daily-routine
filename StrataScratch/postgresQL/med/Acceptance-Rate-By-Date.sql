with sender_id_accepted as (
    select user_id_sender,user_id_receiver
    from fb_friend_requests
    where action = 'accepted'
),
acceptance_rate_by_date as (
    select ffr.date,
        case
            when count(*) filter (where ffr.action = 'sent') = 0 then null
            else count(*) filter (where ffr.action = 'sent' and sia.user_id_sender is not null)::decimal / count(*) filter (where ffr.action = 'sent')
        end as percentage_acceptance
    from fb_friend_requests ffr
    left join sender_id_accepted sia on (ffr.user_id_sender = sia.user_id_sender and ffr.user_id_receiver = sia.user_id_receiver)
    group by ffr.date
)
select *
from acceptance_rate_by_date
where percentage_acceptance is not null
order by date;
-- link soal: https://platform.stratascratch.com/coding/10285-acceptance-rate-by-date?code_type=1