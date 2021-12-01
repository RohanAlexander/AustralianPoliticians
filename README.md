
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AustralianPoliticians <img src="man/figures/AustralianPoliticians.png" align="right" height="200" />

The goal of `AustralianPoliticians` is to provide access to biographical
and political data about Australian federal politicians who served
between 1901 and 2021. This enhances the reproducibility of research
that uses this data. The datasets are:

-   **all**: The main dataset.
-   **mps**: Adds information about the division (‘seat’) of the
    politician.
-   **allbyparty**: Adds information about the party of the politician.
-   **senators**: Adds information about the state that a senator was
    representing.

The datasets are up-to-date as of 29 November 2021.

If you are using this for anything other than general interest, then
please check the comments column in case there is a flag that could
affect your results. You’re also welcome to get in touch so that I can
make sure that the aspect you’re interested in is of a good enough
quality for your purposes.

If you have suggestions on how I could improve the datasets, or
corrections, please don’t hesitate to get in touch.

## Installation

You can install the released version of `AustralianPoliticians` from
CRAN:

``` r
install.packages("AustralianPoliticians")
```

or the development version from GitHub with:

``` r
devtools::install_github("RohanAlexander/AustralianPoliticians")
```

## Example

This is a example of how to load the data:

``` r
library(tidyverse)

devtools::install_github("RohanAlexander/AustralianPoliticians")

all <- AustralianPoliticians::get_auspol('all')
party <- AustralianPoliticians::get_auspol('allbyparty')
mps <- AustralianPoliticians::get_auspol('mps')
senators <- AustralianPoliticians::get_auspol('senators')
```

You could then combine the tables using left\_join:

``` r
all_individuals_with_their_division <- all %>% 
  left_join(mps, by = c("uniqueID"))
```

Monica Alexander has written a brief blog post where she uses the
package to look at life expectancy of Australian politicians:  
<https://www.monicaalexander.com/posts/2019-08-09-australian_politicians/>

## Dataset details

### all

This is the main dataset and contains one row per politician, with
columns: uniqueID, surname, allOtherNames, firstName, commonName,
displayName, earlierOrLaterNames, title, gender, birthDate, birthYear,
birthPlace, deathDate, member, senator, wikidataID, wikipedia, adb, and
comments.

``` r
head(AustralianPoliticians::get_auspol('all'))
#> # A tibble: 6 × 20
#>   uniqueID   surname allOtherNames          firstName commonName displayName    
#>   <chr>      <chr>   <chr>                  <chr>     <chr>      <chr>          
#> 1 Abbott1859 Abbott  Richard Hartley Smith  Richard   <NA>       Abbott, Richard
#> 2 Abbott1869 Abbott  Percy Phipps           Percy     <NA>       Abbott, Percy  
#> 3 Abbott1877 Abbott  Macartney              Macartney Mac        Abbott, Mac    
#> 4 Abbott1886 Abbott  Charles Lydiard Aubrey Charles   Aubrey     Abbott, Aubrey 
#> 5 Abbott1891 Abbott  Joseph Palmer          Joseph    <NA>       Abbott, Joseph 
#> 6 Abbott1957 Abbott  Anthony John           Anthony   Tony       Abbott, Tony   
#> # … with 14 more variables: earlierOrLaterNames <chr>, title <chr>,
#> #   gender <chr>, birthDate <date>, birthYear <dbl>, birthPlace <chr>,
#> #   deathDate <date>, member <dbl>, senator <dbl>, wasPrimeMinister <dbl>,
#> #   wikidataID <chr>, wikipedia <chr>, adb <chr>, comments <chr>
```

uniqueID is usually the surname of the politician and the year that they
were born, e.g. Abbott1859. In certain cases this is not enough to
uniquely identify them and then we add the first name,
e.g. AndersonCharles1897 and AndersonGordon1897. In cases where there is
punctuation in the surname, e.g. Ashley-Brown or O’Brien, this has been
removed but capitalisation has been retained, so those would become
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

### mps

This dataset adds information about the division (‘seat’) of the
politician. One row per division-politician, with columns: uniqueID;
mpsDivision; mpsState; mpsEnteredAtByElection; mpsFrom; mpsTo;
mpsEndReason; mpsChangedSeat; and mpsComments.

