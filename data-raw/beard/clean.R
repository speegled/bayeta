library(tidyverse)

#'
#' Carrier, David; Beseris, Ethan; Naleway, Steven (2020). Data from: Impact protection potential of mammalian hair [Dataset]. Dryad. https://doi.org/10.5061/dryad.6djh9w0xn
#'

dd <- readxl::read_xlsx("data-raw/beard/Beard_Data_Set.xlsx") |>
  janitor::clean_names()

tail(dd)
dd <- dd |>
  filter(!str_detect(hairy, "[a-z]"))

dd <- dd |>
  select(-matches("^x[0-9]"))

dd$hairy <- "hairy"
dd$plucked <- "plucked"
dd$sheared <- "sheared"
rnm <- function(x) {
  ifelse(str_detect(x, "hairy|plucked|shear"), "status", str_remove(x, "_[0-9]+$") )
}
rnm(names(dd))

dd <- bind_rows(rename_with(dd[,1:5], .fn = rnm),
          rename_with(dd[,6:10], .fn = rnm),
          rename_with(dd[,11:15], .fn = rnm)
)

write.csv(dd, "data-raw/beard/bead.csv", row.names = F)

dd <- read.csv("data-raw/beard/bead.csv")
library(tidyverse)
dd <- dd |>
  filter(status %in% c("hairy", "sheared"))
write.csv(dd, "data-raw/beard/beard_two.csv", row.names = F)
