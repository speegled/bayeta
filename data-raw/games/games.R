games <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-16/games.csv')
min(games$peak)
summary(games)
video_games <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-30/video_games.csv")
library(tidyverse)
games <- left_join(games, video_games, by = c("gamename" = "game")) %>%
  filter(!is.na(metascore)) %>%
  group_by(gamename) %>%
  filter(year == max(year), month == "February") %>%
  filter(median_playtime > 0) %>%
  filter(metascore > 50) %>%
  mutate(log_peak = log(peak))

library(lubridate)
games <- games %>%
  mutate(release_date = round_date(lubridate::mdy(release_date), unit = "month")) %>%
  mutate(age = as.integer((my("Feb 2021") - release_date)))

ggplot(games, aes(age, log(avg))) +
  geom_point()
unique(games$owners)

unique(games$owners)[c(10, 9, 7, 8, 6, 3, 4, 5, 1, 2)]
games$owners <- factor(games$owners,
       levels = unique(games$owners)[c(10, 9, 7, 8, 6, 3, 4, 5, 1, 2)],
       labels = c("1,000,000+", "10,000,000+", "100,000+", "20,000,000+",
                                "2,000,000+", "20,000,000+", "100,000+",
                                "5,000,000+", "20,000,000+", "500,000+")[c(3, 7, 10, 1, 5, 8, 2, 6, 9, 4)])

table(games$owners)
lm(log(avg) ~ age + metascore + owners, data = games) %>% summary()
games$log_avg <- log(games$avg)

games <- as.data.frame(games)
games <- select(games, -year, -month, -log_avg, -log_peak)

save(games, file = "data/games.rda")
