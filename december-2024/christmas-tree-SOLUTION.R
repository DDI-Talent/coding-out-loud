# Load ggplot2
library(ggplot2)

# Create the tree data (three triangles for the tree and one rectangle for the trunk)
tree_data <- data.frame(
  x = c(1.5, 3, 2, # Triangle 1 
        1.5, 3, 2, # Triangle 2 
        1.5, 3, 2, # Top 
        0, 0, 3, 3 # Trunk 
      ),
  y = c(0, 0, 1,       # Triangle 1 
        0.5, 0.5, 1.5, # Triangle 2 
        1.1, 1.1, 2, # Top 
        0, 0.2, 0.2, 0 # Trunk 
        ),
  group = c(1, 1, 1, # Group for Triangle 1
            2, 2, 2, # Group for Triangle 2
            3, 3, 3,  # Group for Triangle 3
            4, 4, 4, 4  # Group for Trunk
            )  
)

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
  
  # Add a star at the top
  geom_point(aes(x = 0.5, y = 2.5), shape = 8, color = "yellow", size = 5, inherit.aes = FALSE) +
  
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
    )
  ) +
  labs(
    title = "Merry Christmas"
  )

