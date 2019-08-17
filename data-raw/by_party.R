## code to prepare by_party dataset goes here
library(readr)

by_party <- read_csv("data-raw/by_party.csv",
                     col_names = TRUE,
                     col_types = cols(
                       uniqueID = col_character(),
                       party = col_character(),
                       partyFrom = col_date(format = ""),
                       partyTo = col_date(format = ""),
                       comment = col_character()
                       ))

usethis::use_data(by_party)
