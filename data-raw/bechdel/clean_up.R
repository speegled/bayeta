
# https://bechdeltest.com/
aa <- jsonlite::fromJSON(here::here("data-raw/bechdel/bechdel-raw.tex"))

# https://ivanmillanes.netlify.app/post/2020-05-27-movie-dataset-with-r/
bb <- readr::read_rds(here::here("data-raw/bechdel/movies.rds"))
bb$imdbid <- bb$tconst
bb <- bb %>%
  mutate(imdbid = str_remove(imdbid, "tt"))

b2 <- left_join(aa, bb) %>%
  filter(!is.na(tconst))

b2 <- b2 %>%
  select(-tconst, -titleType, -endYear, -numVotes, -linkTitle, -directors, -cast, -country_raw, -matches("raw$"), -id, -title) %>%
  filter(!is.na(budget) & !is.na(gross_usa)) %>%
  rename(title = primaryTitle)

b2 <- b2 %>% mutate(rating = factor(rating, labels = c("no_women", "no_talk", "about_men", "ok")))

write.csv(b2, "data-raw/bechdel/bechdel.csv", row.names = F)
