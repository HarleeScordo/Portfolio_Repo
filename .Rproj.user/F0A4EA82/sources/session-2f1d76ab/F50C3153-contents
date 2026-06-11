# Data Lineage

## Purpose

This document describes the lineage pattern used by the intake and validation framework. The goal is to make the movement of data through the framework transparent, traceable, and explainable.

## Lineage Pattern

```text
Raw Source Files
(CSV, XLSX)
        |
        v
Ingestion Layer
        |
        v
Schema Contract Validation
        |
        +-------------------+
        |                   |
        v                   v

Data Catalog         Validation Results
Generation             Generation

        |
        v

Analytics & Reporting
Consumers
```

## Lineage Description

| Stage | Description | Output |
|---|---|---|
| Raw Source Files | Original input files stored in `Sample_Sets/` | Unmodified source data |
| Ingestion Layer | Reads supported file formats into standardized data structures | In-memory standardized datasets |
| Schema Contract Validation | Compares source data against YAML schema contracts | Validation status and issues |
| Data Catalog Generation | Produces human-readable dataset documentation | `docs/DATA_CATALOG.md` |
| Validation Results Generation | Produces validation summary output | `output/validation/validation_summary.csv` |
| Analytics & Reporting Consumers | Represents downstream users, BI tools, ETL pipelines, or reporting workflows | Governed data artifacts |

## Governance Value

This lineage pattern supports governance by showing:

- Where source data enters the framework
- Where validation controls are applied
- Which artifacts are produced for documentation and auditability
- How downstream consumers benefit from standardized intake outputs
