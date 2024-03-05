#'
#' data from https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0216362
#'
dd <- haven::read_dta("data-raw/sex_temp_math/pone.0216362.s003.dta")
head(dd)
library(tidyverse)
dd_small <- dd |>
  mutate(sex = ifelse(male, "male", "female")) |>
  filter(temp < 20 | temp > 30) |>
  select(temp, mathcorrect, mathreported, sex, age)

write.csv(dd, "sex_temp_math.csv", row.names = F)
write.csv(dd_small, "sex_temp_math_small.csv", row.names = F)
sex_temp_small <- dd_small
sex_temp_math <- dd
save(sex_temp_math, sex_temp_small, file = c("data/sex_temp.rda"))
load("data/sex_temp.rda")
rm(sex_temp_math)
cool_females <- sex_temp_small |>
  filter(sex == "female") |>
  mutate(temp = ifelse(temp < 20, "cool", "warm")) |>
  filter(temp == "cool")
warm_females <- sex_temp_small |>
  filter(sex == "female") |>
  mutate(temp = ifelse(temp < 20, "cool", "warm")) |>
  filter(temp == "warm")
all_females <- sex_temp_small |>
  filter(sex == "female") |>
  mutate(temp = ifelse(temp < 20, "cool", "warm"))
write.csv(all_females, "data-raw/sex_temp_math/all_females.csv", row.names = F)
write.csv(cool_females, "data-raw/sex_temp_math/cool_females.csv", row.names = F)
write.csv(warm_females, "data-raw/sex_temp_math/warm_females.csv", row.names = F)




boxplot(sex_temp_small$mathcorrect ~ sex_temp_small$temp)




