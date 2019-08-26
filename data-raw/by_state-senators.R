## code to prepare all_individuals dataset goes here
library(readr)

by_state_senators <- read_csv("data-raw/by_state-senators.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          state = col_character(),
                          from = col_date(format = ""),
                          to = col_date(format = ""),
                          reasonCeasedToBeSenator = col_character(),
                          section15Selection = col_integer(),
                          comments = col_character()
                        ))

usethis::use_data(by_state_senators)
