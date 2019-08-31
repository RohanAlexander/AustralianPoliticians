## code to prepare all_individuals dataset goes here
library(readr)

by_state_senators <- read_csv("data-raw/by_state_senators.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          senatorsState = col_character(),
                          senatorsFrom = col_date(format = ""),
                          senatorsTo = col_date(format = ""),
                          senatorsEndReason = col_character(),
                          senatorsSec15Sel = col_integer(),
                          senatorsComments = col_character()
                        ))

usethis::use_data(by_state_senators)
