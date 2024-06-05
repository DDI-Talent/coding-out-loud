library(lubridate)

birth_dates <- ymd("2000-09-01", "1990-05-26")

floor(interval(birth_dates, now()) / years(1))

data(billboard)
billboard %>%
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE
  )