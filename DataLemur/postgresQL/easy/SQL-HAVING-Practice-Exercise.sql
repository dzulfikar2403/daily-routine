SELECT candidate_id
FROM candidates
group by candidate_id
having count(skill) > 2;
-- link soal: https://datalemur.com/questions/sql-having-practice-exercise