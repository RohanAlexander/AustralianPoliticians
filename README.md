
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
  - **appointments.rda**: A very provisional dataset that will
    eventually be all ministers etc. Don’t use it for anything yet.

![alt text](man/figures/schema.png)

The datasets are up-to-date as of 19 November 2019 (i.e. they include
the deaths of Fisher and Darling; Henderson’s appointment; Sinodinos’
retirement; Molan’s appointment).

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

``` r
head(AustralianPoliticians::all)
#>     uniqueID surname          allOtherNames firstName commonName
#> 1 Abbott1859  Abbott  Richard Hartley Smith   Richard       <NA>
#> 2 Abbott1869  Abbott           Percy Phipps     Percy       <NA>
#> 3 Abbott1877  Abbott              Macartney Macartney        Mac
#> 4 Abbott1886  Abbott Charles Lydiard Aubrey   Charles     Aubrey
#> 5 Abbott1891  Abbott          Joseph Palmer    Joseph       <NA>
#> 6 Abbott1957  Abbott           Anthony John   Anthony       Tony
#>       displayName earlierOrLaterNames title gender  birthDate birthYear
#> 1 Abbott, Richard                <NA>  <NA>   male       <NA>      1859
#> 2   Abbott, Percy                <NA>  <NA>   male 1869-05-14      1869
#> 3     Abbott, Mac                <NA>  <NA>   male 1877-07-03      1877
#> 4  Abbott, Aubrey                <NA>  <NA>   male 1886-01-04      1886
#> 5  Abbott, Joseph                <NA>  <NA>   male 1891-10-18      1891
#> 6    Abbott, Tony                <NA>  <NA>   male 1957-11-04      1957
#>     birthPlace  deathDate member senator wasPrimeMinister wikidataID
#> 1      Bendigo 1940-02-28      0       1               NA   Q7323613
#> 2       Hobart 1940-09-09      1       1               NA   Q7167212
#> 3   Murrurundi 1960-12-30      0       1               NA   Q6722175
#> 4  St Leonards 1975-04-30      1       0               NA   Q4819077
#> 5 North Sydney 1965-05-07      1       0               NA   Q6208273
#> 6       London       <NA>      1       0                1    Q348577
#>                                                            wikipedia  adb
#> 1          https://en.wikipedia.org/wiki/Richard_Abbott_(politician) <NA>
#> 2 https://en.wikipedia.org/wiki/Percy_Abbott_(Australian_politician) <NA>
#> 3                           https://en.wikipedia.org/wiki/Mac_Abbott <NA>
#> 4                        https://en.wikipedia.org/wiki/Aubrey_Abbott <NA>
#> 5   https://en.wikipedia.org/wiki/Joe_Abbott_(Australian_politician) <NA>
#> 6                          https://en.wikipedia.org/wiki/Tony_Abbott <NA>
#>   comments
#> 1     <NA>
#> 2     <NA>
#> 3     <NA>
#> 4     <NA>
#> 5     <NA>
#> 6     <NA>
```

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
mpsEndReason; mpsChangedSeat; and mpsComments.

``` r
head(AustralianPoliticians::by_division_mps)
#>     uniqueID    division stateOfDivision enteredAtByElection     mpFrom
#> 1 Abbott1869 New England             NSW                  No 1913-05-31
#> 2 Abbott1886      Gwydir             NSW                  No 1925-11-14
#> 3 Abbott1886      Gwydir             NSW                  No 1931-12-19
#> 4 Abbott1891 New England             NSW                  No 1940-09-21
#> 5 Abbott1957   Warringah             NSW                 Yes 1994-03-26
#> 6   Abel1939       Evans             NSW                  No 1975-12-13
#>         mpTo mpEndReason mpChangedSeat mpComments
#> 1 1919-11-03     Retired            NA       <NA>
#> 2 1929-10-12    Defeated            NA       <NA>
#> 3 1937-03-28    Resigned            NA       <NA>
#> 4 1949-10-31     Retired            NA       <NA>
#> 5 2019-05-18    Defeated            NA       <NA>
#> 6 1977-11-10     Retired            NA       <NA>
```

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

