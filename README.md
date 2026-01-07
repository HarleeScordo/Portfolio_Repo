# Portfolio_Repo

# Documented Data Intake & Validation Framework (R)

## Overview

This project demonstrates a **documentation-first, reproducible data intake framework** built in R.  
It is designed to showcase how heterogeneous data sources can be ingested, documented, validated, and standardized for downstream analytics, reporting, or BI tools.

The emphasis of this project is **data governance, documentation quality, and reproducibility**, rather than exploratory analysis.

---

## Objectives

- Standardize ingestion of mixed-format datasets (CSV, Excel)
- Produce **human-readable documentation** (data catalogs)
- Enforce **machine-readable data contracts**
- Surface data quality and schema issues early
- Generate clean, standardized outputs suitable for analytics pipelines

---

## Repository Structure


├── Sample_Sets/ # Raw sample datasets (CSV, XLSX)
├── R/
│ ├── 01_ingest.R # File ingestion logic
│ ├── 02_validate.R # Schema and data validation
│ ├── 03_document.R # Automated documentation generation
│ └── 04_export.R # Standardized outputs
├── contracts/ # Dataset schema definitions (YAML)
├── docs/
│ ├── DATA_CATALOG.md # Auto-generated data catalog
│ └── decisions/ # Architecture & design decisions
├── reports/ # Generated documentation reports
├── output/ # Processed datasets and validation results
├── renv.lock
└── README.md


---

## Included Sample Datasets

The `Sample_Sets/` directory contains multiple heterogeneous datasets used to demonstrate intake and documentation patterns, including:

- Vehicle sales data  
- CO₂ emissions data  
- Energy consumption data  
- GDP totals  
- Population totals  
- Date reference tables  

These datasets are treated as **raw inputs** and are not modified in place.

---

## Documentation Approach

This project intentionally separates documentation into multiple layers:

### 1. Data Catalog (Human-Readable)

The data catalog provides:
- Dataset purpose
- Row and column counts
- Column names and structure
- Intended analytical grain

Generated automatically at:


---

### 2. Data Contracts (Machine-Enforced)

Each dataset has an associated schema definition describing:
- Required columns
- Expected data types
- Primary keys (where applicable)

Schemas are stored in:


Validation is performed during ingestion to surface structural issues early.

---

### 3. Design Decisions

Architectural and design trade-offs are documented using lightweight decision records:


This mirrors documentation practices commonly used in production and regulated environments.

---

## How to Run Locally

Restore dependencies and execute the pipeline:

```r
renv::restore()
source("R/run.R")
