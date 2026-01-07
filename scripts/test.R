# scripts/test.R
source("R/utilities.R")
check_prereqs()
load_pkgs()

source("R/01_ingest.R")
source("R/03_document.R")

ingested <- ingest_folder("Sample_Sets")
stopifnot(nrow(ingested) > 0)

catalog <- build_catalog(ingested)
stopifnot(nrow(catalog) > 0)

message("Smoke test passed.")
