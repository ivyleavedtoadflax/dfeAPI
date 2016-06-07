library(testthat)

test_that(
  "format_uri() works under usual use case.",
  {
    
    # Base function works without any arguments (apart from stage)
    
    expect_equal(
      "http://dfe-api.azurewebsites.net/api/keystage/search/ks2?",
      format_uri(stage = "ks2")
    )
    
    # Base function works with filter
    
    expect_equal(
      "http://dfe-api.azurewebsites.net/api/keystage/search/ks2?&filter=a_filter",
      format_uri(stage = "ks2", filter = "a_filter")
    )
    
    # Base function works with orderBy
    
    expect_equal(
      "http://dfe-api.azurewebsites.net/api/keystage/search/ks2?&filter=a_filter&orderBy=an_order",
      format_uri(stage = "ks2", filter = "a_filter", order = "an_order")
    )
    
    # Base function works with skip
    
    expect_equal(
      "http://dfe-api.azurewebsites.net/api/keystage/search/ks2?&filter=a_filter&orderBy=an_order&skip=skip_100_rows",
      format_uri(stage = "ks2", filter = "a_filter", order = "an_order", skip = "skip_100_rows")
    )
    
    # Base function works with take
    
    expect_equal(
      "http://dfe-api.azurewebsites.net/api/keystage/search/ks2?&filter=a_filter&orderBy=an_order&skip=skip_100_rows&take=50",
      format_uri(stage = "ks2", filter = "a_filter", order = "an_order", skip = "skip_100_rows", take = "50")
    )
    
    }
  )