``` r
head(AustralianPoliticians::get_auspol('mps'))
#> # A tibble: 6 × 9
#>   uniqueID   division    stateOfDivision enteredAtByElect… mpFrom     mpTo      
#>   <chr>      <chr>       <chr>           <chr>             <date>     <date>    
#> 1 Abbott1869 New England NSW             No                1913-05-31 1919-11-03
#> 2 Abbott1886 Gwydir      NSW             No                1925-11-14 1929-10-12
#> 3 Abbott1886 Gwydir      NSW             No                1931-12-19 1937-03-28
#> 4 Abbott1891 New England NSW             No                1940-09-21 1949-10-31
#> 5 Abbott1957 Warringah   NSW             Yes               1994-03-26 2019-05-18
#> 6 Abel1939   Evans       NSW             No                1975-12-13 1977-11-10
#> # … with 3 more variables: mpEndReason <chr>, mpChangedSeat <dbl>,
#> #   mpComments <chr>
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

### allbyparty

This dataset adds information about the party of the politician. One row
per party-politician, with columns: uniqueID; partyAbbrev; partyName;
partyFrom; partyTo; partyChangedName; partySimplifiedName;
partySpecificDateInputted; and partyComments.

``` r
head(AustralianPoliticians::get_auspol('allbyparty'))
#> # A tibble: 6 × 9
#>   uniqueID   partyAbbrev partyName        partyFrom  partyTo    partyChangedName
#>   <chr>      <chr>       <chr>            <date>     <date>                <dbl>
#> 1 Abbott1859 CP          Australian Coun… NA         NA                       NA
#> 2 Abbott1869 CP          Australian Coun… 1919-11-03 NA                       NA
#> 3 Abbott1869 LIB         Liberal Party o… NA         1917-02-17               NA
#> 4 Abbott1869 NAT         Nationalist Par… 1917-02-17 1919-11-03               NA
#> 5 Abbott1877 CP          Australian Coun… NA         NA                       NA
#> 6 Abbott1886 CP          Australian Coun… NA         NA                       NA
#> # … with 3 more variables: partySimplifiedName <chr>,
#> #   partySpecificDateInputted <dbl>, partyComments <chr>
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

-   The Country Party changed to the National Country Party on 3 May
    1975 according to <http://nla.gov.au/nla.news-article110636121>. It
    then changed from the National Country Party to the National Party
    of Australia on 17 October 1982 according to
    <http://nla.gov.au/nla.news-article116476081>. And finally, it
    changed from the National Party of Australia to The Nationals on 11
    October 2003 according to the party website.
-   The Nick Xenophon Team changed to Centre Alliance on 10 April 2018,
    according to ABC news reports.

### senators

This dataset adds information about the state that a senator was
representing. The variables are: uniqueID; senatorsState; senatorsFrom;
senatorsTo; senatorsEndReason; senatorsSec15Sel; and senatorsComments.

``` r
head(AustralianPoliticians::get_auspol('senators'))
#> # A tibble: 6 × 7
#>   uniqueID    senatorsState senatorFrom senatorTo  senatorEndReason sec15Sel
#>   <chr>       <chr>         <date>      <date>     <chr>               <dbl>
#> 1 Abbott1859  VIC           1928-12-18  1929-06-30 Retired                 1
#> 2 Abbott1869  NSW           1925-11-14  1929-06-30 Defeated                0
#> 3 Abbott1877  NSW           1935-07-01  1941-06-30 Defeated                0
#> 4 Abetz1958   TAS           1994-02-22  NA         <NA>                    1
#> 5 Adams1943   WA            2005-07-01  2012-03-31 Died                    0
#> 6 Adamson1857 QLD           1920-07-01  1922-05-02 Died                    0
#> # … with 1 more variable: senatorComments <chr>
```

This dataset is fairly similar to by\_division\_mps, expect that it also
has senatorsSec15Sel This is a binary indicator variable and indicates
whether the senator has been appointed rather than elected.

## Roadmap

-   ~~Add dataset of ministers with dates.~~
-   Add information about education.
-   Add information about relationships, for instance father-son, etc.
-   Add voting based on JFG’s dataset.

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

-   Ben Readshaw,
-   Edward Howlett,
-   Julia Haider,
-   Kelly Lyons,
-   Monica Alexander,
-   Sharla Gelfand, and
-   Simon Munzert.

Thank you to Patrick Leslie who generously donated data.

The icon of parliaments used in the hex sticker was made by
<a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a>
from
<a href="https://www.flaticon.com/"             title="Flaticon">www.flaticon.com</a>
</div>

## Author information

**Rohan Alexander** (corresponding author and repository maintainer)  
University of Toronto  
Faculty of Information and Department of Statistical Sciences 140 St
George St  
Toronto, ON, Canada  
Email: <rohan.alexander@utoronto.ca>

**Paul A. Hodgetts** University of Toronto  
Faculty of Information 140 St George St  
Toronto, ON, Canada
