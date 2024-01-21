library(pdftools)

aa[[1]]$word
library(tidyverse)


utensil_data <- purrr::map_df(7:31, function(page) {
  aa <- pdf_ocr_data("data-raw/utensils/Kitchen_Utensils_poll_results.pdf", pages = page)
  dd <- data.frame(usage = character(0),
                   total = integer(0),
                   male = integer(0),
                   female = integer(0),
                   x18_29 = integer(0),
                   x30_44 = integer(0),
                   x45_64 = integer(0),
                   x65_plus = integer(0),
                   white = integer(0),
                   bleck = integer(0),
                   hispanic = integer(0),
                   other = integer(0),
                   total = integer(0),
                   dem = integer(0),
                   ind = integer(0),
                   rep = integer(0),
                   biden = integer(0),
                   trump = integer(0),
                   lowinc = integer(0),
                   midinc = integer(0),
                   highinc = integer(0),
                   northeast = integer(0),
                   midwest = integer(0),
                   south = integer(0),
                   west = integer(0))
  ww <- aa[[1]]$word
  a1 <- which(ww == "Use")
  a2 <- which(ww == "Thinking")
  ut <- str_c(ww[(a1 + 2):(a2 - 1)], collapse = "_")
  N <- ww[str_detect(ww, "\\(") & str_detect(ww, "\\)")] %>%
    str_remove_all("[\\(\\)]")

  df1 <- as.data.frame(t(c("N", N[1:11])))
  names(df1) <- names(dd)[1:12]
  df2 <- as.data.frame(t(c("N", N[12:24])))
  names(df2) <- names(dd)[c(1, 13:25)]
  df1
  df2
  usage <- c("frequently", "sometimes", "never", "dont_own", "dont_know", "total", "N")

  ww <- ww[str_detect(ww, "\\%")]
  ww <- str_replace_all(ww, "A", "4")
  ww <- str_replace_all(ww, "T", "7")
  ww <- str_remove_all(ww, "\\%")

  p1 <- bind_rows(purrr::map_dfr(1:6, function(x) {
    temp <- as.data.frame(t(c(usage[x], ww[(11 * (x - 1) + 1) : (11 * x)])))
    names(temp) <- names(dd)[1:12]
    temp
  }), df1)

  ww2 <- ww[-(1:66)]
  ww2
  p2 <- bind_rows(purrr::map_dfr(1:6, function(x) {
    temp <- as.data.frame(t(c(usage[x], ww2[(13 * (x - 1) + 1) : (13 * x)])))
    names(temp) <- names(dd)[c(1, 13:25)]
    temp
  }), df2)

  bind_cols(p1, p2) %>%
    select(-usage...13, -total.1) %>%
    rename(usage = usage...1) %>%
    mutate(utensil = ut)
})
head(utensil_data, 30) %>% print(n = 30)
utensil_data <- utensil_data %>%
  pivot_longer(cols = !matches("usage|utensil")) %>%
  select(utensil, name, usage, value) %>%
  rename(demographic = name, percent = value) %>%
  mutate(percent = as.integer(str_remove_all(percent, ",")))

utensil_data$group <- rep(c("none", "sex", "sex", rep("age", 4), rep("race", 4), rep("party", 3), rep("vote", 2), rep("income", 3), rep("region", 4)), 175)
utensil_data <- utensil_data %>% mutate(utensil = snakecase::to_snake_case(utensil))

utensil_data <- utensil_data %>%
  mutate(demographic = ifelse(demographic == "bleck", "black", demographic))
utensil_data <- utensil_data %>%
  arrange(utensil, group)

utensils <- utensil_data
save(utensils, file = "data/utensils.rda")
load("data/utensils.rda")
write.csv(utensils, "data-raw/utensils/utensils.csv", row.names = F)

