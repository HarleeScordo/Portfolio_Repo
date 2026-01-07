# ADR 0001: Documentation-First Intake with Data Contracts

## Status
Accepted

## Context
The repository contains heterogeneous datasets (CSV/XLSX) that must be ingested and prepared for downstream analytics. Portfolio goals include demonstrating reproducibility, documentation quality, and early detection of schema/data quality issues.

## Decision
1. Generate a human-readable data catalog (`docs/DATA_CATALOG.md`) from raw inputs.
2. Define dataset expectations using machine-readable schema contracts (`contracts/*.schema.yml`).
3. Validate datasets during pipeline execution and write a validation summary artifact (`output/validation/validation_summary.csv`).
4. Use `renv` for dependency management to ensure reproducibility across environments.

## Consequences
- Reviewers can evaluate documentation and quality checks without running the pipeline.
- The pipeline fails earlier and more transparently when input structure changes.
- Schema definitions require maintenance, but the tradeoff improves trust and downstream usability.
