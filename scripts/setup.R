## scripts/setup.R

# Ensure a writable user library (especially in Codespaces)
if (Sys.getenv("R_LIBS_USER") == "") {
  Sys.setenv(R_LIBS_USER = path.expand("~/R/library"))
}
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE, showWarnings = FALSE)
.libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))

repos <- "https://cloud.r-project.org"

# Ensure renv exists (portfolio-grade reproducibility)
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv", repos = repos)
}

# If renv.lock exists, restore; otherwise initialize and snapshot
if (file.exists("renv.lock")) {
  renv::restore(prompt = FALSE)
} else {
  renv::init(bare = TRUE)
  renv::install(
  c("readr","readxl","dplyr","stringr","purrr","tibble","tidyr","yaml","knitr"),
  repos = repos
)

  renv::snapshot()
}

message("Setup complete. You can now run: Rscript scripts/run.R")
