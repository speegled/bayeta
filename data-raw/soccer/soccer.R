soc <- read.csv("data-raw/soccer/soccer_bdays.csv")
soc <- janitor::clean_names(soc)
soccer <- soc
save(soccer, file = "data/soccer.rda")
