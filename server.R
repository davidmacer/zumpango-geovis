#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {

  output$mymap <- renderLeaflet({
    
    leaflet()  |>
      setView(-99.09917, 19.79694, 11) |>
      addProviderTiles("CartoDB.VoyagerLabelsUnder",
                       options = providerTileOptions(noWrap = TRUE))
  })

}
