library(ggplot2)

snowman <- ggplot() +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = "midnightblue"
    )
  )

snowman2 <- snowman +
  annotate(
    geom = "rect",
    xmin = 0, xmax = 1,
    ymin = 0, ymax = 0.2,
    fill = "grey98",
    colour = "grey98"
  ) +
  xlim(0, 1) +
  ylim(0, 1) +
  coord_fixed(expand = FALSE)

set.seed(20231225)
n <- 100
snowflakes <- data.frame(
  sf_x = runif(n, 0, 1),
  sf_y = runif(n, 0, 1)
)

snowman3 <- snowman2 +
  geom_point(
    data = snowflakes,
    mapping = aes(
      x = sf_x,
      y = sf_y
    ),
    colour = "white",
    pch = 8
  )
snowman3

