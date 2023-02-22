
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

SELECT tripduration, starttime, stoptime, start_station_id, start_station_name, end_station_id, end_station_name, bikeid, usertype, birth_year, gender, customer_plan
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE tripduration is not null

)

select *
from source_data
