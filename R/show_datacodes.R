#' Produce and send to console a tibble of the data request codes and associated datasets.
#'
#' @description
#' `show_datacodes()` produces a tibble of the arguments used with the `get_ausdata()` function
#' and the associated datasets.
#'
#' @param limit A numeric value used to determine the number of values returned.
#' Default is set to four (4) values, which returns all tibble values.
#'
#' @details
#' Items under *Request Codes* can be used to request and download the associated
#' Australian Politicians dataset.
#'
#' The specifics of these are:
#'
#' - `"all"` australian_politicians-all.csv.
#' - `"allbyparty"` australian_politicians-all-by_party.csv.
#' - `"mps"` australian_politicians-mps-by_division.csv.
#' - `"senators"` australian_politicians-senators-by_state.csv.
#'
#' @return A console printout of a tibble with a designated number of values set by \code{limit}.
#'
#' @examples
#' \dontrun{
#' # Print out dataset request codes.
#' show_datacodes()
#'
#' # Request "All" Australian Politicians dataset.
#' get_auspol("all")
#' }
#'
#' @seealso `get_auspol()` function help.
#'
#' @export
# Function to produce the codes used to access Australian politicians datasets.
# Creates two vectors then assigns these to a tibble, which is then printed to the console using the head function.


# assign function name `show_datacodes` taking one numeric argument
show_datacodes <- function(limit = 4){
  # assign tibble object using tibble function from tibble package
  codetibble <- tibble::tibble(
    # store the data request codes as values
    request_code = c("all", "allbyparty", "mps", "senators"),
    # store the corresponding dataset as values
    dataset = c("australian_politicians-all.csv", "australian_politicians-all-by_party.csv",
                "australian_politicians-mps-by_division.csv", "australian_politicians-senators-by_state.csv")
  )
  # print out tibble using head function and numeric limit
  utils::head(codetibble, limit)
}
