# load ggplot2
library(ggplot2)

tree_data <- data.frame(
  x_pos = c(
    # left point, right point, middle point
    1.5, 2.5, 2
  ),
  y_pos = c(
    0, 0, 1
  )
)

set.seed(20241225)
n <- 100

x = runif(n, 0, 3)

snowflakes <- data.frame(
  x = runif(n, 1, 3),
  y = runif(n, 0, 1.5)
)

ggplot(tree_data, aes(x = x_pos, y = y_pos)) +
  geom_polygon(fill = "forestgreen") +
  #theme_void() +
  theme(
    plot.background = element_rect(
      # fill = "midnightblue"
    ), 
    plot.title = element_text(
      colour = "gold",
      size = 32,
      hjust = 0.5,
      vjust = 0,
      family = "serif"
    )
  ) +
  labs(
    title = "Merry Christmas"
  ) +
  # add snowflakes
  geom_point(
    data = snowflakes,
    mapping = aes(x = x, y = y),
    colour = "pink",
    shape = 8,
    size = 1
    ) +
  
  # add bauble
  geom_point(
    data = data.frame(
      x = 2,
      y = 1
    ), 
    aes(x = x, y = y),
    colour = "tomato",
    size = 6
  ) +
  
  # add star
  geom_point(
    data = data.frame(
      x = 1.5,
      y = 1.3
    ),
    aes(x = x, y = y),
    shape = 8,
    size = 5,
    color = "gold"
  )
