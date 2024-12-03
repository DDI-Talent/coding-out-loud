# Load ggplot2
library(ggplot2)

# Create the tree data (three triangles for the tree and one rectangle for the ground)
tree_data <- data.frame(
  # left point, right point, top point
  x = c(1.5, 2.5, 2, # Bottom 
        1.5, 2.5, 2, # Middle
        1.5, 2.5, 2, # Top 
        0, 0, 3, 3 # Ground 
      ),
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

# https://realworlddatascience.net/ideas/tutorials/posts/2023/12/12/xmas-cards.html
set.seed(20231225)
n <- 100

snowflakes <- data.frame(
  x = runif(n, 0, 3),
  y = runif(n, 0, 3)
)


# Plot the triangle
ggplot(tree_data, aes(x = x, y = y, group = group)) +
  
  geom_polygon(aes(fill = factor(group)), color = "black") +  # Fill and outline color
  scale_fill_manual(values = c("forestgreen", "darkgreen", "forestgreen", "grey98")) +
  
  # Add a star
  geom_point(aes(x = 0.5, y = 2.5), shape = 8, color = "yellow", size = 5, inherit.aes = FALSE) +
  
  # Add a bauble at the top
  geom_point(aes(x = 2, y = 2), shape = 16, color = "tomato2", size = 5, inherit.aes = FALSE) +
  
  # Add snowflakes
  geom_point(
    data = snowflakes,
    mapping = aes(
      x = x,
      y = y
    ),
    colour = "grey98",
    size = 0.6,
    pch = 8,
    inherit.aes = FALSE
  ) +
  theme_void() +
  theme(
    legend.position = "none",
    plot.background = element_rect(
      fill = "midnightblue"
    ),
    plot.title = element_text(color = "grey98", size = 32, hjust = 0.5, vjust = -2, family = "serif")
  ) +
  labs(
    title = "Merry Christmas"
  )

