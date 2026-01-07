# scripts/run.R
# Entry point for non-interactive execution.
# Intended for CLI, CI/CD, and reproducible runs.


source("R/utilities.R")
check_prereqs()
load_pkgs()

source("R/01_ingest.R")
source("R/03_document.R")
source("R/02_validate.R")

dir.create("docs", recursive = TRUE, showWarnings = FALSE)

ingested <- ingest_folder("Sample_Sets")
catalog  <- build_catalog(ingested)

write_catalog_md(catalog, "docs/DATA_CATALOG.md")
print(catalog)

log_info("Wrote docs/DATA_CATALOG.md")


validated <- validate_all(ingested, contracts_dir = "contracts")
summary <- write_validation_summary(validated, "output/validation/validation_summary.csv")

print(summary)
log_info("Wrote output/validation/validation_summary.csv")
