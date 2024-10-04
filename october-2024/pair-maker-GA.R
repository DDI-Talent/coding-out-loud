# Just to extract the printing message away from the meat of the code
print_week <- function(week_number) {
  cat('---------------
-- Week', week_number, '--
---------------\n
GET NEW SET OF PAIRS\n')
}


# Collapse pairs into single string
sort_and_combine <- function(pair) {
  paste(sort(pair), collapse = '-')
}

# Extract the "cost" or "fitness" of the group
fitness_function <- function(pairs, record) {
  pairs_strings <- sapply(pairs, sort_and_combine)
  sum(pairs_strings %in% unlist(record))
}


create_pairs <- function(pool = 1:12, group_size = 2, record = NULL, population = 10) {
  # initialization stuff
  pool_idx <- seq_along(pool)
  number_of_groups <- length(pool) %/% group_size
  group_names <- rep(1:number_of_groups,
                     times = group_size + 1)
  
  
  pool_idx <- seq_along(pool)
  group_names1 <- group_names[pool_idx]
  group_names2 <- group_names[1:length(pool)]
  
  winning_dups  <- Inf
  how_many_dups <- Inf
  winning_pairs <- c()
  i <- 0
  # the real work happens here
  while (i < population && how_many_dups > 0) {
    i <- i + 1
    pairs <- split(sample(pool), group_names)

    how_many_dups <- fitness_function(pairs, record)

    if (how_many_dups <= winning_dups) {
      winning_dups  <- how_many_dups
      winning_pairs <- sapply(pairs, sort_and_combine)

      cat("NEW WINNER: Attempt", i, "had\n   ", winning_dups, 'duplicates\n\n')
      cat('WINNING PAIRS', winning_pairs, '\n', sep = '\n\t')

    }
  }

  # readline('<...>') # uncomment to see results week by week

  c(record, list(winning_pairs))
}

# ------------------------------------ #

## for 1 week
num_students <- 5
create_pairs(LETTERS[1:num_students],
             population = 1000)

# ------------------------------------ #

## loop for n_weeks weeks
record <- NULL
num_students <- 5
n_weeks <- 8
for (i in 1:n_weeks){
  print_week(i)
  record <- create_pairs(LETTERS[1:num_students],
                         record = record,
                         population = 1000)
}


