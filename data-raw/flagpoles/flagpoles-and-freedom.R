# Flagpoles
# Following a Reddit post by MADaboutforests 1/20/24
library(dplyr)

# Read flagpole data, scraped from Wikipedia's tallest flagpole page and then somewhat hand cleaned
# Only includes flagpoles over 100m in height

flagpoles_raw <- read.csv("flagpoles-and-freedom/flagpoles.csv")

# Read freedom index data from FreedomHouse.org, arguably a US government propaganda machine.
freedom_raw <- read.csv("flagpoles-and-freedom/All_data_FIW_2013-2023.csv")

# Clean up
freedom <- freedom_raw |> filter(Edition == 2013) |> select(Country = Country.Territory, FreedomIndex = Total)

# Merge and finish
flagpoles <- left_join(flagpoles_raw,freedom) |> relocate(FreedomIndex, .before=Notes) |> rename(Height.m = Height..m.)

# Clean variable names

flagpoles <- flagpoles %>% janitor::clean_names()

# Plot!
plot(flagpoles$freedom_index, flagpoles$height_m)

cor(flagpoles$freedom_index, flagpoles$height_m)

summary(lm(height_m ~ freedom_index, data=flagpoles))

# How's Maine doing building the world's largest flagpole?

write.csv(flagpoles, file = "/Users/speegled/local_R_projects/bayeta/data-raw/flagpoles/flagpoles.csv", row.names = F)
