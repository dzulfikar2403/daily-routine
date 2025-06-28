select to_char(shipment_date,'yyyy-mm') as year_month,
        count(shipment_id)
from amazon_shipment
group by year_month;
-- link soal: https://platform.stratascratch.com/coding/2056-number-of-shipments-per-month?code_type=1