
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AustralianPoliticians

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/RohanAlexander/AustralianPoliticians.svg?branch=master)](https://travis-ci.org/RohanAlexander/AustralianPoliticians)
<!-- badges: end -->

`AustralianPoliticians` is an collection of datasets related to
Australian politicians. The datasets are:

  - all: The main dataset.
  - by\_division\_mps: Adds information about the division (‘seat’) of
    the politician.
  - by\_party. Adds information about the party of the politician.
  - by\_state\_senators. Adds information about the state that a senator
    was representing.
  - list\_prime\_ministers. Whether the politician was prime minister.
  - uniqueID\_to\_aphID. A correspondence between the uniqueIDs used in
    these datasets and the IDs used by the Australian Parliament House.

The datasets are up-to-date as of 26 August 2019.

## Installation

You can install this package from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("RohanAlexander/AustralianPoliticians")
```

## Example

This is a example of how to load the data:

``` r
library(tidyverse)

devtools::install_github("RohanAlexander/AustralianPoliticians")

all_individuals <- AustralianPoliticians::all_individuals %>% as_tibble()
mps_by_division <- AustralianPoliticians::mps_by_division %>% as_tibble()
by_party <- AustralianPoliticians::by_party %>% as_tibble()
senators_by_state <- AustralianPoliticians::senators_by_state %>% as_tibble()
list_prime_ministers <- AustralianPoliticians::list_prime_ministers %>% as_tibble()

summary(all_individuals)
```

You could then combine the tables using left\_join:

``` r
all_individuals_with_their_division <- all_individuals %>% 
  left_join(mps_by_division, by = c("uniqueID"))
```

## Dataset details

### all

  - all\_individuals. The key dataset. One row per politician, with
    columns: uniqueID, hansardID (for linking to hansard), surname,
    allOtherNames, firstName, commonName, displayName,
    earlierOrLaterNames, title, gender, birthDate, birthYear, deathDate,
    comments, wikipedia, adb.

### bydivision

  - mps\_by\_division Adds information about the division (‘seat’) of
    the politician. One row per division-politician, with columns:
    uniqueID, division, state, electionDate, byElection,
    reasonCeasedToBeMember, changedSeat, ceasedToBeMemberDate, Comment.
  - senators\_by\_state. Adds information about the state that a senator
    was representing.
  - by\_party. Adds information about the party of the politician. One
    row per party-politician, with columns: uniqueID, party, partyFrom,
    partyTo, comment.
  - list\_prime\_ministers. Adds information about whether the
    politician has been prime minister. One row per politician, with
    columns: uniqueID, wasPrimeMinister.

## Where are the bodies buried?

  - Some of the individuals don’t have a birthdate - only a year.
    Probably more work could be done to try to reduce this number.
  - Party is slightly confusing ATM. Certain parties, such as the
    nationals, changed their name and this is included as a party change
    for people at that time. It doesn’t make sense, but the alternative
    requires coming up with a ‘display name’ equivalent for party, and
    I’ve started doing that, but doing that raises other questions.
    Also, at the moment, party is tied to parliament, but that doesn’t
    necessarily make sense. For instance, Malcolm Fraser left the
    liberals after he left parliament. Similarly if someone changed
    party while they were out of parliament then I have the date that
    they joined their new party as the date the rejoined parliment.
  - Sometimes the divisions change name. This is being treated as a
    different division, but it doesn’t always make sense.

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

  - The Parliamentary Library in the first instance.
  - Wikipedia wherever possible.
