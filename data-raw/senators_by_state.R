## code to prepare all_individuals dataset goes here
library(readr)

senators_by_state <- read_csv("data-raw/senators_by_state.csv",
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

usethis::use_data(senators_by_state)
