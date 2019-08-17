## code to prepare by_house dataset goes here
library(readr)

by_house <- read_csv("data-raw/by_house.csv",
                     col_names = TRUE,
                     col_types = cols(
                       uniqueID = col_character(),
                       house = col_character()
                       ))

usethis::use_data(by_house)
