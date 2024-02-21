dd <- read.csv("data-raw/gorillaz/gorillaz.csv")
library(tidyverse)
dd <- dd %>%
  janitor::clean_names()
write.csv(dd, "data-raw/gorillaz/gorillaz.csv", row.names = F)
gorillaz <- dd
save(gorillaz, file = "data/gorillaz.rda")
