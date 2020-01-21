# This is a shiny app to determine diamond price based on carat, cut, color, and clarity

library(shiny)
library(ggplot2)
library(curl)

# Define server logic
shinyServer(function(input, output) {
  
  # load data
  data("diamonds")
  
  # create the initial output
  output$distPlot <- renderPlot({
    
    # plot the diamond data with carat and price
    p <- ggplot(data = diamonds, aes_string(x = input$X, y = input$Y, color= input$Color)) + geom_point()
    p <- p + xlab(as.character(input$X)) + ylab(as.character(input$Y))
    p
  }, height = 700)
})