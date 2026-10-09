with
    date_dim as (
        select
            to_timestamp(replace(start_time, '"','') , 'YYYY-MM-DD HH24:MI:SS') as start_tsp,
            date(to_timestamp(replace(start_time, '"','') , 'YYYY-MM-DD HH24:MI:SS')) as start_date,
            hour(to_timestamp(replace(start_time, '"','') , 'YYYY-MM-DD HH24:MI:SS')) as start_hour,
            dayname(to_timestamp(replace(start_time, '"','') , 'YYYY-MM-DD HH24:MI:SS')) as start_dayname,
           
            {{ get_day_type('start_time') }} as DAY_TYPE,

             MONTH(to_timestamp(replace(start_time, '"','') , 'YYYY-MM-DD HH24:MI:SS')) as start_month,

             {{ get_season('start_time') }} as SEASON,
             

        from {{ source("demo_source", "bike_table") }}
        where start_time != 'starttime'
    )

select *
from date_dim
