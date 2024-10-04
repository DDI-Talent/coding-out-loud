create_pairs <- function( students_pool, group_size ){
  number_of_group <- length(students_pool) %/% group_size
  which_group_youre_in <- rep(1:number_of_group, group_size +1)[1:length(students_pool)]
  return(which_group_youre_in)
}

create_pairs(students_pool = LETTERS[1:7] , group_size = 2 )