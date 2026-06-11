# Processing Flow

## Purpose

This document describes the runtime processing flow for the framework.

```mermaid
flowchart TD
    A[Start Pipeline] --> B[Load Configuration and Dependencies]
    B --> C[Discover Source Files]
    C --> D[Ingest Supported Files]
    D --> E[Load Matching Schema Contracts]
    E --> F{Schema Exists?}
    F -- Yes --> G[Validate Dataset]
    F -- No --> H[Record Missing Contract]
    G --> I[Write Validation Summary]
    H --> I
    I --> J[Generate Data Catalog]
    J --> K[End Pipeline]
```

## Design Notes

- Source discovery is separated from validation logic.
- Schema existence is treated as an explicit validation condition.
- Validation outputs are generated as reproducible artifacts.
- Documentation generation is part of the pipeline rather than a manual afterthought.
