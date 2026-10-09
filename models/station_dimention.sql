WITH BIKE AS (
    SELECT DISTINCT
        START_STATION_ID, 
        start_STATION_NAME, 
        START_STATION_LAT,
        START_STATION_LONG
    FROM {{ source('demo_source', 'bike_table') }}
    where trip_duration != '"tripduration"' 
)

select * from bike