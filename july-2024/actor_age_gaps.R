library(tidyverse)
source('get_ages.R')

# read csv
actor_data <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-02-14/age_gaps.csv')

actor_ages <- actor_data %>% 
  mutate(row_id = row_number()) %>% 
  select(row_id, actor_1_name, actor_2_name, actor_1_birthdate, actor_2_birthdate)

# explore duplicates
# n_distinct(actor_ages$actor_1_name)
# duplicated(actor_ages$actor_2_name) %>% 
#   sum()

# actor_ages %>%
#   pivot_longer(
#     cols = ends_with("name"),
#     names_to = "actor_number",
#     values_to = "actor_name") %>%
#   pivot_longer(
#     cols = ends_with("date"),
#     names_to = "date_number",
#     values_to = "date") %>%
#   View()


actor_1 <- actor_ages %>% 
  select(row_id, name = actor_1_name, dob = actor_1_birthdate)

actor_2 <- actor_ages %>% 
  select(row_id, name = actor_2_name, dob = actor_2_birthdate)

combined_actors <- 
  bind_rows(actor_1, actor_2) %>% 
  distinct(name, .keep_all = TRUE) %>% 
  mutate(age = get_ages(dob)) %>% 
  arrange(desc(age))

actor_data %>% 
  mutate(row_id = row_number()) %>% 
  select(row_id, movie_name) %>% 
  inner_join(combined_actors, by = 'row_id') %>% 
  
  View()





























