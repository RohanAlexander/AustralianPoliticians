## code to prepare all_individuals dataset goes here
library(readr)

by_division_mps <- read_csv("data-raw/by_division_mps.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          mpsDivision = col_character(),
                          mpsState = col_character(),
                          mpsEnteredAtByElection = col_character(),
                          mpsFrom = col_date(format = ""),
                          mpsTo = col_date(format = ""),
                          mpsEndReason = col_character(),
                          mpsChangedSeat = col_integer(),
                          mpsComments = col_character()
                        ))

usethis::use_data(by_division_mps)
