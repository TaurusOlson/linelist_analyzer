
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

plot.types <- list("scatter"="plot",
                   "boxplot"="boxplot",
                   "hist"="histogram",
                   "line"="line")

shinyUI(fluidPage(
 
    # Plot
    fluidRow(plotOutput("linelistPlot")),

    # ----------------------------------------
    
    # Selectors
    fluidRow(
        sidebarLayout(  
            # Plot
            sidebarPanel(            
                # Plot type
                selectInput("select.plot.type", label=h4("Plot type"), choices=plot.types),
                
                # x axis
                selectInput("select.x", label=h4("x axis"), choices=data.columns),
      
                # y axis
                selectInput("select.y", label=h4("y axis"), choices=data.columns)
            ),
            #
            #
            #
            sidebarPanel()
        )
    )
))
