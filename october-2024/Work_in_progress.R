sort_and_combine <- function(pair) {
  paste(sort(pair), collapse = '-')
}


create_pairs <- function( students_pool, group_size, record = NULL){
  number_of_group <- length(students_pool) %/% group_size
  which_group_youre_in <- rep(1:number_of_group, group_size +1)[1:length(students_pool)]
  
  
  final_groups <- split(sample(students_pool), which_group_youre_in)
  
  # this is the fitness here
  sum(final_groups %in% record)
  
  # this is the old record, with the new pairs added to it
  c(record, list(final_groups))
}

record <- create_pairs(students_pool = LETTERS[1:7],
                       group_size = 2,
                       record = NULL)

create_pairs(students_pool = LETTERS[1:7],
             group_size = 2,
             record)

1:4
sort_and_combine(record)

sapply(record, sort_and_combine)



F-E-B
D-E
C-G


sum(c('z', 'b', 'y') %in% c('x','y', 'z'))
