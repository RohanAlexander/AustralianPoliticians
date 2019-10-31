
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AustralianPoliticians <img src="man/figures/AustralianPoliticians.png" width="240px" align="right" />

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/RohanAlexander/AustralianPoliticians.svg?branch=master)](https://travis-ci.org/RohanAlexander/AustralianPoliticians)
<!-- badges: end -->

`AustralianPoliticians` is a collection of datasets related to
Australian politicians. The datasets are:

  - **all.rda**: The main dataset.
  - **by\_division\_mps.rda**: Adds information about the division
    (‘seat’) of the politician.
  - **by\_party.rda**: Adds information about the party of the
    politician.
  - **by\_state\_senators.rda**: Adds information about the state that a
    senator was representing.
  - **uniqueID\_to\_aphID.rda**: A correspondence between the uniqueIDs
    used in these datasets and the IDs used by the Australian Parliament
    House.

![alt text](man/figures/schema.png)

The datasets are up-to-date as of 31 October 2019 (i.e. they include the
deaths of Tim Fisher and Elaine Darling, and the appointment of Sarah
Henderson).

If you are using this for anything other than general interest, then
please check the comments column in case there is a flag that could
affect your results. You’re also welcome to get in touch so that I can
make sure that the aspect you’re interested in is of a good enough
quality for your purposes.

If you have suggestions on how I could improve the datasets, or
corrections, please don’t hesitate to get in touch.

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

all <- AustralianPoliticians::all %>% as_tibble()
by_division_mps <- AustralianPoliticians::by_division_mps %>% as_tibble()
by_party <- AustralianPoliticians::by_party %>% as_tibble()
by_state_senators <- AustralianPoliticians::by_state_senators %>% as_tibble()
uniqueID_to_aphID <- AustralianPoliticians::uniqueID_to_aphID %>% as_tibble()
```

You could then combine the tables using left\_join:

``` r
all_individuals_with_their_division <- all %>% 
  left_join(by_division_mps, by = c("uniqueID"))
```

Monica Alexander has written a brief blog post where she uses the
package to look at life expectency of Australian
politicians:  
<https://www.monicaalexander.com/posts/2019-08-09-australian_politicians/>

## Dataset details

### all.rda

This is the main dataset and contains one row per politician, with
columns: uniqueID, surname, allOtherNames, firstName, commonName,
displayName, earlierOrLaterNames, title, gender, birthDate, birthYear,
birthPlace, deathDate, member, senator, wikidataID, wikipedia, adb, and
comments.

<img src="man/figures/all.png" width="1138px" height="111px" />

uniqueID is usually the surname of the politician and the year that they
were born, e.g. Abbott1859. In certain cases this is not enough to
uniquely identify them and then we add the first name,
e.g. AndersonCharles1897 and AndersonGordon1897. In cases where there
is punctuation in the surname, e.g. Ashley-Brown or O’Brien, this has
been removed but capitalisation has been retained, so those would become
AshleyBrown or OBrien, respectively.

commonName is used to highlight the name that the politician tended to
be known as e.g. Ted instead of Edward This is used in displayName which
is a politicians surname and their common name (if they had one) or
first name e.g. Abbott, Richard. In cases where this would not be
unique, e.g. Francis Baker, an additional name has been added.

earlierOrLaterNames is mostly used to keep track of women changing their
names at marriage. Similarly, title is mostly used to keep track of
‘Dr’, but both have been used inconsistently and should be only used
sparingly.

Some politicians don’t have a complete birth date, and instead only have
a year of birth. In these cases their entry for birthDate will be empty,
but they will have a birthYear. All death dates are complete, but in the
case of one politician – John William Croft – this has been inputted, as
the circumstances and timing (even year) of his death are unknown.
birthPlace is mostly taken from WikiData, with a few updates. There are
some issues that need to be addressed here.

member and senator are binary indicator variables used to signify
whether the politician was in the lower or upper house. Most politicians
are only in one or the other, but some were in both. One politician in
the dataset was neither a senator nor an MP - Heather Elaine Hill. She
remains in the dataset because she was elected to the senate, and the
need for this dataset to exactly match the AustralianElections one),
however her eligibility was challenged and her election was invalidated,
so she was never a senator.

adb is a link to the Australian Dictionary of Biography.

### by\_division\_mps.rda

This dataset adds information about the division (‘seat’) of the
politician. One row per division-politician, with columns: uniqueID;
mpsDivision; mpsState; mpsEnteredAtByElection; mpsFrom; mpsTo;
mpsEndReason; mpsChangedSeat; and
mpsComments.

<img src="man/figures/by_division_mps.png" width="1138px" height="110px" />

Certain divisions change name. Sometimes this is minor, for instance
Kingsford-Smith to Kingsford Smith, and sometimes it is total. In all
cases this is being treated as change in division – the politician is
treated as finishing with one division and moving to another – but
changedSeat can be used to identify these cases and adjust for them if
necessary.

byElection is a binary indicator variable as to whether the politician
was entering the seat following a by-election.

changedSeat is a binary indicator variable as to whether the politician
left a division because they were changing the division, as opposed to
losing an election or retiring.

### by\_party.rda

This dataset adds information about the party of the politician. One row
per party-politician, with columns: uniqueID; partyAbbrev; partyName;
partyFrom; partyTo; partyChangedName; partySimplifiedName;
partySpecificDateInputted; and partyComments.

<img src="man/figures/by_party.png" width="1590/2px" height="111px" />

Party can be a little confusing in cases where a politician changed
party. In general, in this dataset, the to/from dates are set-up so that
when a politician is in parliament they will have the correct party.
However the dataset should not be used to say anything about when they
are out of parliament. For instance, some politicians lost their seat,
changed party, and then regained a seat in parliament. The dataset does
not know when they changed party while they were out of parliament, and
it assumes that they changed party either at the same time that they
lost their seat or at the same time as they re-gained a seat. Similarly,
there are plenty of cases where a politician has ceased being a member
after they leave parliament, for instance, Malcolm Fraser left the
Liberals. Again, that is not reflected in the dataset.

Certain parties, such as the Nationals, changed their name at various
points in time. This is included as a party change for people at that
time in partyAbbreviationParlHandbook and partyNameParlHandbook.
However, partySimplified abstracts away from that.

Party name changes:

  - The Country Party changed to the National Country Party on 3 May
    1975 according to <http://nla.gov.au/nla.news-article110636121>. It
    then changed from the National Country Party to the National Party
    of Australia on 17 October 1982 according to
    <http://nla.gov.au/nla.news-article116476081>. And finally, it
    changed from the National Party of Australia to The Nationals on 11
    October 2003 according to the party website.
  - The Nick Xenophon Team changed to Centre Alliance on 10 April 2018,
    according to ABC news reports.

### by\_state\_senators.rda

This dataset adds information about the state that a senator was
representing. The variables are: uniqueID; senatorsState; senatorsFrom;
senatorsTo; senatorsEndReason; senatorsSec15Sel; and
senatorsComments.

<img src="man/figures/by_state_senators.png" width="1872/2px" height="114px" />

This dataset is fairly similar to by\_division\_mps, expect that it also
has senatorsSec15Sel This is a binary indicator variable and indicates
whether the senator has been appointed rather than elected.

### uniqueID\_to\_aphID.rda

This dataset adds a correspondence between the unique identifiers used
in these datasets and the identifier used by the Australian Parliament
House on its website. the main issue with the APH identifier is that it
is not clear who it is referring to without looking it up. Additionally,
in certain cases it changes from time to time, and it is easy to
accidently change the format by opening it in
Excel.

<img src="man/figures/uniqueID_to_aphID.png" width="273px" height="107px" />

## TODO

  - all.rda: The most recent entrants have incomplete uniqueIDs because
    their birthdays haven’t been published yet. This needs to be updated
    as soon as the birthdays are released.
  - all.rda: Need to go through and update the the titles fields - it’s
    very inconsistent.

## Roadmap

  - Add dataset of ministers with dates.
  - Add information about birthplace and education.
  - Add information about relationships, for instance father-son, etc.
  - Add voting based on JFG’s dataset.

## Sources

In the first instance, the Parliamentary Handbook was the main source of
information. This was augmented with information from Wikipedia, the
Australian Dictionary of Biography, and the Senate Biographies wherever
possible. Limited information was obtained from other sources, such as
state parliaments and newspapers (via Trove), and these have generally
been specified in the comments. birthPlace is mostly from WikiData.

The uniqueID\_to\_aphID dataset was primarily drawn from a dataset put
together by Patrick Leslie, and it was checked against a modern dataset
from [Open
Australia](https://github.com/openaustralia/openaustralia-parser/blob/master/data/people.csv),
and Tim Sherratt’s Historic Hansard records for the
[Reps](http://historichansard.net/hofreps/people/) and
[Senate](http://historichansard.net/senate/people/).

## Acknowledgements

In terms of developing the package I am especially grateful for the
advice and help of:

  - Ben Readshaw,
  - Edward Howlett,
  - Kelly Lyons,
  - Monica Alexander,
  - Sharla Gelfand, and
  - Simon Munzert.

Thank you to Patrick Leslie who generously donated data.

The icon of parliaments used in the hex sticker was made by
<a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>
from
<a href="https://www.flaticon.com/"             title="Flaticon">www.flaticon.com</a>

</div>

## Citation

If you use `AustralianPoliticians`, please consider citing:

Alexander, Rohan. (2019). Three datasets on Australian politics. Working
paper.

## Author information

**Rohan Alexander** (corresponding author and repository maintainer)  
University of Toronto  
Information Sciences  
140 St George St  
Toronto, ON, Canada  
Email: <rohan.alexander@utoronto.ca>
