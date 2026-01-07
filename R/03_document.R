# R/03_document.R

profile_dataset <- function(df) {
  tibble(
    n_rows = nrow(df),
    n_cols = ncol(df),
    columns = paste(names(df), collapse = ", ")
  )
}

build_catalog <- function(ingested_tbl) {
  # ingested_tbl is expected to have at least:
  # - dataset (filename)
  # - data (a data.frame/tibble per dataset)

  ingested_tbl |>
    dplyr::mutate(
      n_rows = purrr::map_int(data, nrow),
      n_cols = purrr::map_int(data, ncol),
      columns = purrr::map(data, names)  # <-- list-column of character vectors
    ) |>
    dplyr::select(dataset, n_rows, n_cols, columns) |>
    dplyr::arrange(dataset)
}


write_catalog_md <- function(catalog_tbl, out_path = "docs/DATA_CATALOG.md") {
  dir.create(dirname(out_path), recursive = TRUE, showWarnings = FALSE)

  lines <- c(
    "# Data Catalog",
    "",
    "This catalog is auto-generated from the files in `Sample_Sets/` and summarizes dataset structure.",
    "",
    "---",
    ""
  )

  for (i in seq_len(nrow(catalog_tbl))) {
    dataset <- catalog_tbl$dataset[[i]]
    n_rows  <- catalog_tbl$n_rows[[i]]
    n_cols  <- catalog_tbl$n_cols[[i]]
    cols    <- catalog_tbl$columns[[i]]

    # Defensive: handle empty / missing columns
    if (is.null(cols) || length(cols) == 0) cols <- character(0)

    lines <- c(
      lines,
      paste0("## ", dataset),
      "",
      paste0("**Rows:** ", format(n_rows, big.mark = ","), "  "),
      paste0("**Columns:** ", n_cols),
      "",
      "**Columns:**",
      if (length(cols) == 0) "- *(No columns detected)*" else paste0("- ", cols),
      "",
      "**Notes:**",
      "- _Optional: add dataset purpose / grain here._",
      "",
      "---",
      ""
    )
  }

  writeLines(lines, out_path)
  invisible(out_path)
}
