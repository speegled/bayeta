library(tidyverse)
dd <- readxl::read_xlsx(here::here("data-raw/braille/braille.xlsx"), sheet = 2)
dd <- dd %>%
  janitor::clean_names() %>%
  rename(height = height_1_low_2_medium_3_high)

ff <- readxl::read_xlsx(here::here("data-raw/braille/braille.xlsx"), sheet = 1)
dd <- left_join(dd, ff %>%
  janitor::clean_names(), by = "subject")

braille <- dd
save(braille, file = here::here("data/braille.rda"))
