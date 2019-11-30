library(lubridate)
library(readr)
library(tidyverse)

cabinet <- readr::read_csv("data-raw/cabinet.csv",
                        col_names = TRUE,
                        col_types = cols(
                          cabinet = col_character(),
                          cabinet_number = col_integer(),
                          cabinet_name = col_character(),
                          uniqueID = col_character(),
                          cabinet_from = col_date(format = ""),
                          cabinet_to = col_date(format = ""),
                          cabinet_comment = col_character()
                        ))



usethis::use_data(cabinet)
