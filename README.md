
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

## Where are the bodies buried?

  - all\_individuals. Some of the individuals don’t have a birthdate -
    only a year. Probably more work could be done to try to reduce this
    number.
  - Party is slightly confusing ATM. Certain parties, such as the
    nationals, changed their name and this is included as a party change
    for people at that time. It doesn’t make sense, but the alternative
    requires coming up with a ‘display name’ equivalent for party. Also,
    at the moment, party is tied to parliament, but that doesn’t
    necessarily make sense.
  - by\_division. Sometimes the divisions change name. This is being
    treated as a different division, but it doesn’t always make sense.

## Parties

  - Changed from the Country Party to the National Country Party on 3
    May 1975 according to <http://nla.gov.au/nla.news-article110636121>.
    Changed from National Country Party to National Party of Australia
    on 17 October 1982 according to
    <http://nla.gov.au/nla.news-article116476081>. Changed from National
    Party of Australai to The Nationals on 11 October 2003 according to
    the party website.
  - Nick Xenophon Team changed to Centre Alliance on 10 April 2018,
    according to ABC news reports.

## TODO

  - all\_individuals. The most recent entrants have incomplete uniqueIDs
    because their birthdays haven’t been published yet. This needs to be
    updated as soon as the birthdays are released.
  - The Title field within individuals is fairly dodgy. Ned to go back
    through and probably seperate out all drs and other or something.
    Also there is plenty that should by there that isn’t in there.

## Sources

  - TBD
