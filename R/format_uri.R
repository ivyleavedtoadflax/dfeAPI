
format_uri <- function(
  stage = NULL,
  filter = NULL,
  order = NULL,
  skip = NULL,
  take = NULL
) {
  
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
