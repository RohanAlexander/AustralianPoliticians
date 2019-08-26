## code to prepare all_individuals dataset goes here
library(readr)

uniqueID_to_aphID <- read_csv("data-raw/uniqueID_to_aphID.csv",
                                 col_names = TRUE,
                                 col_types = cols(
                                   uniqueID = col_character(),
                                   aphID = col_character(),
                                   comments = col_character()
                                   ))

usethis::use_data(uniqueID_to_aphID)
