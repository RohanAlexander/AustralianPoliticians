## code to prepare all_individuals dataset goes here
library(readr)

by_state_senators <- read_csv("data-raw/by_state_senators.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          senatorsState = col_character(),
                          senatorFrom = col_date(format = ""),
                          senatorTo = col_date(format = ""),
                          senatorEndReason = col_character(),
                          sec15Sel = col_integer(),
                          senatorComments = col_character()
                        ))



usethis::use_data(by_state_senators)
