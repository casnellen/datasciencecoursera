# This is the user interface for the shiny app to determine diamond price based on factors such as carat, cut, color, and clarity a Shiny web application. You can

library(shiny)
library(ggplot2)

# load data
data("diamonds")

# Define UI for the application
shinyUI(fluidPage(titlePanel("Diamonds - Explore the Data"),
                  
  # Sidebar with a slider input for number of variables
  sidebarLayout(sidebarPanel(h4("Choose Diamond Factors"),
    selectInput("X", "X", (sort(unique(colnames(diamonds))))),
    selectInput("Y", "Y", (sort(unique(colnames(diamonds))))),
    selectInput("Color", "Color", (sort(unique(colnames(diamonds)))))),
  # Show a plot of the carat/price relationship
  mainPanel("Diamond Variable Relationships", plotOutput("distPlot"))
                  )))