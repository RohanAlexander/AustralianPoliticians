## code to prepare by_party dataset goes here
library(readr)

by_party <- read_csv("data-raw/by_party.csv",
                     col_names = TRUE,
                     col_types = cols(
                       uniqueID = col_character(),
                       partyAbbreviationParlHandbook = col_character(),
                       partyNameParlHandbook = col_character(),
                       partyFromParlHandbook = col_date(format = "%AD"),
                       partyToParlHandbook = col_date(format = ""),
                       partyChangedName = col_integer(),
                       partySimplified = col_character(),
                       specificDateWasInputted = col_integer(),
                       comments = col_character()
                     ))

usethis::use_data(by_party)
