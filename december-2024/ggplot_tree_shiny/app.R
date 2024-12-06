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
  
  
  some_variable <- input$stars_number
  
  
  output$distPlot <- renderPlot({
    
    # start plot
    
    
    
    
    # -- end of plot
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
