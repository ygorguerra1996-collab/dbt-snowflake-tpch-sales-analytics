# Style Guide

1. Layers: `staging` (`stg_`), `intermediate` (`int_`), `marts` (`dim_`, `fct_`, `mart_`).
2. Staging: one model per source table, materialized as a view.
3. Staging naming: `stg_<source>__<entity_plural>` (e.g. `stg_tpch__customers`).
4. Staging only renames columns and casts types. No joins, no business logic.
5. Keys end with `_id` (e.g. `customer_id`). Dates end with `_date`.
6. Columns use `snake_case` and drop source prefixes (`c_`, `o_`, `l_`).
7. SQL in lowercase, one column per line, trailing commas.
8. Every model has a `.yml` file with tests on its keys.
9. One models `.yml` per folder (`_<folder>__models.yml`).