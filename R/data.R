#' All individuals
#'
#' This is data about every individual who has been elected to the Australian
#' House of Representatives or the Senate. Each row is an individual, and the
#' columns are various pieces of information.
#'
#' @format A data frame with 1,776 rows and 20 variables, as of 31 October 2019:
#' \describe{
#'  \item{uniqueID}{uniqueID is usually the surname of the politician and the year that they were born, e.g. Abbott1859. In certain cases this is not enough to uniquely identify them and then we add the first name, e.g. AndersonCharles1897 and AndersonGordon1897. In cases where there is punctuation in the surname, e.g. Ashley-Brown or O'Brien, this has been removed but capitalisation has been retained, so those would become AshleyBrown or OBrien, respectively.}
#'  \item{surname}{The surname of the politician.}
#'  \item{allOtherNames}{The other names of the politician.}
#'  \item{firstName}{The first name of the politician.}
#'  \item{commonName}{commonName is used to highlight the name that the politician tended to be known as e.g. Ted instead of Edward This is used in displayName which is a politicians surname and their common name (if they had one) or first name e.g. Abbott, Richard. In cases where this would not be unique, e.g. Francis Baker, an additional name has been added.}
#'  \item{displayName}{The combination of common name (when it exists), and first name otherwise, with surname.}
#'  \item{earlierOrLaterNames}{earlierOrLaterNames is mostly used to keep track of women changing their names at marriage. Similarly, title is mostly used to keep track of 'Dr', but both have been used inconsistently and should be only used sparingly.}
#'  \item{title}{Whether the person has a title.}
#'  \item{gender}{What gender is the person.}
#'  \item{birthDate}{What is their birthdate?}
#'  \item{birthYear}{Some politicians don't have a complete birth date, and instead only have a year of birth. In these cases their entry for birthDate will be empty, but they will have a birthYear.}
#'  \item{birthPlace}{Based on WikiData, this is the town or other place that they were born in.}
#'  \item{deathDate}{All death dates are complete, but in the case of one politician -- John William Croft -- this has been inputted, as the circumstances and timing (even year) of his death are unknown.}
#'  \item{member}{member and senator are binary indicator variables used to signify whether the politician was in the lower or upper house. Most politicians are only in one or the other, but some were in both.}
#'  \item{senator}{One politician in the dataset was neither a senator nor an MP - Heather Elaine Hill. She remains in the dataset because she was elected to the senate, and the need for this dataset to exactly match the AustralianElections one), however her eligibility was challenged and her election was invalidated, so she was never a senator.}
#'  \item{wasPrimeMinister}{Flag for whether the politician was ever prime minister.}
#'  \item{wikidataID}{The wikidata ID.}
#'  \item{wikipedia}{The wikipedia link.}
#'  \item{adb}{The Australian Dictionary of Biography link.}
#'  \item{comments}{Miscellaneous comments.}
#' }
"all"

#' Party of each individual
#'
#' This is data about the party of each individual, as of 31 October 2019.
#'
#' @format A data frame with 2,254 rows and 9 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{partyAbbrev}{The party abbreviation that is used by the parliamentary handbook.}
#'	\item{partyName}{The party name that is used by the parliamentary handbook.}
#'	\item{partyFrom}{The date that the person joined the party. This is empty if it would be the same as when they started being a member or senator.}
#'	\item{partyTo}{The date that the person left the party. This is empty if it would be the same as when they stopped being a member or senator.}
#'	\item{partyChangedName}{Did the party just change its name e.g. the Nationals.}
#'	\item{partySimplifiedName}{Is there a not completely accurate party name that may be more useful than the strictly correct names.}
#'	\item{partySpecificDateInputted}{A binary for whether accuracy has been imposed on the date, say there was only a month and a year then this would imply a day (1) has been added.}
#'	\item{partyComments}{Miscellaneous comments.}
#' }
"by_party"


#' Data by division for members.
#'
#' This is data about the division that a particular member represents, as of 31 October 2019.
#'
#' @format A data frame with 1,428 rows and 9 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{division}{The name of the division.}
#'	\item{stateOfDivision}{The state of the division.}
#'	\item{enteredAtByElection}{Whether the member was elected in a by-election.}
#'	\item{mpFrom}{When did the member start representing that division.}
#'	\item{mpTo}{When did the member finish representing that division.}
#'	\item{mpEndReason}{Why did they stop?}
#'	\item{mpChangedSeat}{Was it just that they changed seats?}
#'	\item{mpComments}{Miscellaneous comments.}
#' }
"by_division_mps"


#' Senators by state
#'
#' This provides information about the state that a senator represents, as of 31 October 2019.
#'
#' @format A data frame with 687 rows and 7 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{senatorsState}{The state that they represented.}
#'	\item{senatorFrom}{When they were elected.}
#'	\item{senatorTo}{Their last day of being a senator.}
#'	\item{senatorEndReason}{Why did they stop being a senator?}
#'	\item{sec15Sel}{Was the senator appointed, rather than voted?}
#'	\item{senatorComments}{Miscellaneous comments.}
#' }
"by_state_senators"


#' uniqueID to aphID correspondence
#'
#' This is a correspondence between uniqueIDs and the ids used by the Australian parliament house
#'
#' @format A data frame with 1776 rows and 3 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{aphID}{The id used by the Australian parliament house.}
#'	\item{idsComments}{Miscellaneous comments.}
#' }
"uniqueID_to_aphID"


#' appointments and positions
#'
#' This is a correspondence between uniqueIDs and the ids used by the Australian parliament house. This is a very initial dataset and shouldn't be used.
#'
#' @format A data frame with 581 rows and 5 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{position_name}{The name of the appointment, eg Prime Minister.}
#'	\item{positionWikidataID}{The id for that appointment.}
#'	\item{start_date}{When the person started that.}
#'	\item{end_date}{When the person finished.}
#' }
"positions"



#' ministry
#'
#' This is a correspondence between uniqueIDs and the ids used by the Australian parliament house. This is a very initial dataset and shouldn't be used.
#'
#' @format A data frame with 581 rows and 5 variables:
#' \describe{
#'    {ministry}{}
#'    {ministry_number}{}
#'    {ministry_party}{}
#'    {ministry_title}{}
#'    {uniqueID}{}
#'    {ministry_name}{}
#'    {ministry_from}{}
#'    {ministry_to}{}
#'    {ministry_assistant_minister_or_parliamentary_secretary}{}
#'    {ministry_comment}{}
#' }
"ministry"



#' cabinet
#'
#' This is a correspondence between uniqueIDs and the ids used by the Australian parliament house. This is a very initial dataset and shouldn't be used.
#'
#' @format A data frame with 581 rows and 5 variables:
#' \describe{
#'  \item{cabinet}{}
#'  \item{cabinet_number}{}
#'  \item{cabinet_name}{}
#'  \item{uniqueID}{}
#'  \item{cabinet_from}{}
#'  \item{cabinet_to}{}
#'  \item{cabinet_comment}{}
#' }
"cabinet"

