SELECT skill,
        count(candidate_id)
FROM candidates
group by skill
order by count desc;
-- link soal: https://datalemur.com/questions/sql-group-by-practice-exercise-candidate-skills