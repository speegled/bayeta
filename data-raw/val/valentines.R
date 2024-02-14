library(tidyverse)
tuesdata <- tidytuesdayR::tt_load('2024-02-13')
hh <- tuesdata$historical_spending %>%
  janitor::clean_names()
plot(hh$year, hh$percent_celebrating)
hh %>%
  filter(year == 2015)
hh$percent_celebrating[hh$year == 2015] <- NA
write.csv(hh, "data-raw/val/val.csv", row.names = FALSE)
valentines <- hh
save(valentines, file = "data/valentines.rda")
