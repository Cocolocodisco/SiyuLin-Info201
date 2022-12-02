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

ph_location_density <-fire_data %>% select(state, disc_clean_date, stat_cause_descr,
                                           latitude, longitude)
location_density <- fire_data %>% select(state, disc_clean_date) %>% 
  mutate(disc_clean_date, year = format(as.Date(ph_location_density$disc_clean_date, 
                                                format="%m/%d/%Y"),"%Y"))

#max(count_state$n)
# this counts the number of fires that each state has had per year
count_by_cause <- ph_location_density %>%
  group_by(stat_cause_descr) %>%
  count(state) %>%
  ungroup()

new_count_cause <- count_by_cause %>%
  mutate(region = tolower(state.name[match(state, state.abb)]))

# basic us map reference
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
