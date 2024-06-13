#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Proyecto Zumpango"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        id = "sidebar",
        width = 2,
        div(
          style = 'font-family: Nunito; font-weight: 600;',
          checkboxGroupInput(
            "selectLayer",
            h3("Selecciona la capa deseada"),
            choices = list("A", "B", "C")
            )
          )
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
          width = 10,
          div( # Mapa base que contiene las capas de Zumpango
            leafletOutput(outputId = "mymap",
                          height = 820)
            )
          )
      )
)
