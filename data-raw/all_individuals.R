## code to prepare all_individuals dataset goes here
library(readr)

all_individuals <- read_csv("data-raw/all_individuals.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          hansardID = col_character(),
                          surname = col_character(),
                          allOtherNames = col_character(),
                          firstName = col_character(),
                          commonName = col_character(),
                          displayName = col_logical(),
                          earlierOrLaterNames = col_character(),
                          title = col_character(),
                          gender = col_character(),
                          birthDate = col_date(format = ""),
                          birthYear = col_integer(),
                          deathDate = col_date(format = ""),
                          comments = col_character(),
                          wikipedia = col_character(),
                          adb = col_character()
                        ))

usethis::use_data(all_individuals)
