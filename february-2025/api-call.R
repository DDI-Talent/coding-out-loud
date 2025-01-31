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

users_df <- resp_body_json(resp_users, simplifyVector = TRUE)$users

users_df |>
  select(password, username) |>
  arrange(username) |>
  slice(1:10)
