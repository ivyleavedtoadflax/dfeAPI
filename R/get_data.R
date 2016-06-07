

get_data <- function(
  uri_string = NULL
  ) {

  out <- tryCatch(
    {

  ## Play it back to the console.111

  message(uri_string)

  # Access .Renviron file to get dfeAPI key

  pword <- Sys.getenv("dfeAPI_key")

  foo <- uri_string %>%
    httr::GET(
      httr::accept_json(),
      httr::authenticate(
        user = "API",
        password = pword
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
