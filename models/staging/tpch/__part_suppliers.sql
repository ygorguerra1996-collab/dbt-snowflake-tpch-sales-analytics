select
    ps_partkey   as part_id,
    ps_suppkey   as supplier_id,
    ps_availqty  as available_quantity,
    ps_supplycost as supply_cost,
    ps_comment   as part_supplier_comment
from {{ source('tpch', 'partsupp') }}