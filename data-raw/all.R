## code to prepare all_individuals dataset goes here
library(lubridate)
library(readr)
library(tidyverse)

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
                          birthPlace = col_character(),
                          deathDate = col_date(format = ""),
                          member = col_integer(),
                          senator = col_integer(),
                          wasPrimeMinister = col_integer(),
                          wikidataID = col_character(),
                          wikipedia = col_character(),
                          adb = col_character(),
                          comments = col_character()
                        ))

all <- all %>%
  mutate(birthYear = if_else(is.na(birthYear), year(birthDate), as.double(birthYear)),
         birthYear = as.integer(birthYear))


usethis::use_data(all)