``` r
head(AustralianPoliticians::by_party)
#>     uniqueID partyAbbrev                  partyName  partyFrom    partyTo
#> 1 Abbott1859          CP   Australian Country Party       <NA>       <NA>
#> 2 Abbott1869          CP   Australian Country Party 1919-11-03       <NA>
#> 3 Abbott1869         LIB Liberal Party of Australia       <NA> 1917-02-17
#> 4 Abbott1869         NAT          Nationalist Party 1917-02-17 1919-11-03
#> 5 Abbott1877          CP   Australian Country Party       <NA>       <NA>
#> 6 Abbott1886          CP   Australian Country Party       <NA>       <NA>
#>   partyChangedName partySimplifiedName partySpecificDateInputted partyComments
#> 1               NA           Nationals                        NA          <NA>
#> 2               NA           Nationals                        NA          <NA>
#> 3               NA            Liberals                        NA          <NA>
#> 4               NA   Nationalist Party                        NA          <NA>
#> 5               NA           Nationals                        NA          <NA>
#> 6               NA           Nationals                        NA          <NA>
```

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
senatorsTo; senatorsEndReason; senatorsSec15Sel; and senatorsComments.

``` r
head(AustralianPoliticians::by_state_senators)
#>      uniqueID senatorsState senatorFrom  senatorTo senatorEndReason sec15Sel
#> 1  Abbott1859           VIC  1928-12-18 1929-06-30          Retired        1
#> 2  Abbott1869           NSW  1925-11-14 1929-06-30         Defeated        0
#> 3  Abbott1877           NSW  1935-07-01 1941-06-30         Defeated        0
#> 4   Abetz1958           TAS  1994-02-22       <NA>             <NA>        1
#> 5   Adams1943            WA  2005-07-01 2012-03-31             Died        0
#> 6 Adamson1857           QLD  1920-07-01 1922-05-02             Died        0
#>   senatorComments
#> 1            <NA>
#> 2            <NA>
#> 3            <NA>
#> 4            <NA>
#> 5            <NA>
#> 6            <NA>
```

This dataset is fairly similar to by\_division\_mps, expect that it also
has senatorsSec15Sel This is a binary indicator variable and indicates
whether the senator has been appointed rather than elected.

### uniqueID\_to\_aphID.rda

This dataset adds a correspondence between the unique identifiers used
in these datasets and the identifier used by the Australian Parliament
House on its website. the main issue with the APH identifier is that it
is not clear who it is referring to without looking it up. Additionally,
in certain cases it changes from time to time, and it is easy to
accidently change the format by opening it in Excel.

``` r
head(AustralianPoliticians::uniqueID_to_aphID)
#>     uniqueID aphID idsComments
#> 1 Abbott1957   EZ5        <NA>
#> 2 Abbott1886   JLJ        <NA>
#> 3 Abbott1891   JLL        <NA>
#> 4 Abbott1877   JNT        <NA>
#> 5 Abbott1869   JLM        <NA>
#> 6 Abbott1859   JYU        <NA>
```

### appointments.rda

This dataset adds the beginnings of a dataset about ministerial
appointments. Don’t use it yet.

``` r
head(AustralianPoliticians::positions)
#>     uniqueID                                   position_name positionWikidataID
#> 1 Abbott1957                     Prime Minister of Australia            Q319145
#> 2 Abbott1957              Commonwealth Chairperson-in-Office           Q5153709
#> 3 Abbott1957                             Minister for Health           Q6865857
#> 4 Abbott1957                             Leader of the House          Q16147127
#> 5 Abbott1957 Minister for Employment and Workplace Relations           Q6865809
#> 6 Abbott1957                Minister for Employment Services          Q61791242
#>   start_date   end_date
#> 1 2013-09-18 2015-09-15
#> 2 2013-09-18 2013-11-15
#> 3 2003-10-07 2007-12-03
#> 4 2001-11-26 2007-12-03
#> 5 2001-01-30 2003-10-07
#> 6 1998-10-21 2001-01-30
```

## TODO

  - all.rda: The most recent entrants have incomplete uniqueIDs because
    their birthdays haven’t been published yet. This needs to be updated
    as soon as the birthdays are released.
  - all.rda: Need to go through and update the the titles fields - it’s
    very inconsistent.

## Roadmap

  - Add dataset of ministers with dates.
  - Add information about education.
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
