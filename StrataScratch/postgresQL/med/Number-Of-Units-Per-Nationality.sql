-- hitung total apt by owner under 30
-- group by nationality.
select ah.nationality,
        count(distinct au.unit_id) apartment_count
from airbnb_hosts ah
left join airbnb_units au on (ah.host_id = au.host_id)
where ah.age < 30 and unit_type = 'Apartment' 
group by ah.nationality;
-- link soal: https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?code_type=1 