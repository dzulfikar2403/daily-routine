select artist,
        count(trackname) n_occurences
from spotify_worldwide_daily_song_ranking
group by artist
order by 2 desc;
-- link soal: https://platform.stratascratch.com/coding/9992-find-artists-that-have-been-on-spotify-the-most-number-of-times?code_type=1