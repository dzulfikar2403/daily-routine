-- Write your PostgreSQL query statement below
select sample_id,
        dna_sequence,
        species,   
        count(sample_id) filter (where dna_sequence ilike 'ATG%') as has_start,
        count(sample_id) filter (where right(dna_sequence,3) in ('TAA','TAG','TGA')) as has_stop,
        count(sample_id) filter (where dna_sequence ilike '%ATAT%') as has_atat,
        count(sample_id) filter (where dna_sequence ilike '%GGG%') as has_ggg
from samples
group by sample_id,dna_sequence,species
order by sample_id;
-- link soal: https://leetcode.com/problems/dna-pattern-recognition/description/