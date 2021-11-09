coins <- read.csv(here::here("data-raw/coins/coins"), sep = "\t", header = F)
library(tidyverse)
coins <- coins %>%
  select(matches("[1-3]")) %>%
  rename(id = V1,
         heads = V2,
         tails = V3)
save(coins, file = "data/coins.rda")
