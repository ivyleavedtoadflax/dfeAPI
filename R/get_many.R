

get_many <- function(uri_string = NULL, x) {
  
  # Get an empty dataframe to join onto
  
  foo <- paste0(uri_string, "&take=1") %>% get_data
  foo <- foo[-1,]
  
  for (i in 0:(x - 1)) {
    
    skip_val <- i * 1000
    
    foo1 <- paste0(uri_string, "&take=1000", "&skip=", skip_val) %>% get_data
    
    foo <- rbind_list(
      foo, foo1
    )
    
  }
  
  return(foo)
  
}
