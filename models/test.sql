select * from {{ source('demo_source', 'bike_table') }}
limit 10