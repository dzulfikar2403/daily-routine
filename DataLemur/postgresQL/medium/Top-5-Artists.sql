with cte as (
SELECT a.artist_name,
        count(g.song_id),
        dense_rank() over(
          order by count(g.song_id) desc
        ) as artist_rank
FROM artists a
left join songs s on (a.artist_id = s.artist_id)
join global_song_rank g on (s.song_id = g.song_id)
where g.rank <= 10
group by a.artist_name
)
select artist_name,
      artist_rank
from cte 
where artist_rank <= 5;
-- pertanyaan ambiguuu, kureng.
-- link soal: https://datalemur.com/questions/top-fans-rank 