dd <- read.csv("data-raw/retina/pone.0194169.s001.csv")

library(tidyverse)
dd <- dd %>%
  mutate(across(.fns = function(x) str_replace(x, ",", "."))) %>%
  mutate(across(.fns = function(x) as.numeric(x))) %>%
  janitor::clean_names()

dd <- dd %>%
  mutate(onl_mean = (onl_inner + onl_outer)/2)

#'
#' according to study, males have thicker retinas.
#'

dd %>%
  group_by(sex) %>%
  summarize(across(.fns = ~ mean(.x)))
  summarize(across(.fns = ~last(.x) > first(.x))) %>%
  t()

dd <- dd %>%
  select(matches("sex|age|^onl")) %>%
  mutate(sex = factor(sex, labels = c("female", "male")))

retina <- dd
save(retina, file = "data/retina.rda")
