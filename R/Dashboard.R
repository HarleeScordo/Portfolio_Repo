source("R/utilities.R")
source("R/01_ingest.R")
source("R/03_document.R")

dir.create("docs", showWarnings = FALSE, recursive = TRUE)

ingested <- ingest_folder("Sample_Sets")
catalog  <- build_catalog(ingested)

write_catalog_md(catalog, "docs/DATA_CATALOG.md")
print(catalog)

message("Wrote docs/DATA_CATALOG.md")
