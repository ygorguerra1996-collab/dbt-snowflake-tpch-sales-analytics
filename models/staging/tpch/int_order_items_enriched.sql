with orders as (
    select * from {{ ref('__orders') }}
),

order_items as (
    select * from {{ ref('__order_items') }}
),

customers as (
    select * from {{ ref('__customers') }}
),

nations as (
    select * from {{ ref('___nations') }}
),

regions as (
    select * from {{ ref('___regions') }}
),

order_items_with_final_price as (
    select
        *,
        extended_price * (1 - discount_rate) * (1 + tax_rate) as final_revenue
    from order_items
)

select
    a.order_id,
    b.line_number,
    a.customer_id,
    b.supplier_id,
    b.part_id,
    c.nation_id,
    n.region_id,

    a.order_date,
    b.ship_date,
    b.commit_date,
    b.receipt_date,

    b.quantity,
    b.extended_price,
    b.discount_rate,
    b.tax_rate,
    b.final_revenue,

    a.order_status,
    c.market_segment,
    n.nation_name,
    r.region_name
from orders as a
left join order_items_with_final_price as b on a.ORDER_ID = b.ORDER_ID
left join customers as c on a.customer_id = c.customer_id
left join nations as n on c.NATION_ID = n.NATION_ID
left join regions as r on n.region_id = r.region_id