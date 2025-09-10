SELECT round(count(case_id) filter (where call_category = 'n/a' or call_category is null)::decimal / count(case_id) * 100 ,1) as uncategorised_call_pct
FROM callers;
-- link soal: https://datalemur.com/questions/uncategorized-calls-percentage