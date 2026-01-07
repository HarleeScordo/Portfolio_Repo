# R/02_validate.R
schema_path_for <- function(dataset_filename, contracts_dir = "contracts") {
  base <- tools::file_path_sans_ext(basename(dataset_filename))
  file.path(contracts_dir, paste0(base, ".schema.yml"))
}


infer_type <- function(x) {
  if (inherits(x, "Date")) return("date")
  if (is.numeric(x)) return("numeric")
  if (is.integer(x)) return("integer")
  if (is.logical(x)) return("logical")
  "string"
}

schema_path_for <- function(dataset_filename, contracts_dir = "contracts") {
  base <- normalize_dataset_name(dataset_filename)
  file.path(contracts_dir, paste0(base, ".schema.yml"))
}

validate_against_schema <- function(df, schema_path) {
  schema <- yaml::read_yaml(schema_path)

  expected <- schema$columns
  expected_names <- names(expected)
  actual_names <- names(df)

  missing_cols <- setdiff(expected_names, actual_names)
  extra_cols   <- setdiff(actual_names, expected_names)

  type_issues <- purrr::map_dfr(expected_names, function(col) {
    if (!col %in% actual_names) return(NULL)

    expected_type <- expected[[col]]$type
    actual_type <- infer_type(df[[col]])

    if (!identical(expected_type, actual_type)) {
      tibble::tibble(column = col, expected = expected_type, actual = actual_type)
    } else {
      NULL
    }
  })

  list(
    ok = length(missing_cols) == 0 && nrow(type_issues) == 0,
    missing_cols = missing_cols,
    extra_cols = extra_cols,
    type_issues = type_issues
  )
}

validate_all <- function(ingested_tbl, contracts_dir = "contracts") {
  ingested_tbl |>
    dplyr::mutate(
      schema_path = purrr::map_chr(dataset, schema_path_for, contracts_dir = contracts_dir),
      has_schema  = file.exists(schema_path),
      validation  = purrr::map2(data, schema_path, \(df, sp) {
        if (!file.exists(sp)) return(list(ok = NA, missing_cols = NA, extra_cols = NA, type_issues = tibble::tibble()))
        validate_against_schema(df, sp)
      })
    )
}

write_validation_summary <- function(validated_tbl, out_path = "output/validation/validation_summary.csv") {
  dir.create(dirname(out_path), recursive = TRUE, showWarnings = FALSE)

  summary <- validated_tbl |>
    dplyr::mutate(
      validation_passed = purrr::map_lgl(validation, ~ isTRUE(.x$ok)),
      missing_columns   = purrr::map_chr(validation, ~ paste(.x$missing_cols, collapse = "; ")),
      unexpected_columns = purrr::map_chr(validation, ~ paste(.x$extra_cols, collapse = "; "))
    ) |>
    dplyr::select(
      dataset,
      has_schema,
      validation_passed,
      missing_columns,
      unexpected_columns
    )

  readr::write_csv(summary, out_path)
  summary
}
