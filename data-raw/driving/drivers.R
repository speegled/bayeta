dd <- haven::read_dta("data-raw/driving/analysis_file.dta")
library(tidyverse)
max(dd$year)
dd_small <- filter(dd, year == 2017, month == 1)

dd_small <- filter(dd_small, vmt < max(vmt))
ggplot(dd_small, aes(vmt, fatal)) +
  geom_jitter() +
  geom_smooth(method = "glm", method.args = list(family = "poisson"))

glm(fatal ~ vmt, data = dd_small, family = poisson) %>% summary()

dd_small <- dd_small %>% select(1:54)

sapply(1:54, function(x) {
  paste0("#\'   \\item{", names(dd_small)[x], "}", "{", attributes(as.data.frame(dd_small)[,x])[[1]],"}")
}) %>%
  writeLines("R/diver_fatalities.R")

driver_fatalities <- dd_small
save(driver_fatalities, file = "data/driver_fatalities.rda")
