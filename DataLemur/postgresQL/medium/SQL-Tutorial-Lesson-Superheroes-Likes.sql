SELECT actor,
        character,
        platform,
        avg_likes,
        CASE
          when avg_likes >= 15000 then 'Super Likes' 
          when avg_likes BETWEEN 5000 and 14999 then 'Good Likes' 
          else 'Low Likes' 
        END
FROM marvel_avengers
order by avg_likes desc;
-- link soal: https://datalemur.com/questions/sql-case-marvel-avengers