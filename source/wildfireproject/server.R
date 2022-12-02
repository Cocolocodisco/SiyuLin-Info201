#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


#source("../map_chart2.R")


# testing map data shenanigans
library(shiny)
library(tidyverse)
library(leaflet)
library(maps)


fire_data <- read.csv("../../data/FW_Veg_Rem_Combined.csv")

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
