
format_uri_geo <- function(
  townOrCity = NULL,
  townOrCityId = NULL,
  distance = NULL,
  orderBy = NULL,
  skip = NULL,
  take = NULL
) {
  
#  GET api/school/search/geo?townOrCity={townOrCity}&townOrCityId={townOrCityId}&distance={distance}&filter={filter}&orderBy={orderBy}&skip={skip}&take={take}
  
  
  if (!is.null(filter)) {
    filter <- paste0("&townOrCity=", townOrCity) 
  }
  if (!is.null(order)) {
    order <- paste0("&townOrCityId=", townOrCityId) 
  }
  if (!is.null(skip)) {
    skip <- paste0("&distance=", distance) 
  }
  if (!is.null(take)) {
    take <- paste0("&skip=", skip) 
  }
  if (!is.null(take)) {
    take <- paste0("&take=", take) 
  }
  
  
  uri_string <- paste0(
    "http://dfe-api.azurewebsites.net/api/school/search/geo?",
    townOrCity,
    townOrCityId,
    distance,
    orderBy,
    skip,
    take
  )   
  
  return(uri_string)
  
}
