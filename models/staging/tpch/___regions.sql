select 
    R_REGIONKEY AS region_id
    R_NAME AS region_name
    R_COMMENT AS region_comment

from {{ source('tpch', 'region') }}