library(shiny)
library(tidyverse)
library(leaflet)
library(maps)

fire_data <- read.csv("./fire_data_double.csv")

# Define server logic required to draw a map
shinyServer(function(input, output) {
  
  output$map <- renderLeaflet({
    changing_data <- fire_data  %>%
      filter(stat_cause_descr == input$cause) %>%
      select(stat_cause_descr, longitude, latitude)
  
    leaflet() %>%
      addTiles() %>%
      setView(lng = -97.7129, lat = 35.0902 , zoom = 3.49) %>%
      addCircleMarkers(data = changing_data, lng =  changing_data$longitude, 
                       lat = changing_data$latitude, radius = 0.01, color = "red")
  })
  
})
