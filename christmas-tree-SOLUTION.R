# Load ggplot2
library(ggplot2)

# Create the tree data (three triangles for the tree and one rectangle for the trunk)
tree_data <- data.frame(
  x <-  c(0.5, 3, 5.5,   # Bottom triangle
          1, 3, 5,   # Middle triangle
          1.7, 3, 4.2,   # Top triangle
          2.5, 2.5, 3.5, 3.5), # Trunk
  y <-  c(2, 5, 2,   # Bottom triangle
          3.5, 6, 3.5,   # Middle triangle
          5, 8, 5,   # Top triangle
          1, 2, 2, 1), # Trunk
  group <-  c(rep(1, 3), rep(2, 3), rep(3, 3), rep(4, 4)) # Grouping for each polygon
)

# Define colors for the polygons
colors <- c("darkgreen", "forestgreen", "darkgreen", "brown")

# Plot the tree
ggplot(tree_data, aes(x = x, y = y, group = group)) +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = "midnightblue"
    ),
    legend.position = "none"
  ) +
  geom_polygon(aes(fill = factor(group))) +
  scale_fill_manual(values = colors) +
  # Add ornaments (random points on the tree)
  geom_point(
    data = data.frame(
      x = runif(20, 2, 4),
      y = runif(20, 2, 7)
    ),
    aes(x = x, y = y), 
    inherit.aes = FALSE, # Prevent inheriting the global aes()
    color = "red", size = 3
  ) +
  # Add a star at the top
  geom_point(aes(x = 3, y = 8), shape = 8, color = "yellow", size = 5, inherit.aes = FALSE) +
  coord_fixed()


