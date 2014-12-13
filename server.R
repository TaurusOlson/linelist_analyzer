
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
    
    # Plot
    output$linelistPlot <- renderPlot({
        
        if (input$select.plot.type == "plot") {
            plot(data[[input$select.x]], 
                 data[[input$select.y]],
                 xlab=input$select.x, ylab=input$select.y,
                 col="tomato")
        }

        else if (input$select.plot.type == "line") {
            plot(data[[input$select.x]], 
                 data[[input$select.y]],
                 xlab=input$select.x, ylab=input$select.y,
                 col="tomato", type="l")
        }
        
        else if (input$select.plot.type == "boxplot") {
            boxplot(data[[input$select.x]], 
                    ylab=input$select.x,
                    col="seagreen")
        }
        else if (input$select.plot.type == "histogram") {
            hist(data[[input$select.x]], 
                    xlab=input$select.x,
                 col="seagreen")
        }
    })
})

