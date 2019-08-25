#' All individuals
#'
#' This is data about every individual who has been elected to the Australian
#' House of Representatives or the Senate. Each row is an individual, and the
#' columns are various pieces of information.
#'
#' @format A data frame with 1,780 rows and 17 variables that is current as of 24 August 2019:
#' \describe{
#'  \item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'  \item{surname}{The surname of the politician.}
#'  \item{allOtherNames}{The other names of the politician.}
#'  \item{firstName}{The first name of the politician.}
#'  \item{commonName}{The common name of the politician, for instance, Ted instead of Edward.}
#'  \item{displayName}{The combination of common name (when it exists), and first name otherwise, with surname.}
#'  \item{earlierOrLaterNames}{Just in case they changed their names.}
#'  \item{title}{Whether the person has a title.}
#'  \item{gender}{What gender is the person.}
#'  \item{birthDate}{What is their birthdate?}
#'  \item{birthYear}{In some cases the specific birthday isn't known, but the birth year is.}
#'  \item{deathDate}{What date did they die?}
#'  \item{member}{Where they a member of the house of representatives?}
#'  \item{senator}{Where they a senator?}
#'  \item{wikipedia}{The wikipedia link.}
#'  \item{adb}{The Australian Dictionary of Biography link.}
#'  \item{comments}{Miscellaneous comments.}
#' }
"all_individuals"

#' Party of each individual
#'
#' This is data about the party of each individual.
#'
#' @format A data frame with 2,257 rows and 9 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{partyAbbreviationParlHandbook}{The party abbreviation that is used by the parliamentary handbook.}
#'	\item{partyNameParlHandbook}{The party name that is used by the parliamentary handbook.}
#'	\item{partyFromParlHandbook}{The date that the person joined the party. This is empty if it would be the same as when they started being a member or senator.}
#'	\item{partyToParlHandbook}{The date that the person left the party. This is empty if it would be the same as when they stopped being a member or senator.}
#'	\item{partyChangedName}{Did the party just change its name e.g. the Nationals.}
#'	\item{partySimplified}{Is there a not completely accurate party name that may be more useful than the strictly correct names.}
#'	\item{specificDateWasInputted}{A binary for whether accuracy has been imposed on the date, say there was only a month and a year then this would imply a day (1) has been added.}
#'	\item{comment}{Miscellaneous comments.}
#' }
"by_party"


#' Data by division for members.
#'
#' This is data about the division that a particular member represents.
#'
#' @format A data frame with 1,418 rows and 9 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{division}{The name of the division.}
#'	\item{state}{The state of the division.}
#'	\item{byElection}{Whether the member was elected in a by-election.}
#'	\item{from}{When did the member start representing that division.}
#'	\item{to}{When did the member finish representing that division.}
#'	\item{reasonCeasedToBeMember}{Why did they stop?}
#'	\item{changedSeat}{Was it just that they changed seats?}
#'	\item{comments}{Miscellaneous comments.}
#' }
"mps_by_division"


#' Senators by state
#'
#' This provides information about the state that a senator represents, as of 24 August 2019.
#'
#' @format A data frame with 684 rows and 7 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{state}{The state that they represented.}
#'	\item{from}{When they were elected.}
#'	\item{to}{Their last day of being a senator.}
#'	\item{reasonCeasedToBeSenator}{Why did they stop being a senator?}
#'	\item{section15Selection}{Was the senator appointed, rather than voted?}
#'	\item{comments}{Miscellaneous comments.}
#' }
"senators_by_state"

#' List of prime ministers
#'
#' This is a list of the Australian prime ministers, as of 24 August 2019.
#'
#' @format A data frame with 30 rows and 2 variables:
#' \describe{
#'	\item{uniqueID}{An indentifier that is unique to each politician, usually just their surname and their year of birth, but occasionally more in cases where that would not be unique.}
#'	\item{wasPrimeMinister}{A binary indicator as to whether the person was ever prime minister.}
#' }
"list_prime_ministers"
