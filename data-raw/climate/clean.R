#https://ourworldindata.org/grapher/global-precipitation-anomaly
#https://ourworldindata.org/grapher/temperature-anomaly?tab=chart&country=~Global

dd <- read.csv("data-raw/climate/temperature-anomaly.csv")
aa <- read.csv("data-raw/climate/precipitation-anomaly.csv")
dd <- dd |>
  filter(Entity == "Global")
dd <- dd |>
  dplyr::select(Year, Global.average.temperature.anomaly.relative.to.1961.1990)
left_join(aa, dd, by = "Year") |>
  dplyr::select(Year, matches("Global")) |>
  rename(precip = Global.precipitation.anomaly,
         temp = Global.average.temperature.anomaly.relative.to.1961.1990) |>
  janitor::clean_names() |>
  write.csv("data-raw/climate/climate.csv", row.names = F)




