# Load ggplot2
library(ggplot2)

# Create the tree data (three triangles for the tree and one rectangle for the trunk)
tree_data <- data.frame(
  x = c(2.5, 3, 2.75, # Triangle 1 
        2.5, 3, 2.75, # Triangle 2 
        2.5, 3, 2.75, # Triangle 3 
        0, 0, 4, 4 # Ground 
      ),
  y = c(0, 0, 1,       # Triangle 1 
        0.5, 0.5, 1.5, # Triangle 2 
        1.2, 1.2, 2, # Triangle 3 
        0, 0.3, 0.3, 0 # Ground 
        ),
  group = c(1, 1, 1, # Group for Triangle 1
            2, 2, 2, # Group for Triangle 2
            3, 3, 3,  # Group for Triangle 3
            4, 4, 4, 4  # Group for Ground
            )  
)


# Plot the triangle
ggplot(tree_data, aes(x = x, y = y, group = group)) +
  geom_polygon(aes(fill = factor(group)), color = "black") +  # Fill and outline color
  scale_fill_manual(values = c("forestgreen", "darkgreen", "forestgreen", "grey98")) +
  theme_void() +
  theme(
    legend.position = "none",
    plot.background = element_rect(
      fill = "midnightblue"
    )
  )

