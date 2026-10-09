with weather_daily as (
    select  
    temp,
    humidity,
    pressure,
    weather,
    date(time) as date
    from {{ source('demo_source', 'weather_table') }}
),

weather_daily_aggr as (

    select 
        weather, date,
        round(AVG(temp), 1) as temp_mean,
        round(AVG(humidity), 1) as humidity_mean,
        round(AVG(pressure), 1) as pressure_mean,

        count(*)
    from     weather_daily
    group by weather, date
)

select * from weather_daily_aggr