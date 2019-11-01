## code to prepare all_individuals dataset goes here
library(lubridate)
library(readr)
library(tidyverse)

positions <- read_csv("data-raw/positions.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          position_name = col_character(),
                          positionWikidataID = col_character(),
                          start_date = col_date(format = "%Y-%m-%d"),
                          end_date = col_date(format = "%Y-%m-%d")
                        ))


usethis::use_data(positions)
