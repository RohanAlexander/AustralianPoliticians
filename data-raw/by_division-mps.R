## code to prepare all_individuals dataset goes here
library(readr)

by_division_mps <- read_csv("data-raw/by_division_mps.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          division = col_character(),
                          stateOfDivision = col_character(),
                          enteredAtByElection = col_character(),
                          mpFrom = col_date(format = ""),
                          mpTo = col_date(format = ""),
                          mpEndReason = col_character(),
                          mpChangedSeat = col_integer(),
                          mpComments = col_character()
                        ))



usethis::use_data(by_division_mps)
