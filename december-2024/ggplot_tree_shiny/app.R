library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("decorating the tree!"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("stars_number",
                  "Number of stars:",
                  min = 1,
                  max = 300,
                  value = 100)
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    # start plot
    
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
    
    
    snowflakes <- data.frame(
      x = runif(n, 1, 3),
      y = runif(n, 0, 1.5)
    )
    
    
    make_bouble <- function(x_bouble, y_bouble, color_bouble){
      geom_point(
        data = data.frame(
          x = x_bouble,
          y = y_bouble
        ), 
        aes(x = x, y = y),
        colour = color_bouble,
        size = 13
      )
    }
    
    ggplot(tree_data, aes(x = x_pos, y = y_pos)) +
      geom_polygon(fill = "forestgreen") +
      theme_void() +
      theme(
        plot.background = element_rect(
          fill = "midnightblue"
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
      make_bouble( 2,1,"orange") + 
      make_bouble( 2,0.6,"grey98") + 
      make_bouble( 1.7,0.2,"violet") + 
      make_bouble( 2.3,0.3,"pink") + 
      make_bouble( 2, 0.6,"goldenrod") + 
      
      
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
    
    
    
    # -- end of plot
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
