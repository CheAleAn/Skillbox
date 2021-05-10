#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#setwd('D:/Skillbox/Analytics, Middle')
dat <- read.csv("titanic.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(

    titlePanel("Titanic hw"),
    
        fluidRow(
            column(4,selectInput("notcounted", "Barplot:",
                                 choices = c("Survived", "Pclass", "Sex"))),
            column(4,selectInput("counted", "Historam:",
                                 choices = c("Age", "Fare")))
        ),
        fluidRow(
            column(4,selectInput("ucolor.first", "Select color",
                                 choices = c("Red" = "red",
                                             "Yellow" = "yellow",
                                             "Green" = "green"))),
            column(4,selectInput("ucolor.second", "Select color",
                                 choices = c("Red" = "red",
                                             "Yellow" = "yellow",
                                             "Green" = "green")))
        ),
        fluidRow(
                splitLayout(cellWidths = c("50%", "50%"), 
                            plotOutput("distPlot1"), plotOutput("distPlot2"))
        )
    )

server <- function(input, output) {

    output$distPlot1 <- renderPlot({
        barplot(table(dat[,input$notcounted]), 
                col = input$ucolor.first,
                main = input$notcounted,
                xlab = "Possible values"
             )
    })
    output$distPlot2 <- renderPlot({
        hist(dat[,input$counted], 
             col = input$ucolor.second,
             main = input$counted,
             xlab = "Possible values"
        )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
