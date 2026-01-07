# R/02_validate.R
suppressPackageStartupMessages({
  library(yaml)
  library(dplyr)
  library(purrr)
})

infer_type <- function(x) {
  if (inherits(x, "Date")) return("date")
  if (is.numeric(x)) return("numeric")
  if (is.integer(x)) return("integer")
  if (is.logical(x)) return("logical")
  "string"
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
