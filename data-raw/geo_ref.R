#' table for mapping EST catchment areas
#' @references eo_Reference.xlsx in "2021 Provincial Rollout"
geo_ref =
  data.frame(
    stringsAsFactors = FALSE,
    catchment_id = c(1L,2L,3L,4L,5L,6L,7L,8L,
                     9L,10L,11L,12L,13L,14L,15L,35L),
    catchment_area = c("Durham","Halton",
                       "Hamilton-Niagara Peninsula","Kingston-Pembroke",
                       "Kitchener-Waterloo-Barrie","London","Muskoka-Kawarthas",
                       "Northeast / Nord-est","Northwest / Nord-ouest","Ottawa","Peel",
                       "Stratford-Bruce Peninsula","Toronto","Windsor-Sarnia",
                       "York","Ontario"),
    geo_uid = c(3530L,3530L,3550L,3515L,
                3540L,3560L,3520L,3590L,3595L,3510L,3530L,3580L,
                3530L,3570L,3530L,35L),
    economic_region = c("Toronto","Toronto",
                        "Hamilton-Niagara Peninsula","Kingston-Pembroke",
                        "Kitchener-Waterloo-Barrie","London","Muskoka-Kawarthas","Northeast",
                        "Northwest","Ottawa","Toronto",
                        "Stratford-Bruce Peninsula","Toronto","Windsor-Sarnia","Toronto","Ontario")
  )


usethis::use_data(geo_ref, overwrite = TRUE)
