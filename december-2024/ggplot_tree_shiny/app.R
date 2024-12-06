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
    set.seed(20241225)
    n <- input$stars_number
    
    
    # generates n random numbers drawn from a uniform distribution with a minimum value of 0 and a maximum value of 3
    snowflakes <- data.frame(
      x = runif(n, 0, 3),
      y = runif(n, 0, 3)
    )
    
    
    # Plot the triangles
    ggplot(tree_data, aes(x = x, y = y, group = group)) +
      
      geom_polygon(aes(fill = factor(group)), color = "black") +  # Fill and outline color
      scale_fill_manual(values = c("forestgreen", "darkgreen", "forestgreen", "grey98")) +
      
      # Add a star
      geom_point(data = data.frame(
        x = 1,
        y = 2.5
      ), 
      aes(x = x, y = y), 
      shape = 8, 
      color = "yellow", 
      size = 5,
      inherit.aes = FALSE) +
      
      
      # Add a bauble at the top
      geom_point(data = data.frame(
        x = 2,
        y = 2
      ),
      aes(x = x, y = y), 
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
        size = 0.6,
        pch = 8,
        inherit.aes = FALSE
      ) +
      # 
      theme_void() +
      theme(
        legend.position = "none",
        plot.background = element_rect(
          fill = "midnightblue"
        ),
        plot.title = element_text(color = "yellow", size = 32, hjust = 0.5, vjust = -1, family = "serif")
      ) +
      labs(
        title = "Merry Christmas"
      )
    
    
    # -- end of plot
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
