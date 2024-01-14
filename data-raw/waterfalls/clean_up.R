library(tidyverse)
library(jsonlite)
dd <- fromJSON(here::here("data-raw/waterfalls/conterminousUS_falls_nhd.geojson")) %>% as.data.frame()

aa <- bind_cols(select(dd, type, crs.type, crs.code, features.type), dd$features.properties, dd$features.geometry)

aa2 <- purrr::map_dfr(1:11860, function(x) {
  if(!is.null(aa$characteristics[[x]])) {
    return(flatten(aa$characteristics[[x]])[1,])
  }
  return(data.frame(source = NA))
})

aa3 <- purrr::map_dfr(1:11860, function(x) {
  if(!is.null(aa$characteristics[[x]])) {
    return(flatten(aa$characteristics[[x]])[2,])
  }
  return(data.frame(source = NA))
})


aa <- bind_cols(select(aa, -characteristics), aa2)
aa <- select(aa, -source...22)
aa <- janitor::clean_names(aa)
aa <- select(aa, -type_1, -crs_type,-crs_code, -features_type, -feature_id, -fishladder, -coordinates, -type_16, -source_11, -starts_with("nhd"), -spatial_certainty)
aa <- select(aa, -not_specified_height_feet)
aa$source_date <- lubridate::ymd(aa$source_date)

#'
#' Closest waterfalls of 50 feet or more to Maplewood, MO
#'
aa %>%
  mutate(dist = sqrt((38.6125500 - verifiedy)^2 + (-90.3245600 - verifiedx)^2)) %>%
  filter(tallest_drop_feet >= 50) %>%
  slice_min(dist, n = 20)

write.csv(aa, "data-raw/waterfalls/waterfalls.csv")
waterfalls <- aa
save(waterfalls, file = "data/waterfalls.rda")
