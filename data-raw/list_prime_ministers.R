## code to prepare all_individuals dataset goes here
library(readr)

list_prime_ministers <- read_csv("data-raw/list_prime_ministers.csv",
                                 col_names = TRUE,
                                 col_types = cols(
                                   uniqueID = col_character(),
                                   wasPrimeMinister = col_integer()
                                   ))

usethis::use_data(list_prime_ministers)
