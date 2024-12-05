# Load ggplot2
library(ggplot2)


tree_data <-  data.frame(
  # left point, right point, top point
  x = c(1.5, 2.5, 2),
  y = c(0, 0, 1)
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
  # Add a star
  geom_point(aes(x = 0.5, y = 2), 
             shape = 8, 
             color = "yellow", 
             size = 5, 
             inherit.aes = FALSE) +
  
  # Add a bauble at the top
  geom_point(aes(x = 2, y = 1), 
             shape = 16, 
             color = "tomato2", 
             size = 5, 
             inherit.aes = FALSE) +
  
  # Add snowflakes
  geom_point(
    data = snowflakes,
    mapping = aes(
      x = x,
      y = y
    ),
    colour = "grey98",
    size = 2,
    shape = 8,
    inherit.aes = FALSE
  )
  
  

