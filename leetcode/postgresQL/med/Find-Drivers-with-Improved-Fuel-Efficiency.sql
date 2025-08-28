-- -- Write your PostgreSQL query statement below
with fuel_eficiency_each_trip as (
    select t.trip_id,
            d.driver_id,
            d.driver_name,
            t.trip_date,
            t.distance_km/t.fuel_consumed as fuel_efficiency
    from trips t
    left join drivers d on (t.driver_id = d.driver_id)
),
avg_per_season_each_driver as (
    select driver_id,
        driver_name,
        round(avg(fuel_efficiency) filter (where extract(month from trip_date) between 1 and 6) ,2) as first_half_avg,
        round(avg(fuel_efficiency) filter (where extract(month from trip_date) between 7 and 12) ,2) as second_half_avg,
        round(avg(fuel_efficiency) filter (where extract(month from trip_date) between 7 and 12) - avg(fuel_efficiency) filter (where extract(month from trip_date) between 1 and 6) ,2) as efficiency_improvement
    from fuel_eficiency_each_trip
    group by driver_id,driver_name
)
select *
from avg_per_season_each_driver
where first_half_avg is not null and second_half_avg is not null and efficiency_improvement > 0
order by efficiency_improvement desc, driver_name;
-- link soal: https://leetcode.com/problems/find-drivers-with-improved-fuel-efficiency/description/