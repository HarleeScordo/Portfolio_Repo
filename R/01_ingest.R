# R/01_ingest.R
install.packages(readr)
install.packages(readxl)
install.packages(dplyr)
install.packages(stringr)
install.packages(purrr)

library(readr)
library(readxl)
library(dplyr)
library(stringr)
library(purrr)

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
