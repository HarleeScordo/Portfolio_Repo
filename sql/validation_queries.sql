/*
Purpose:
Example SQL checks for reviewing validation output quality and readiness.
*/

-- Count datasets by validation status
SELECT
    validation_passed,
    COUNT(*) AS dataset_count
FROM validation_summary
GROUP BY validation_passed;

-- Identify datasets without schema contracts
SELECT
    dataset_name
FROM validation_summary
WHERE schema_exists = FALSE;

-- Identify datasets requiring review
SELECT
    dataset_name,
    validation_message
FROM validation_summary
WHERE schema_exists = FALSE
   OR validation_passed = FALSE;

-- Calculate validation success rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN validation_passed = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS validation_success_rate_percent
FROM validation_summary;
