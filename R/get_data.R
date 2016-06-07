#' @title Get data from dfe-api
#'
#' @description \code{get_data} The main function behind \code{dfeAPI}.
#'
#' @details Takes a properly formatted uri string as input, and makes a
#' request of dfe-api, parses the returning JSON, and returns a list.
#'
#' @param \code{uri_string} A properly formatted uri string with which to
#'  query the API. This would principally come from \code{format_uri()}
#'  and its relatives.
#'
#' @return A list containing the response, typically containing: ErrorMessage,
#' NumberOfResults, Results, Taken, Skipped, Facets, QueryLat, QueryLong,
#' Disambiguate, DisambiguationSuggestions
#'
#' @examples
#'
#'\dontrun{
#'
#' library(dfeAPI)
#' library(dplyr)
#'
#' response <- "ks4" %>%
#'    format_uri %>%
#'    get_data
#'
#'  # Convert to dplyr's data_frame (as data are very wide!)
#'
#'  foo <- response$results %>%
#'    as_data_frame
#'
#'    }
#'
#' @export

get_data <- function(
  uri_string = NULL
  ) {

  out <- tryCatch(
    {

  ## Play it back to the console.

  message(uri_string)

  # Access .Renviron file to get dfeAPI key

  key <- Sys.getenv("dfeAPI_key")
  username <- Sys.getenv("dfeAPI_username")

  foo <- uri_string %>%
    httr::GET(
      httr::accept_json(),
      httr::authenticate(
        user = username,
        password = key
        )
    ) %>%
    httr::content("text") %>%
    jsonlite::fromJSON(flatten = TRUE)

  return(foo)
    },
  error = function(cond) {
    message(paste("Unhandled error."))
    message(cond)
    return(NULL)
  },
  warning = function(cond) {
    message(paste("Unhandled warning."))
    message(cond)
    return(NULL)
  },
  finally = {}
  )

}
