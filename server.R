
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
            boxplot(data[[input$select.y]], 
                    ylab=input$select.y,
                    col="seagreen")
        }
        else if (input$select.plot.type == "histogram") {
            hist(data[[input$select.y]], 
                    xlab=input$select.y,
                 col="seagreen")
        }
    })


    output$ui <- renderUI({
        switch(input$select.plot.type,
               "histogram" = selectInput("select.x", label=h4("x axis"), choices=data.columns, selected=input$select.y),
               "boxplot" = selectInput("select.y", label=h4("y axis"), choices=data.columns, selected=input$select.y),
               "line" = c(selectInput("select.x", label=h4("x axis"), choices=data.columns, selected=input$select.x),
                          selectInput("select.y", label=h4("y axis"), choices=data.columns, selected=input$select.y)),
               "plot" = c(selectInput("select.x", label=h4("x axis"), choices=data.columns, selected=input$select.x),
                          selectInput("select.y", label=h4("y axis"), choices=data.columns, selected=input$select.y))
               )
    })
})

