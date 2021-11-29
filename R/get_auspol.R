#' Retrieve a csv dataset from the australian_politicians repository.
#'
#' @description
#' `get_auspol()` downloads a requested Australian politicians .csv dataset using an associated argument.
#'
#' @param df A character string used to request an Australian politicians dataset. *See Request Codes* below.
#'
#' @details
#'
#' ## Request Codes
#' * `all` requests the australian_politicians-all.csv dataset.
#' * `allbyparty` requests the australian_politicians-all-by_party.csv dataset.
#' * `mps` requests the australian_politicians-mps-by_division.csv dataset.
#' * `senators` requests the australian_politicians-senators-by_state.csv dataset.
#'
#' ## Incorrect Requests
#' An incorrect request (an argument not associated with a dataset or non-character string argument)
#' will stop function processes and return an error message.
#'
#' @return The requested dataset using \code{df} to a user assigned name.
#'
#' @examples
#' \dontrun{
#' # Request the Senators by State dataset.
#' senators_df <- get_auspol("senators")
#'
#' # Preview first 10 observations of the dataset.
#' head(senators_df, 10)
#' }
#' @seealso `show_datacodes()` function help.
#'
#' @export
# Function to access Australian politicians datasets.
# Takes one argument as a character string to download and assign dataset to given variable name.



# assign function name `getdata`
# takes one argument `df` as a character string
get_auspol <- function(df){
  # set request codes for datasets in vector
  datacodes <- c("all", "allbyparty", "mps", "senators")
  # check if provided argument is a character string
  if(!purrr::is_character(df)){
    # if not a character string produce error message
    stop("Provided request code must be a character string.")
  }
  # else if provided character string is in vector
  else if(df %in% datacodes){
    # assign to temporary file
    tmpdir <- tempfile(fileext = ".csv")
    # if `df` is equal to "all"
    if(df == "all"){
      # assign GitHub download URL for `all` dataset
      dwnld <- "https://raw.github.com/RohanAlexander/australian_politicians/master/data/australian_politicians-all.csv"
      # download from the assigned URL to the temporary directory, showing download progress
      utils::download.file(dwnld, tmpdir, quiet = F)
      # read in CSV using `read_csv` from `readr`, do not show column types
      readr::read_csv(tmpdir, show_col_types = F)
    }
    else if(df == "allbyparty"){
      dwnld <- "https://raw.github.com/RohanAlexander/australian_politicians/master/data/australian_politicians-all-by_party.csv"
      utils::download.file(dwnld, tmpdir, quiet = F)
      readr::read_csv(tmpdir, show_col_types = F)
    }
    else if(df == "mps"){
      dwnld <- "https://raw.github.com/RohanAlexander/australian_politicians/master/data/australian_politicians-mps-by_division.csv"
      utils::download.file(dwnld, tmpdir, quiet = F)
      readr::read_csv(tmpdir, show_col_types = F)
    }
    else if(df == "senators"){
      dwnld <- "https://raw.github.com/RohanAlexander/australian_politicians/master/data/australian_politicians-senators-by_state.csv"
      utils::download.file(dwnld, tmpdir, quiet = F)
      readr::read_csv(tmpdir, show_col_types = F)
    }
  }
  else{
    # else if character string is not in vector stop function and return error
    stop("Provided request code is not associted with a dataset.")
  }
}
