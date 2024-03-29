#' Generate datasets for House of Representative and Senate members service dates.
#'
#' @description `get_reps_senate()` generates a dataset for members' service time for
#' the Australian House of Representatives, the Australian Senate, or a joined dataset
#' containing values for both the HoR and Senate. Additionally, will produce a set of
#' arguments that can be used as request codes for the individual datasets.
#'
#' @param x A character string used to request a printout of the request code arguments,
#' *see Request Codes* below, or one of three prepared datasets.
#'
#' @details
#' There are four request codes: `reps_senate`, `reps`, `senate` and `codes`.
#'
#' The specifics of these are:
#'
#' - `reps_senate` - generates a dataset of HoRs and Senate members;
#' - `reps` - generates a dataset of HoRs members;
#' - `senate` - generates a dataset of Senate members; and
#' - `codes` - returns a tibble of codes used to request data.
#'
#' An incorrect request code (an argument not associated with a dataset or non-character string argument)
#' will stop function processes and return an error message.
#'
#' @return A console printout of a tibble containing arguments to be used with the function,
#' or the requested dataset using \code{x} assigned to a user created variable.
#'
#' @examples
#' \dontrun{
#' # Generate a printout of the arguments.
#' get_reps_senate("codes")
#'
#' # Generate combined HoR and Senate dataset.
#' reps_senate <- get_reps_senate("reps_senate")
#'
#' # Preview dataset.
#' head(reps_senate)
#'
#' # Generate only HoR dataset.
#' reps <- get_reps_senate("reps")
#'
#' # Preview dataset.
#' head(reps)
#' }
#'
#' @export
# Function to produce manipulated datasets for HoRs and Senate members.
# Takes one parameter as a character string to produce datasets.

# assign function name
get_reps_senate <- function(x){
  # assign vector to store download URLS
  dwnlds <- c("https://raw.github.com/RohanAlexander/australian_politicians/master/data/australian_politicians-all.csv",
              "https://raw.github.com/RohanAlexander/australian_politicians/master/data/australian_politicians-mps-by_division.csv",
              "https://raw.github.com/RohanAlexander/australian_politicians/master/data/australian_politicians-senators-by_state.csv"
  )
  # assign tibble object using tibble function from tibble package
  codetibble <- tibble::tibble(
    # store the data request codes as values
    request_code = c("reps_senate", "reps", "senate", "codes"),
    # store the corresponding dataset as values
    dataset = c("Generates a dataset of HoRs and Senate members",
                "Generates a dataset of HoRs members",
                "Generates a dataset of Senate members",
                "Returns a tibble of codes used to request data")
  )
  if(!purrr::is_character(x)){
    # if not a character string produce error message
    stop("Provided request code must be a character string.")
  }
  else if(!(x %in% codetibble$request_code)){
    stop('Provided code does not match any request code.
         Use get_reps_senate("codes") for valid request codes.')
  }
  else if(x == "codes"){
    # print out data request codes stored in tibble
    utils::head(codetibble, 3)
  }
  else if(x == "reps_senate"){
  # assign 3 temporary files with file type .csv
  tmpfls <- sapply(paste0("tmpfl", 1:3), tempfile, fileext = ".csv")
  # download required csv files
  utils::download.file(dwnlds, tmpfls, quiet = F, method = "libcurl")
  # read csv files into list
  dflist <- lapply(tmpfls, readr::read_csv, show_col_types = F)
  # assign first item in the list to new variable
  australian_mps <- dflist[[1]]
  # filter for where member is 1
    australian_mps <- dplyr::filter(australian_mps, member == 1)
    # join with second item in list by uniqueID
    australian_mps <- dplyr::left_join(australian_mps, dflist[[2]],
                by = "uniqueID")
    # select uniqueID, mpFrom, and mpTo
    australian_mps <- dplyr::select(australian_mps, uniqueID, mpFrom, mpTo)
    # mutate house column to hold "reps"
    australian_mps <- dplyr::mutate(australian_mps, house = "reps")
    # rename mpFrom to from and mpTo to to
    australian_mps <- dplyr::rename(australian_mps, from = mpFrom,
             to = mpTo)
  # assign new variable from first item in list
  australian_senators <- dflist[[1]]
    # filter for where senator is 1
    australian_senators <- dplyr::filter(australian_senators, senator == 1)
    # join with third item in list by uniqueID
    australian_senators <- dplyr::left_join(australian_senators, dflist[[3]],
              by = "uniqueID")
    # select uniqueID, senatorFrom, and senatorTo
    australian_senators <- dplyr::select(australian_senators, uniqueID, senatorFrom, senatorTo)
    # mutate house column to hold "senate"
    australian_senators <- dplyr::mutate(australian_senators, house = "senate")
    # rename seantorFrom to from and senatorTo to to
    australian_senators <- dplyr::rename(australian_senators, from = senatorFrom,
           to = senatorTo)
  # assign new variable through row binding two created variables
  australian_politicians <- rbind(australian_mps, australian_senators)
    # mutate house values so where house is senate it is Senate
    # and where house is reps it is HoR
    dplyr::mutate(australian_politicians, house =
             dplyr::case_when(
               house == "senate" ~ "Senate",
               house == "reps" ~ "HoR",
               TRUE ~ "OH NO")
    )
  }
  else if(x == "reps"){
    # assign 3 temporary files with file type .csv
    tmpfls <- sapply(paste0("tmpfl", 1:2), tempfile, fileext = ".csv")
    # download required csv files
    utils::download.file(dwnlds[c(1,2)], tmpfls, quiet = F, method = "libcurl")
    # read csv files into list
    dflist <- lapply(tmpfls, readr::read_csv, show_col_types = F)
    # assign first item in the list to new variable
    australian_mps <- dflist[[1]]
      # filter for where member is 1
      australian_mps <- dplyr::filter(australian_mps, member == 1)
      # join with second item in list by uniqueID
      australian_mps <- dplyr::left_join(australian_mps, dflist[[2]],
                       by = "uniqueID")
      # select uniqueID, mpFrom, and mpTo
      australian_mps <- dplyr::select(australian_mps, uniqueID, mpFrom, mpTo)
      # mutate house column to hold "reps"
      australian_mps <- dplyr::mutate(australian_mps, house = "HoR")
      # rename mpFrom to from and mpTo to to
      australian_mps <- dplyr::rename(australian_mps, from = mpFrom,
                    to = mpTo)
  }
  else if(x == "senate"){
    # assign 3 temporary files with file type .csv
    tmpfls <- sapply(paste0("tmpfl", 1:2), tempfile, fileext = ".csv")
    # download required csv files
    utils::download.file(dwnlds[c(1,3)], tmpfls, quiet = F, method = "libcurl")
    # read csv files into list
    dflist <- lapply(tmpfls, readr::read_csv, show_col_types = F)
    # assign new variable from first item in list
    australian_senators <- dflist[[1]]
      # filter for where senator is 1
      australian_senators <- dplyr::filter(australian_senators, senator == 1)
      # join with third item in list by uniqueID
      australian_senators <-dplyr::left_join(australian_senators, dflist[[2]],
                       by = "uniqueID")
      # select uniqueID, senatorFrom, and senatorTo
      australian_senators <- dplyr::select(australian_senators, uniqueID, senatorFrom, senatorTo)
      # mutate house column to hold "senate"
      australian_senators <- dplyr::mutate(australian_senators, house = "Senate")
      # rename seantorFrom to from and senatorTo to to
      australian_senators <- dplyr::rename(australian_senators, from = senatorFrom,
                    to = senatorTo)
  }
}
