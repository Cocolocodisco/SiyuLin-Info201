#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(maps)

source("../map_chart2.R")


# testing map data shenanigans
map_data <- map_data("state")
map <- ggplot() + 
  geom_polygon(data = us_map, aes(x=long, y=lat, group=group),
               color="black", fill="lightblue" )
location_coordinates <- fire_data %>% select(state, latitude, longitude)

# this plots out all the fire coordinates
fire_but_dots <- map + 
  geom_point(data = location_coordinates, aes(x=longitude, y=latitude), 
             color = "gold", size = 0.1)

merging <- inner_join(count_by_cause, ph_location_density, by = "stat_cause_descr")
data_mergeyear <- inner_join(map_data, new_count_cause, by = "region")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$map <- renderLeaflet({
    leaflet(data = new_count_cause) %>%
      addTiles() %>%
      setView(lng = -97.7129, lat = 35.0902 , zoom = 3.49) %>%
      addCircles(data = merging, lng =  merging$longitude, lat = merging$latitude)
  })
})
