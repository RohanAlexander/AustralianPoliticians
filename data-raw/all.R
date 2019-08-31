## code to prepare all_individuals dataset goes here
library(readr)

all <- read_csv("data-raw/all.csv",
                        col_names = TRUE,
                        col_types = cols(
                          uniqueID = col_character(),
                          surname = col_character(),
                          allOtherNames = col_character(),
                          firstName = col_character(),
                          commonName = col_character(),
                          displayName = col_character(),
                          earlierOrLaterNames = col_character(),
                          title = col_character(),
                          gender = col_character(),
                          birthDate = col_date(format = "%Y-%m-%d"),
                          birthYear = col_integer(),
                          deathDate = col_date(format = ""),
                          member = col_integer(),
                          senator = col_integer(),
                          wikidataID = col_character(),
                          wikipedia = col_character(),
                          adb = col_character(),
                          comments = col_character()
                        ))

usethis::use_data(all)
