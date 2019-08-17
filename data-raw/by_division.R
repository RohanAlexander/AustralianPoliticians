## code to prepare all_individuals dataset goes here
library(readr)

by_division <- read_csv("data-raw/by_division.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          division = col_character(),
                          state = col_character(),
                          electionDate = col_date(format = ""),
                          byElection = col_character(),
                          reasonCeasedToBeMember = col_character(),
                          changedSeat = col_character(),
                          ceasedToBeMemberDate = col_date(format = ""),
                          Comment = col_character()
                        ))

usethis::use_data(by_division)
