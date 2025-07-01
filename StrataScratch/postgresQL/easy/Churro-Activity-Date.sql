select activity_date,
        pe_description    
from los_angeles_restaurant_health_inspections
where facility_name ilike 'street churros' and score < 95;
-- link soal: https://platform.stratascratch.com/coding/9688-churro-activity-date?code_type=1