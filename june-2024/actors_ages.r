library(tidyverse)
library(here)
source(here("june-2024/Task.R"))

age_gaps <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-02-14/age_gaps.csv') # nolint

actor_1s <- age_gaps %>%
  select(name = actor_1_name, dob = actor_1_birthdate)

actor_2s <- age_gaps %>%
  select(name = actor_2_name, dob = actor_2_birthdate)

actor_ages <- bind_rows(actor_1s, actor_2s) %>%
  mutate(age = get_ages(dob)) %>%
  arrange(name) %>%
  distinct(name, .keep_all = TRUE)

View(actor_ages)
