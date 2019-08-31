## code to prepare by_party dataset goes here
library(readr)

by_party <- read_csv("data-raw/by_party.csv",
                     col_names = TRUE,
                     col_types = cols(
                       uniqueID = col_character(),
                       partyAbbrev = col_character(),
                       partyName = col_character(),
                       partyFrom = col_date(format = "%AD"),
                       partyTo = col_date(format = ""),
                       partyChangedName = col_integer(),
                       partySimplifiedName = col_character(),
                       partySpecificDateInputted = col_integer(),
                       partyComments = col_character()
                     ))

usethis::use_data(by_party)
