dd <- read.csv("/Users/speegled/Documents/teachingold/Spring_2024/4850/data/ufos.csv")
write.csv(dd, "data-raw/ufos/ufos.csv",row.names = F)
ufo <- dd
save(ufo, file = "data/ufo.rda")
