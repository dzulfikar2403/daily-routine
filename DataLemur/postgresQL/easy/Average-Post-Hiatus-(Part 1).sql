SELECT user_id,
      max(post_date::date) - min(post_date::date)
FROM posts
where extract(year from post_date) = '2021'
group by user_id
having count(user_id) >= 2;
-- link soal: https://datalemur.com/questions/sql-average-post-hiatus-1