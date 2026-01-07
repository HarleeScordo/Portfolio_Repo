# R/03_document.R
suppressPackageStartupMessages({
  library(dplyr)
  library(purrr)
  library(tibble)
})

profile_dataset <- function(df) {
  tibble(
    n_rows = nrow(df),
    n_cols = ncol(df),
    columns = paste(names(df), collapse = ", ")
  )
}

build_catalog <- function(ingested_tbl) {
  ingested_tbl |>
    mutate(profile = map(data, profile_dataset)) |>
    tidyr::unnest(profile) |>
    select(dataset, n_rows, n_cols, columns)
}

write_catalog_md <- function(catalog, out_path = "docs/DATA_CATALOG.md") {
  dir.create(dirname(out_path), recursive = TRUE, showWarnings = FALSE)

  header <- c(
    "# Data Catalog",
    "",
    "This catalog is generated from the files in `Sample_Sets/` and summarizes dataset structure.",
    ""
  )

  table_md <- knitr::kable(catalog, format = "pipe")

  writeLines(c(header, table_md, ""), out_path)
}
