library(lubridate)
library(readr)
library(tidyverse)

ministry <- readr::read_csv("data-raw/ministry.csv",
                            col_names = TRUE,
                            col_types = cols(
                              ministry = col_character(),
                              ministry_number = col_integer(),
                              ministry_party = col_character(),
                              ministry_title = col_character(),
                              uniqueID = col_character(),
                              ministry_name = col_character(),
                              ministry_from = col_date(format = ""),
                              ministry_to = col_date(format = ""),
                              ministry_assistant_minister_or_parliamentary_secretary = col_character(),
                              ministry_comment = col_character()
                              ))



usethis::use_data(ministry)
