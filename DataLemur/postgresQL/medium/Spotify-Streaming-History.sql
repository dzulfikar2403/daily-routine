with cte as (
  SELECT user_id,
          song_id,
          count(*) as song_play_new
  FROM songs_weekly
  where listen_time < '2022-8-5'::date
  group by 1,2
)
select user_id,
        song_id,
        COALESCE(song_play_new ,0) + COALESCE(song_plays ,0) as song_plays
from cte
full join songs_history using (user_id,song_id)
order by 3 desc;
-- link soal: https://datalemur.com/questions/spotify-streaming-history