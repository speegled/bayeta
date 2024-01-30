stars <- read.csv("https://mathstat.slu.edu/~clair/stat1300/data/stars.csv")
write.csv(stars, "data-raw/stars/stars.csv", row.names = F)

save(stars, file = "data/stars.rda")
