with suppliers as (
select * from {{ref('___suppliers')}}

),

nations as (
select * from {{ref('___nations')}}
),

regions as (
select * from {{ref('___regions')}}
)

select 
{{ dbt_utils.generate_surrogate_key(['a.supplier_id']) }} as supplier_key_surrogate,
a.supplier_id,
a.supplier_name,
a.account_balance,
b.nation_name,
c.region_name
from suppliers as a 
left join nations as b
on a.nation_id = b.nation_id
left join regions as c
on b.region_id = c.region_id