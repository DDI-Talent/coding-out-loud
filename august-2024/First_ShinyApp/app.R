#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# UI, Server, ShinyApp (ui,server)

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Tabsets"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          radioButtons("dist", "Distripution Types:",
                       c("Normal"="norm",
                         "Uniform"="unif",
                         "Log-normal"="lnorm",
                         "Exponential"="exp")),
          
          sliderInput("n",
                        "Number of observations",
                        min = 1,
                        max = 1000,
                        value = 500)
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tabsetPanel(type = "tabs",
                      tabPanel("Plot",plotOutput("plot")),
                      tabPanel("Summary",textOutput("summary"))
           
        )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
 d <-reactive({
   dist<-switch(input$dist,
                norm=rnorm,
                unif=runif,
                lnorm=rlnorm,
                exp=rexp,
                rnorm)
   dist(input$n)
 }) 

  
    output$plot <- renderPlot({
        # generate bins based on input$bins from ui.R

        # draw the histogram with the specified number of bins
        hist(d(), col = 'darkgray', border = 'white',
             xlab = 'number',
             main = 'Distribution')
    })
    
    output$summary <- renderPrint(summary(d()))
}

# Run the application 
shinyApp(ui = ui, server = server)










