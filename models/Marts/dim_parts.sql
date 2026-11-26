with parts as (
select * from {{ref('__parts')}}

),

part_suppliers as (
select * from {{ref('__part_suppliers')}}
)

select 
PART_ID,
PART_NAME,
MANUFACTURER,
BRAND,
PART_TYPE,
PART_SIZE,
CONTAINER,
RETAIL_PRICE
from parts 