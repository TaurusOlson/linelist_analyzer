
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

source('global.R')

make.sliderInput <- function(inputId, aLabel) {
    x <- linelist[[aLabel]]
    return(sliderInput(inputId, label=aLabel, min(x), max(x), range(x)))
}


shinyServer(function(input, output) {
    
    # Plot
    output$linelistPlot <- renderPlot({

        x.label <- input$select.x
        y.label <- input$select.y
        x <- linelist[[x.label]]
        y <- linelist[[y.label]]
        
        if (input$select.plot.type == "plot") {
            plot(x, y, xlab=x.label, ylab=y.label, col="tomato")
        }

        else if (input$select.plot.type == "line") {
            plot(x, y, xlab=x.label, ylab=y.label, col="tomato", type="l")
        }
        
        else if (input$select.plot.type == "boxplot") {
            boxplot(y, ylab=y.label, col="seagreen")
        }
        else if (input$select.plot.type == "histogram") {
            hist(y, xlab=y.label, col="seagreen")
        }
    })


    output$ui <- renderUI({

        x.label <- input$select.x
        y.label <- input$select.y

        switch(input$select.plot.type,
               "histogram" = selectInput("select.x", label=h4("x axis"), choices=linelist.columns, selected=y.label),
               "boxplot" = selectInput("select.y", label=h4("y axis"), choices=linelist.columns, selected=y.label),
               "line" = c(selectInput("select.x", label=h4("x axis"), choices=linelist.columns, selected=x.label),
                          selectInput("select.y", label=h4("y axis"), choices=linelist.columns, selected=y.label)),
               "plot" = c(selectInput("select.x", label=h4("x axis"), choices=linelist.columns, selected=x.label),
                          selectInput("select.y", label=h4("y axis"), choices=linelist.columns, selected=y.label))
               )
    })


    output$sliders <- renderUI({

        x.label <- input$select.x
        y.label <- input$select.y

        switch(input$select.plot.type,
               "histogram" = make.sliderInput("slider.x", y.label),
               "boxplot" = make.sliderInput("slider.y", y.label),
               "line" = c(make.sliderInput("slider.x", x.label), make.sliderInput("slider.y", y.label)),
               "plot" = c(make.sliderInput("slider.x", x.label), make.sliderInput("slider.y", y.label))
               )
    })

})

