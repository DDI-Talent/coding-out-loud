library(tidyverse)

# Step 1: Loading in a Tidy Tuesday dataset from 2023-02-14
age_gaps <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-02-14/age_gaps.csv')

# Step 2: Select the columns we need
age_gaps_selected <- age_gaps %>% 
  select(actor_1_name, actor_2_name, actor_1_birthdate, actor_2_birthdate)
# Step 3: Pivot to obtain 2 columns: one with names, one with birth dates
age_gaps_pivoted <- age_gaps_selected %>% 
  pivot_longer(cols = ends_with("name"),
               names_to = "which_actor",
               values_to = "actor_name") %>% 
  pivot_longer(cols = ends_with("birthdate"),
               names_to = "which_actor_date",
               values_to = "birthdate") %>% 
  filter((which_actor == "actor_1_name" & which_actor_date == "actor_1_birthdate")|
           (which_actor == "actor_2_name" & which_actor_date == "actor_2_birthdate")) %>% 
  select(actor_name, birthdate)


# Step 4: Use the pull() function to get a vector of birth dates 
# (as the task is to write a vector function)

# Step 5: Define the function and the name of the function

# Step 6: Define the inputs and outputs

# Step 7: Turn the input vector into date format

# Step 8: Create a vector of the same length as the input vector, with today's
# date repeated length(input_vector) times

# Step 9: Use the interval function to calculate the interval (in years) between
# the input vector and the todays_date vector

# I tried using Copilot to refactor the code, but it's not come up
# with anything useful
age_gaps_pivoted_ai <- age_gaps_selected %>%
  mutate(across(ends_with("birthdate"), as.character)) %>%  # Convert birthdate to character
  pivot_longer(cols = starts_with("actor_"),
               names_to = "which_actor",
               values_to = "value") %>%
  separate(which_actor, into = c("actor", "attribute"), sep = "_") %>%
  pivot_wider(names_from = attribute, values_from = value) %>%
  mutate(birthdate = as.Date(birthdate)) %>%  # Convert birthdate to date type
  select(actor_name, birthdate)
