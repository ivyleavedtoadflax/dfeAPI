choose_facet <- function(x) {
  
  if(x == "None") {
    
  } else if (x == "Disadvantaged") {
    
    facet_wrap(
      ~key
    )
  }
}