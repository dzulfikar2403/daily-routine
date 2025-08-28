SELECT user_id
FROM emails e
left join texts t on (e.email_id = t.email_id)
where signup_action = 'Confirmed' and action_date = signup_date + interval '1 days';
-- link soal: https://datalemur.com/questions/second-day-confirmation