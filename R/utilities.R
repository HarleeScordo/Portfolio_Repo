##Packages--

#Setup to run in terminal
#sudo apt-get update
#sudo apt-get install -y r-base r-base-dev
#Rscript -e 'install.packages(c("readr","readxl","dplyr","stringr","purrr","tibble","yaml","knitr"), repos="https://cloud.r-project.org")'

suppressPackageStartupMessages({
  library(readr)
  library(readxl)
  library(dplyr)
  library(stringr)
  library(purrr)
  library(tibble)
  library(yaml)
})
