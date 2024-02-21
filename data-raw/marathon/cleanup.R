marathon <- read.csv("data-raw/marathon/marathon.csv")
marathon
library(tidyverse)
marathon <- marathon %>%
  mutate_all(function(x) str_remove_all(x, "\\[[0-9]+\\]")) %>%
  mutate(sex = rep(c("M", "F"), times = c(52, 42)), .before = "Country") %>%
  janitor::clean_names()
marathon$time <- str_remove(marathon$time, "[a-zA-Z ]+")
marathon <- marathon %>%
  mutate(hours = as.numeric(str_extract(time, "[0-9]")),
         minutes = as.numeric(str_extract(time, "(?<=:)[0-9]+")),
         seconds = as.numeric(str_extract(time, "[0-9\\.]+$")))
marathon <- select(marathon, time, time_seconds, person, sex, country, date, event, type, notes)
marathon$date <- str_remove(marathon$date, "\\[nb [0-9]\\]")
marathon$year <- NULL
marathon <- marathon %>% mutate(year = lubridate::year(lubridate::mdy(marathon$date)),.after = date)
write.csv(marathon, "data-raw/marathon/marathon.csv", row.names = F)
save(marathon, file = "data/marathon.rda")

load("data/marathon.rda")
marathon
library(tidyverse)
marathon_small <- marathon %>%
  group_by(sex) %>%
  filter(time_seconds != max(time_seconds)) %>%
  arrange(sex)

marathon_small <- read.csv("data-raw/marathon/marathon_small.csv")
marathon_small <- marathon_small %>%
  janitor::clean_names() %>%
  group_by(gender) %>%
  filter(time != max(time)) %>%
  arrange(gender)

plot(marathon_small$year, marathon_small$time, pch = marathon_small$gender)
mod_female <- lm(time ~ year, data = marathon_small, subset = marathon_small$gender == "F")
abline(mod_female)

mod_male <- lm(time ~ year, data = marathon_small, subset = marathon_small$gender == "M")
abline(mod_male)

write.csv(marathon_small, "data-raw/marathon/marathon_small.csv", row.names = F)

