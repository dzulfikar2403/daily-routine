SELECT round(count(distinct e.email_id) filter (where t.signup_action ilike 'confirmed')::decimal / count(e.email_id) ,2) as confirm_rate
FROM emails e
inner join texts t on (t.email_id = e.email_id);
-- link soal: https://datalemur.com/questions/signup-confirmation-rate