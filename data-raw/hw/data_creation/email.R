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
