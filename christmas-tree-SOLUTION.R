# Load ggplot2
library(ggplot2)

# Create the tree data (three triangles for the tree and one rectangle for the trunk)
tree_data <- data.frame(
  x = c(1.5, 2.5, 2, # Triangle 1 vertices
        1.5, 2.5, 2, # Triangle 2 vertices
        1.7, 2.3, 2, # Triangle 3 vertices
        1.7, 2.3, 2, 1 # Trunk vertices
      ),
  y = c(0, 0, 1,       # Triangle 1 vertices
        0.5, 0.5, 1.5, # Triangle 2 vertices
        1.2, 1.2, 2, # Triangle 3 vertices
        1.7, 2.3, 2, 1 # Trunk vertices
        ),
  group = c(1, 1, 1, # Group for Triangle 1
            2, 2, 2, # Group for Triangle 2
            3, 3, 3,  # Group for Triangle 3
            4, 4, 4, 4  # Group for Triangle 3
            )  
)


# Plot the triangle
ggplot(tree_data, aes(x = x, y = y, group = group)) +
  geom_polygon(aes(fill = factor(group)), color = "black") +  # Fill and outline color
  scale_fill_manual(values = c("forestgreen", "darkgreen", "darkgreen", "brown4")) +
  coord_fixed() + # Ensures the x and y axes are scaled equally, keeping the triangle proportions correct.
  theme_void() +
  theme(
    legend.position = "none"
  )

