with customers as (
    select * from {{ ref('__customers') }}
),

nations as (
    select * from {{ ref('___nations') }}
),

regions as (
    select * from {{ ref('___regions') }}
)




select 
{{ dbt_utils.generate_surrogate_key(['a.customer_id']) }} as customer_key_surrogate,
a.CUSTOMER_ID,
a.CUSTOMER_NAME,
a.ACCOUNT_BALANCE,
a.MARKET_SEGMENT,
b.nation_name,
c.region_name

from customers as a 
left join nations as b 
on a.nation_id = b.nation_id
left join regions as c 
on b.region_id = c.region_id 

