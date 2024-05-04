#'
#'  (M = 5.79, SD = 0.84)
#' compared to the neutral condition (M = 4.86, SD = 1.42), t(89) = 3.03, p = .003, d = 0.77,
#' 95% CI = [0.25, 1.29], and compared to the low anticipated boredom condition (M = 4.95,
#'                                                                           SD = 1.23),
#'
#'

set.seed(2)
condition <- sample(c("low boredom", "high boredom"), 92, replace = T)
table(condition)
dd <- data.frame(condition = sort(condition))
dd$boredom <- c(rnorm(47, 5.79, 0.84), rnorm(45, 4.95, 1.23))
dd$boredom <- round(dd$boredom * 5)/5

boxplot(round(dd$boredom) ~ dd$condition)
t.test(round(boredom) ~ condition, data = dd)
write.csv(dd, "data-raw/hw/bored.csv", row.names = F)



