## R/utilities.R

required_pkgs <- c(
  "readr", 
  "readxl", 
  "dplyr", 
  "stringr",
  "purrr", 
  "tibble", 
  "tidyr", 
  "yaml", 
  "knitr"
)


check_prereqs <- function() {
  missing <- required_pkgs[!vapply(required_pkgs, requireNamespace, FUN.VALUE = logical(1), quietly = TRUE)]
  if (length(missing) > 0) {
    stop(
      "Missing required packages: ", paste(missing, collapse = ", "),
      "\nRun: Rscript scripts/setup.R",
      call. = FALSE
    )
  }
  invisible(TRUE)
}

load_pkgs <- function() {
  suppressPackageStartupMessages({
    library(readr)
    library(readxl)
    library(dplyr)
    library(stringr)
    library(purrr)
    library(tibble)
    library(tidyr)
    library(yaml)
    library(knitr)
  })
  invisible(TRUE)
}

# Optional: simple logger utility
log_info <- function(...) message("[INFO] ", paste0(..., collapse = ""))
log_warn <- function(...) warning("[WARN] ", paste0(..., collapse = ""), call. = FALSE)
