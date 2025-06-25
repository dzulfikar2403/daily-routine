select company,
        continent
from forbes_global_2010_2014
where sector ilike 'financials' and profits in (select max(profits) from forbes_global_2010_2014);
-- link soal: https://platform.stratascratch.com/coding/9663-find-the-most-profitable-company-in-the-financial-sector-of-the-entire-world-along-with-its-continent?code_type=1