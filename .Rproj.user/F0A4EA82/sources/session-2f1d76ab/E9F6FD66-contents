/*
Purpose:
Example SQL profiling patterns that could be used after source data is loaded
into a database or warehouse table.
*/

-- Row count by source dataset
SELECT
    dataset_name,
    COUNT(*) AS row_count
FROM intake_records
GROUP BY dataset_name
ORDER BY dataset_name;

-- Basic completeness check by dataset and column
SELECT
    dataset_name,
    column_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN value IS NULL THEN 1 ELSE 0 END) AS null_rows,
    ROUND(100.0 * SUM(CASE WHEN value IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS null_percent
FROM column_profile
GROUP BY dataset_name, column_name
ORDER BY dataset_name, column_name;

-- Duplicate key check pattern
SELECT
    business_key,
    COUNT(*) AS record_count
FROM intake_records
GROUP BY business_key
HAVING COUNT(*) > 1;
