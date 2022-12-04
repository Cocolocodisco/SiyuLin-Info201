library(shiny)
library(tidyverse)
library(leaflet)
library(maps)
library(plotly)

fire_data <- read.csv("./fire_data_double.csv")
unitedstate <- read.csv("./united_states_double.csv")


shinyServer(function(input, output) {
  
  output$barchart <- renderPlotly({
    title <- paste0("Fire Distribution by ",
                    input$x_var, " and ", input$y_var)
    chart <- ggplot(proportion) +
      geom_col(mapping = aes_string(x = input$x_var, y = input$y_var),
               color = input$color
      ) +
      labs(x = input$x_var, y = input$y_var, title = title)
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })
  
  # Define server logic required to draw a map
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
  
  # define a scatterplot to render in the UI
  output$scatterplot <- renderPlotly({
    changing_data <- unitedstate %>%
      filter(State == input$state) %>%
      filter(Year >= input$year_slider[1] & Year <= input$year_slider[2]) %>%
      group_by(Year) %>%
      summarise(AvgTemperature = mean(AvgTemperature))
    title <- paste0("Average Temperature of ", input$state, " from ", input$year_slider[1], " to ", input$year_slider[2])
    chart <- ggplot(changing_data) +
      geom_point(mapping = aes(x = Year, y = AvgTemperature), color = "orange") +
      labs(x = "Year", y = "Average Temperature", title = title)
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })
  
})
