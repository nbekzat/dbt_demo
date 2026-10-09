{%macro get_season(x)%}
case 
    when MONTH(to_timestamp(replace({{x}}, '"','') , 'YYYY-MM-DD HH24:MI:SS')) in (12, 1, 2) then 'Winter'
    when MONTH(to_timestamp(replace({{x}}, '"','') , 'YYYY-MM-DD HH24:MI:SS')) in (3, 4, 5) then 'Spring'
    when MONTH(to_timestamp(replace({{x}}, '"','') , 'YYYY-MM-DD HH24:MI:SS')) in (6, 7,8) then 'Summer' 
    else 'Fall'
    end 

{%endmacro%}

{%macro get_day_type(x) %}

    case 
        when dayname(to_timestamp(replace({{x}}, '"','') , 'YYYY-MM-DD HH24:MI:SS')) in ('Sat', 'Sun')
        then 'Weekend'
        else 'Businessday'
        end  
{%endmacro%}