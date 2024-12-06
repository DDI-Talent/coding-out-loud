# Load ggplot2
library(ggplot2)


tree_data <-  data.frame(
  # left point, right point, top point
  x = c(1.5, 2.5, 2, # Bottom 
        1.5, 2.5, 2, # Middle
        1.5, 2.5, 2, # Top 
        0, 0, 3, 3), # Ground 
  y = c(0, 0, 1,       # Bottom 
        0.5, 0.5, 1.5, # Middle
        1.1, 1.1, 2, # Top 
        0, 0.2, 0.2, 0 # Ground 
  ),
  group = c(1, 1, 1, # Bottom
            2, 2, 2, # Middle
            3, 3, 3,  # Top
            4, 4, 4, 4  # Group for Ground
  ) 
)

set.seed(20241225)
n <- 100

# generates n random numbers drawn from a uniform distribution with a minimum value of 0 and a maximum value of 3
snowflakes <- data.frame(
  x = runif(n, 0, 3),
  y = runif(n, 0, 3)
)

ggplot(tree_data, aes(x = x, y = y)) +
  geom_polygon(fill = "forestgreen") +
  theme(
    plot.background = element_rect(
       fill = "white"
     ),
    plot.title = element_text(color = "yellow", 
                            size = 32, 
                            hjust = 0.5, 
                            vjust = -2, 
                            family = "serif")
  ) +
  labs(
     title = "Merry Christmas"
  ) +
  
  # # Add a star
  # geom_point(data = data.frame(
  #                   x = 0.5,
  #                   y = 2
  #                 ), 
  #            aes(x = x, y = y), 
  #            shape = 8, 
  #            color = "yellow", 
  #            size = 5) +
  # 
  # # Add a bauble at the top
  # geom_point(data = data.frame(
  #                   x = 2,
  #                   y = 1
  #                 ),
  #            aes(x = x, y = y), 
  #            shape = 16, 
  #            color = "tomato2", 
  #            size = 5) +
  
  # Add snowflakes
  # geom_point(
  #   data = snowflakes,
  #   mapping = aes(
  #     x = x,
  #     y = y
  #   ),
  #   colour = "grey98",
  #   size = 2,
  #   shape = 8,
  #   inherit.aes = FALSE
  # )
  
  

