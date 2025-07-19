SELECT * 
FROM trades t
left join users u on (t.user_id = u.user_id);
-- link soal: https://datalemur.com/questions/sql-join-practice-exercise-robinhood