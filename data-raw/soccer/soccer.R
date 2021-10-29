soc <- read.csv("data/soccer_bdays.csv")
soc <- janitor::clean_names(soc)
save(soc, file = "data/soccer.rda")
