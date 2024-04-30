ee <- openintro::email
ee$spam <- factor(ee$spam, labels = c("Spam", "Not Spam"), levels = c(1, 0))
ee$format <- factor(ee$format, labels = rev(c("Text", "HTML")), levels = c(1, 0))
ee$number
tt <- table(ee$spam, ee$number)
knitr::kable(addmargins(tt), format = "latex")
write.csv(ee, "data-raw/hw/email.csv", row.names = F)

ii <- openintro::immigration
knitr::kable(addmargins(table(ii$political, ii$response)), format = "latex")
?openintro::immigration
write.csv(ii, "data-raw/hw/imm.csv", row.names = F)

kk <- read.csv("https://raw.githubusercontent.com/speegled/bayeta/main/data-raw/hw/kitties_raw.csv")
head(kk)
table(kk$catID)
library(tidyverse)
table(kk$catID)


kk |>
  count(catID, sound, position)
kk$position <- ifelse(kk$catID == "n12" & kk$position == "same", "diff", kk$position)
tapply(kk$surprise, kk$position, mean)

boot_sim <- replicate(1000, {
  cat <- data.frame(catID = sample(unique(kk$catID), replace = T))
  human <- data.frame(ID = sample(unique(kk$ID), replace = T))
  mm <- left_join(cat, kk, relationship = "many-to-many", by = "catID")
  mm <- left_join(human, mm, relationship = "many-to-many", by = "ID")
  diff(tapply(mm$surprise, mm$position, mean))
})

hist(boot_sim)
same <- kk$surprise[kk$position == "same"]
dif <- kk$surprise[kk$position == "diff"]
boot_sim <- replicate(1000, {
  -mean(sample(dif, replace = T)) + mean(sample(same, replace = T))
})
hist(boot_sim)


