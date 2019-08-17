
<!-- README.md is generated from README.Rmd. Please edit that file -->

# auspol

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/RohanAlexander/auspol.svg?branch=master)](https://travis-ci.org/RohanAlexander/auspol)
<!-- badges: end -->

`auspol` is an collection of datasets related to Australian politics
that I put together and kept having to copy from project to project. The
datasets are:

  - all\_individuals. The key dataset. One row per politician, with
    columns: uniqueID, hansardID (for linking to hansard), surname,
    allOtherNames, firstName, commonName, displayName,
    earlierOrLaterNames, title, gender, birthDate, birthYear, deathDate,
    comments, wikipedia, adb.
  - by\_division. Adds information about the division (‘seat’) of the
    politician. One row per division-politician, with columns: uniqueID,
    division, state, electionDate, byElection, reasonCeasedToBeMember,
    changedSeat, ceasedToBeMemberDate, Comment.
  - by\_house. Adds information about the house of parliament of the
    politician. One row per house-politician, with columns: uniqueID,
    house.
  - by\_party. Adds information about the party of the politician. One
    row per party-politician, with columns: uniqueID, party, partyFrom,
    partyTo, comment.
  - list\_prime\_ministers. Adds information about whether the
    politician has been prime minister. One row per politician, with
    columns: uniqueID, wasPrimeMinister.

## Installation

You can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("RohanAlexander/auspol")
```

## Example

This is a example of how to load the data:

``` r
library(tidyverse)

devtools::install_github("RohanAlexander/auspol")

all_individuals <- auspol::all_individuals %>% as_tibble()
by_division <- auspol::by_division %>% as_tibble()
by_house <- auspol::by_house %>% as_tibble()
by_party <- auspol::by_party %>% as_tibble()
list_prime_ministers <- auspol::list_prime_ministers %>% as_tibble()

summary(all_individuals)
```

You could then combine the tables using left\_join:

``` r
all_individuals_with_their_division <- all_individuals %>% 
  left_join(by_division, by = c("uniqueID"))
```
