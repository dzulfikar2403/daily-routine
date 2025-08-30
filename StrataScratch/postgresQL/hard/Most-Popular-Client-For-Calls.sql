with cte as (
    select client_id,
            user_id,
            round(count(event_type) filter (where event_type in ('video call received', 'video call sent', 'voice call received', 'voice call sent'))::decimal / count(event_type) * 100 ,2) as percentage_client_event_by_list
    from fact_events
    group by client_id,user_id
)
select client_id
from cte
where percentage_client_event_by_list in (select max(percentage_client_event_by_list) from cte);
-- link soal: https://platform.stratascratch.com/coding/2029-the-most-popular-client_id-among-users-using-video-and-voice-calls?code_type=1