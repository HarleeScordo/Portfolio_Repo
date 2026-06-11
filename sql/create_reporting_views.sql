/*
Purpose:
Create example reporting views that could be used to inspect validation results
and catalog metadata after intake processing.

Note:
This script is platform-neutral starter SQL. Table names may need to be adapted
based on the target database or warehouse platform.
*/

CREATE VIEW vw_validation_status AS
SELECT
    dataset_name,
    schema_exists,
    validation_passed,
    validation_message
FROM validation_summary;

CREATE VIEW vw_failed_validations AS
SELECT
    dataset_name,
    validation_message
FROM validation_summary
WHERE validation_passed = FALSE
   OR schema_exists = FALSE;

CREATE VIEW vw_dataset_readiness AS
SELECT
    dataset_name,
    CASE
        WHEN schema_exists = TRUE AND validation_passed = TRUE THEN 'Ready for Consumption'
        WHEN schema_exists = FALSE THEN 'Missing Contract'
        ELSE 'Validation Review Required'
    END AS readiness_status
FROM validation_summary;
