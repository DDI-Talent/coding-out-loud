library(tidyverse)

# Step 1: Loading in a Tidy Tuesday dataset from 2023-02-14
age_gaps <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-02-14/age_gaps.csv')

# Step 2: Select the columns we need
age_gaps_selected <- age_gaps %>% 
  select(actor_1_name, actor_2_name, actor_1_birthdate, actor_2_birthdate)
# Step 3: Pivot to obtain 2 columns: one with names, one with birth dates

# Step 4: Use the pull() function to get a vector of birth dates 
# (as the task is to write a vector function)

# Step 5: Define the function and the name of the function

# Step 6: Define the inputs and outputs

# Step 7: Turn the input vector into date format

# Step 8: Create a vector of the same length as the input vector, with today's
# date repeated length(input_vector) times

# Step 9: Use the interval function to calculate the interval (in years) between
# the input vector and the todays_date vector