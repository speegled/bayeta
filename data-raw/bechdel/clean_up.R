library(tidyverse)
aa <- read.csv("/Users/speegled/Downloads/stars.csv") %>%
  janitor::clean_names()

head(aa)
min(aa$distance)
which.min(aa$visual_mag)
which.min(aa$absolute_mag)
aa[19,]
hist(aa$absolute_mag)
barplot(table(aa$spectral_type))
aa$spectral_type <- factor(aa$spectral_type, levels = c("W", "O", "B", "A", "F", "G", "K", "M"))
plot(aa$spectral_type, main = "Test")
boxplot(aa$absolute_mag ~ aa$spectral_type)
boxplot(aa$absolute_mag)
rownames(aa) <- aa$bayer_name
car::Boxplot(aa$absolute_mag)
aa %>%
  arrange(visual_mag)

summary(fosdata::bechdel$year)
aa <- jsonlite::read_json("data/bechdel-raw.tex")

aa <- jsonlite::fromJSON("data/bechdel-raw.tex")



load("/Users/speegled/Downloads/movies.rds")

bb <- readr::read_rds("/Users/speegled/Downloads/movies.rds")
summary(bb$startYear)
summary(fosdata::bechdel$year)
fosdata::bechdel
bb$imdbid <- bb$tconst
bb <- bb %>%
  mutate(imdbid = str_remove(imdbid, "tt"))

b2 <- left_join(aa, bb) %>%
  filter(!is.na(tconst))

b2 <- b2 %>%
  select(-tconst, -titleType, -endYear, -numVotes, -linkTitle, -directors, -cast, -country_raw, -matches("raw$"), -id, -title) %>%
  filter(!is.na(budget) & !is.na(gross_usa)) %>%
  filter(year > 2000) %>%
  rename(title = primaryTitle)

b2 <- b2 %>% mutate(rating = factor(rating, labels = c("no_women", "no_talk", "about_men", "ok")))

write.csv(b2, "/Users/speegled/Documents_No_Icloud/R_projects/bayeta/data-raw/bechdel/bechdel.csv", row.names = F)
