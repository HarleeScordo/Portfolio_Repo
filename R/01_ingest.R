# R/01_ingest.R

read_excel_best_sheet <- function(path, guess_max = 10000) {
  sheets <- readxl::excel_sheets(path)

  # Try each sheet, pick the one with the largest (rows * cols)
  candidates <- purrr::map(sheets, function(sh) {
    df <- tryCatch(
      readxl::read_excel(path, sheet = sh, guess_max = guess_max),
      error = function(e) NULL
    )
    if (is.null(df)) return(NULL)

    tibble::tibble(
      sheet = sh,
      n_rows = nrow(df),
      n_cols = ncol(df),
      score = nrow(df) * ncol(df),
      data = list(df)
    )
  }) |> dplyr::bind_rows()

  if (nrow(candidates) == 0) {
    return(tibble::tibble())
  }

  # Prefer sheets with at least 2 columns and >0 rows
  best <- candidates |>
    dplyr::arrange(dplyr::desc(n_cols >= 2), dplyr::desc(n_rows > 0), dplyr::desc(score)) |>
    dplyr::slice(1)

  best$data[[1]]
}


read_any <- function(path) {
  ext <- tolower(tools::file_ext(path))

  if (ext == "csv") {
    df <- readr::read_csv(path, show_col_types = FALSE, guess_max = 5000)
    return(df)
  }

  if (ext %in% c("xls", "xlsx")) {
    sheets <- readxl::excel_sheets(path)
    # Read first sheet by default; keep it simple + documented.
    df <- readxl::read_excel(path, sheet = sheets[[1]])
    return(as.data.frame(df))
  }

  stop("Unsupported file type: ", ext)
}

ingest_folder <- function(folder = "Sample_Sets") {
  files <- list.files(folder, full.names = TRUE)
  files <- files[tools::file_ext(files) %in% c("csv", "xlsx", "xls")]

  tibble::tibble(
    dataset = basename(files),
    path = files
  ) |>
    mutate(data = map(path, read_any))
}
