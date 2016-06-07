
get_LA_names <- function(
) {
  
  "http://dfe-api.azurewebsites.net/api/la_region" %>%
    httr::GET(
      httr::accept_json()
    ) %>%
    httr::content("text") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame %>%
    tbl_df %>% 
    return
  
}
