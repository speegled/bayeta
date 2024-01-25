
install.packages("tidyquant")
today <- Sys.Date()
# subtract 3 months from the current date
date = today %m+% years(-30)
print(date)
quantmod::getSymbols(Symbols = "GSPC", src = "google")
aapl <- tidyquant::tq_get("AAPL", from = date)
getSymbols('AAPL')
library(lubridate)

mod_df <- function(aapl) {
  aapl <- aapl %>%
    filter(month(date) == 1) %>%
    mutate(year = year(date)) %>%
    group_by(year) %>%
    slice_min(day(date))

  aapl$percent_change <- c(NA, diff(aapl$adjusted)/aapl$adjusted[-1])
  aapl
}
mod_df(aapl)
write.csv(aapl, "data-raw/apple/apple.csv", row.names = F)


wmt <- tidyquant::tq_get("WMT", from = date)
wmt <- mod_df(wmt)
mcd <- tidyquant::tq_get("MCD", from = date)
mcd <- mod_df(mcd)

three_stocks <- bind_rows(aapl, wmt, mcd)
write.csv(three_stocks, "data-raw/apple/three_stocks.csv", row.names = F)
