with trip_weather as (
    select * 
    from {{ ref('trip_fact') }} as t
    inner join {{ ref('daily_weather') }} as w
    on w.date = t.start_date

)

select * from trip_weather