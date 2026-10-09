WITH trips AS ( 
    select 
    date(to_timestamp(replace(START_TIME, '"', ''))) as start_date,
    -- to_timestamp(STOP_TIME) as stop_date,
    START_STATION_ID,
    END_STATION_ID,
    BIKE_ID,
    TRIP_DURATION,
    -- TIMESTAMPDIFF(second, to_timestamp(START_TIME), to_timestamp(STOP_TIME)) as trip_duration
    FROM {{ source('demo_source', 'bike_table') }}
    where trip_duration != '"tripduration"'  
)

select * from trips
where start_date >= to_date('2016-01-01')