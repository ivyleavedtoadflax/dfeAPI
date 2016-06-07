
format_uri_search_name <- function(
  name = NULL,
  filter = NULL,
  orderBy = NULL,
  skip = NULL,
  take = NULL
) {
  
#  GET api/school/search?name={name}&filter={filter}&orderBy={orderBy}&skip={skip}&take={take}
  
  
  if (!is.null(filter)) {
    filter <- paste0("&name=", name) 
  }
  if (!is.null(order)) {
    order <- paste0("&filter=", filter) 
  }
  if (!is.null(skip)) {
    skip <- paste0("&orderBy=", orderBy) 
  }
  if (!is.null(take)) {
    take <- paste0("&skip=", skip) 
  }
  if (!is.null(take)) {
    take <- paste0("&take=", take) 
  }
  
  
  uri_string <- paste0(
    "http://dfe-api.azurewebsites.net/api/school/search?",
    name,
    filter,
    orderBy,
    skip,
    take
  )   
  
  uri_string <- gsub(" ", "%20", uri_string)
  
  return(uri_string)
  
}
