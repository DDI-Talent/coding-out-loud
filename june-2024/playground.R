library(lubridate)

birth_dates <- ymd("2000-09-01", "1990-05-26")

floor(interval(birth_dates, now()) / years(1))