library(tidyverse)

mallards <- read_csv("data/mallards.csv", show_col_types = FALSE) |>
  mutate(
    timestamp = ymd_hms(timestamp),
    month     = month(timestamp, label = TRUE, abbr = TRUE),
    month_num = month(timestamp),
    year      = year(timestamp),
    season    = case_when(
      month_num %in% c(3, 4, 5)   ~ "Spring",
      month_num %in% c(6, 7, 8)   ~ "Summer",
      month_num %in% c(9, 10, 11) ~ "Autumn",
      TRUE                         ~ "Winter"
    ),
    season = factor(season, levels = c("Spring", "Summer", "Autumn", "Winter"))
  )

saveRDS(mallards, "data/mallards.rds")
