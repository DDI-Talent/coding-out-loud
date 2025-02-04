library(dplyr)
library(httr2)

# set-api-parameters

base_url <- 'https://dummyjson.com'
resource <- 'users'
user_id <- '1'


req_users <- request(base_url) |>
  req_url_path_append(resource) |>
  req_headers(Accept = 'application/json')

resp_users <- req_perform(req_users)

#####################################################################
# Get data as a list

users_list <- resp_body_json(resp_users, simplifyVector = FALSE)
names(users)

users_list$total
users_list$skip
users_list$limit

users_list$users |> View()

#####################################################################
# Get data as a df

users_df <- resp_body_json(resp_users, simplifyVector = TRUE)

users_df$total
users_df$skip
users_df$limit

users_df$users |> View()

#####################################################################

# Calculate the average age of users
average_age <- users_df |>
  summarize(avg_age = mean(age, na.rm = TRUE))

print(average_age)

#####################################################################

# Count the number of users from each blood group
users_by_bloodgroup <- users_df |> 
  group_by(bloodGroup) |> 
  summarize(count = n()) |> 
  arrange(desc(count))

print(users_by_bloodgroup)

#####################################################################

# Count the frequency of first names
common_first_names <- users_df |> 
  group_by(firstName) |> 
  summarize(count = n()) |> 
  arrange(desc(count))

print(common_first_names)

#####################################################################

# Filter users residing in New York
users_in_ny <- users_df |> 
  filter(address$city == "New York")

print(users_in_ny$firstName)

#####################################################################

# Filter users whose usernames start with 'A'
users_username_A <- users_df |> 
  filter(startsWith(username, "a"))

print(users_username_A$firstName)

#####################################################################

library(ggplot2)

# Plot histogram of user ages
ggplot(users_df, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "aquamarine", color = "black") +
  labs(title = "Most users are in their late 20s or 30s", x = "Age", y = "Frequency")

#####################################################################

# Filter out users with missing email addresses (all of them have an email!)
users_with_email <- users_df |> 
  filter(!is.na(email))

print(users_with_email$firstName)

#####################################################################

# Create age groups
users_with_age_group <- users_df |> 
  mutate(age_group = case_when(
    age >= 18 & age <= 25 ~ "18-25",
    age >= 26 & age <= 35 ~ "26-35",
    age >= 36 & age <= 45 ~ "36-45",
    age >= 46 & age <= 60 ~ "46-60",
    age > 60 ~ "60+",
    TRUE ~ "Unknown"
  ), .after = birthDate)


#####################################################################

# Create a full name column
users_with_fullname <- users_df |> 
  mutate(full_name = paste(firstName, lastName), .after = lastName)

#####################################################################

users_birth_date_as_date <- users_df |> 
  mutate(
    birthDate = as.Date(birthDate, format = "%Y-%m-%d")
  )

