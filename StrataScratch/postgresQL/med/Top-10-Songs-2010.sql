select distinct year_rank,
        group_name,
        song_name
from billboard_top_100_year_end
where year = 2010
limit 10;
-- link soal: https://platform.stratascratch.com/coding/9650-find-the-top-10-ranked-songs-in-2010?code_type=1