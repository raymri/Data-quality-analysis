--uniqueness

-- Find keys that appear more than once
WITH customer_keys AS (
    SELECT
        customer_name,
        country,
        tax_id,
        COUNT(*) AS row_count
    FROM customers
    GROUP BY customer_name, country, tax_id
)
SELECT
    COUNT(*)                    AS duplicate_key_groups,
    SUM(row_count)              AS duplicate_rows_total,
    SUM(row_count) - COUNT(*)   AS extra_rows_beyond_first
FROM customer_keys
WHERE row_count > 1;