##Packages--

install.packages("readr")
install.packages("readxl")
install.packages("dplyr")
install.packages("stringr")
install.packages("purrr")
install.packages("tibble")
install.packages("yaml")

library("readr")
library("readxl")
library("dplyr")
library("stringr")
library("purrr")
library("tibble")
library("yaml")

# R/run.R
source("R/01_ingest.R")
source("R/03_document.R")

ingested <- ingest_folder("Sample_Sets")
catalog <- build_catalog(ingested)

write_catalog_md(catalog, "docs/DATA_CATALOG.md")
print(catalog)