#' @title Format keystage query for dfe-api
#'
#' @description \code{format_uri_keystage} formats a queri uri string
#' ready for submission to dfe-api.
#'
#' @details Takes a properly formatted uri string as input, and makes a
#' request of dfe-api, parses the returning JSON, and returns a list.
#'
#' @param \code{stage} Keystage of interest: takes either `ks2`, `ks4`,
#'  or `ks5`. deafults to `NULL`.
#' @param \code{skip} Takes an integer; these many records will be
#' skipped over and no returns.
#' @param \code{take} How many records to return. Although the default in
#'  this function is `NULL`, the serverside default is 50.
#'
#' @return A properly formatted uri string for querying the API, for example:
#' `http://dfe-api.azurewebsites.net/api/keystage/search/ks4?`.
#'
#' @examples
#'
#'\dontrun{
#'
#' library(dfeAPI)
#' library(dplyr)
#'
#'  # Try basic functionality
#'
#' format_uri_keystage(
#'    stage = "ks4",
#'    take = 10
#' ) %>%
#'    get_data
#'
#'}
#'
#' @export

format_uri_keystage <- function(
  stage = NULL,
  filter = NULL,
  order = NULL,
  skip = NULL,
  take = NULL
) {

  # Check the inputs

  if (!stage %in% c("ks2","ks4","ks5")) {

    stop("Error: stage must be one of ks2, ks4, or ks5")

  }

  if (!is.null(filter)) {
    filter <- paste0("&filter=", filter)
  }
  if (!is.null(order)) {
    order <- paste0("&orderBy=", order)
  }
  if (!is.null(skip)) {
    skip <- paste0("&skip=", skip)
  }
  if (!is.null(take)) {
    take <- paste0("&take=", take)
  }

  # Construct string

  uri_string <- paste0(
    "http://dfe-api.azurewebsites.net/api/keystage/search/",
    stage,
    "?",
    filter,
    order,
    skip,
    take
  )

  return(uri_string)

}
