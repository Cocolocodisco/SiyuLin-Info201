library(shiny)
library(tidyverse)
library(leaflet)
library(maps)
library(plotly)

fire_data <- read.csv("./fire_data_double.csv")
unitedstate <- read.csv("./united_states_double.csv")


shinyServer(function(input, output) {
  
  output$image <- renderImage({
    list(src = "./www/fire.jpg")
  }, deleteFile = F)
  
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
  output$ scatterplot <- renderPlotly({
    data_for_state1 <- unitedstate  %>% 
      filter(State == input$state) %>% 
      filter(Year >= input$year_slider[1] & Year <= input$year_slider[2]) %>% 
      group_by(Year) %>% 
      summarise(AvgTemperature = mean(AvgTemperature))
    
    data_for_state2 <- unitedstate  %>%
      filter(State == input$state2) %>%
      filter(Year >= input$year_slider[1] & Year <= input$year_slider[2]) %>%
      group_by(Year) %>%
      summarise(AvgTemperature = mean(AvgTemperature))
    
    data_for_state3 <- unitedstate  %>%
      filter(State == input$state3) %>%
      filter(Year >= input$year_slider[1] & Year <= input$year_slider[2]) %>%
      group_by(Year) %>%
      summarise(AvgTemperature = mean(AvgTemperature))
    
    chart <- ggplot() +
      geom_point(data = data_for_state1, mapping = aes_string(x = "Year", y = "AvgTemperature"),
                 color = "red"
      ) +
      geom_point(data = data_for_state2, mapping = aes_string(x = "Year", y = "AvgTemperature"),
                 color = "blue"
      ) +
      geom_point(data = data_for_state3, mapping = aes_string(x = "Year", y = "AvgTemperature"),
                 color = "green"
      ) +
      labs(x = "Year", y = "AvgTemperature", title = "AvgTemperature of State") 
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })
  
})
