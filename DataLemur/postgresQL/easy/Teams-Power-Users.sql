SELECT sender_id,
        count(message_id) FILTER (
         WHERE extract(month from sent_date) = 8
           AND extract(year from sent_date) = 2022
       ) as message_count
FROM messages
group by sender_id
order by message_count desc
limit 2;
-- link soal: https://datalemur.com/questions/teams-power-users