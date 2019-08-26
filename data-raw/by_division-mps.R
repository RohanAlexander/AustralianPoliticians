## code to prepare all_individuals dataset goes here
library(readr)

by_division_mps <- read_csv("data-raw/by_division-mps.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          division = col_character(),
                          state = col_character(),
                          byElection = col_character(),
                          from = col_date(format = ""),
                          to = col_date(format = ""),
                          reasonCeasedToBeMember = col_character(),
                          changedSeat = col_integer(),
                          comments = col_character()
                        ))

usethis::use_data(by_division_mps)
