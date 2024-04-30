write.csv(fosdata::mice_pot, "data-raw/hw/mice.csv", row.names = F)

aa <- readxl::read_xlsx("/Users/speegled/Downloads/pone.0187779.s004.xlsx") |>
  janitor::clean_names()
library(tidyverse)
aa <- aa |>
  mutate(treat = str_extract(sub_id, "[a-zA-Z]*"), .after = sub_id)
write.csv(aa, "data-raw/hw/mkart.csv", row.names = F)

table(aa$treat)

mod_aov <- aov(aa$left_hippocampus_delta ~ aa$treat)
summary(mod_aov)

pairwise.t.test(aa$left_hippocampus_delta, aa$treat, pool.sd = T) #closer to TukeyHSD - use if we believe variances are likely equal or if (in this case) we want to be conservative
TukeyHSD(mod_aov)


