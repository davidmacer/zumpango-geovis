#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(sf)
library(leaflet)

# Importa la capa de localidades del gpkg de Zumpango
zump_path_data <- "./data/zumpango.gpkg"
zumpango_colonias <- st_read(zump_path_data,
                             layer = "1.01 Colonias")
zumpango_colonias <- st_transform(st_as_sf(zumpango_colonias), 4326)
  
zumpango_locs <- st_read(zump_path_data,
                    layer = "1.03 Localidades")
zumpango_locs <- st_transform(st_as_sf(zumpango_locs), 4326)

# Define la lógica del servidor requerida para crear el mapa
function(input, output, session) {

  output$mymap <- renderLeaflet({
    
    leaflet()  |>
      setView(-99.15, 19.73, 11) |>
      addProviderTiles("CartoDB.VoyagerLabelsUnder",
                       options = providerTileOptions(noWrap = TRUE)) |>
      addPolygons(data = zumpango_locs,
                  color = "#b091d4",
                  weight = 2)
      # addPolygons(data = zumpango_colonias,
      #             fill = "green",
      #             weight = 4)
      
  })

}
