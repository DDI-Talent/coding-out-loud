# Given a vector of birthdates, write a function to compute the age in years.
library(lubridate)
# Step 1: Define a function name and an empty function

# Step 2: Name the inputs (aka arguments or parameters)

# Step 3: Define the return value

# Step 4: Test the function

# Step 5: Define a variable that will represent the input

# Step 6: Test the function again

# Step 7: Write the algorithm within the function

get_ages <- function(birthdates) {
  # do the algorithm
  # ensure the input is in date format
  birthdates_as_dates <- as.Date(birthdates)
  # store today's date in a variable
  todays_date <- now()
  # compare all birthdates to today's date and get the difference in years
  ages <- interval( birthdates_as_dates, todays_date ) / years(1)
  # return a vector of integers  
  return( floor(ages) ) 
}

example_birthdates <- c("2001-02-19", "1995-06-30")

# run, execute, call
get_ages(example_birthdates)

















