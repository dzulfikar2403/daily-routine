SELECT part,
        assembly_step
FROM parts_assembly
where finish_date is null;
-- link soal: https://datalemur.com/questions/tesla-unfinished-parts