## code to prepare `DATASET` dataset goes here

library(tidyverse)
politicians <- read_csv("~/Downloads/individuals.csv",
                        col_names = TRUE,
                        cols(
                          unique_ID = col_character(),
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

usethis::use_data(politicians)
