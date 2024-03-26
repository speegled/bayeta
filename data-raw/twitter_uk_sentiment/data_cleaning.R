#'
#' source: https://datadryad.org/stash/dataset/doi:10.5061/dryad.f61v3tj
#'
#' Circadian mood variations in Twitter content
#'

install.packages("syuzhet")
library(syuzhet)
words <- list.files("/Users/speegled/Downloads/doi_10_5061_dryad_f61v3tj__v20190305/archive/data/")
library(tidyverse)
words <- str_remove(words, ".csv")

dd <- get_nrc_sentiment(words)
aa <- dd[apply(dd, 1, function(x) any(x!= 0)),] |>
  rownames_to_column()
aa$word <- words[as.integer(aa$rowname)]
aa$rowname <- NULL
aa

read.csv(paste0("/Users/speegled/Downloads/doi_10_5061_dryad_f61v3tj__v20190305/archive/data/", aa$word[1], ".csv"), header = F, sep = " ") |>
  filter(str_detect(V1, "2013")) |>
  mutate(word = aa$word[1], .before = V1) |>
  mutate(datetime = paste(V1, V2, sep = " "), .after = word) |>
  mutate(datetime = lubridate::dmy_hms(datetime)) |>
  select(-V1, -V2) |>
  rename(count = V3)


dd <- purrr::map_df(1:2097, function(x) {
  read.csv(paste0("/Users/speegled/Downloads/doi_10_5061_dryad_f61v3tj__v20190305/archive/data/", aa$word[x], ".csv"), header = F, sep = " ") |>
    filter(str_detect(V1, "2013")) |>
    mutate(word = aa$word[x], .before = V1) |>
    mutate(datetime = paste(V1, V2, sep = " "), .after = word) |>
    mutate(datetime = lubridate::dmy_hms(datetime)) |>
    select(-V1, -V2) |>
    rename(count = V3)
})

dd
write.csv(left_join(dd, aa, by = "word"), "data-raw/twitter_uk_sentiment/word_count.csv", row.names = F)
small_word <- aa$word[apply(aa[,-11], 1, sum) > 4]
small_dd <- left_join(filter(dd, word %in% small_word), aa, by = "word")
write_csv(small_dd, "data-raw/twitter_uk_sentiment/word_count.csv")




