
install.packages("tidyquant")
today <- Sys.Date()
# subtract 3 months from the current date
date = today %m+% years(-30)
print(date)
quantmod::getSymbols(Symbols = "GSPC", src = "google")
aapl <- tidyquant::tq_get("AAPL", from = date)
getSymbols('AAPL')
library(lubridate)
aapl <- aapl %>%
  filter(month(date) == 1) %>%
  mutate(year = year(date)) %>%
  group_by(year) %>%
  slice_min(day(date))

aapl$percent_change <- c(NA, diff(aapl$adjusted)/aapl$adjusted[-1])
write.csv(aapl, "data-raw/apple/apple.csv", row.names = F)
