library(shiny)
library(tidyverse)
library(leaflet)
library(maps)
library(plotly)

fire_data <- read.csv("./fire_data_double.csv")
unitedstate <- read.csv("./united_states_double.csv")

us_remove_99 <- unitedstate %>%
  filter(AvgTemperature != -99)

shinyServer(function(input, output) {

  output$image <- renderImage({
    list(src = "./www/fire.jpg")
  }, deleteFile = FALSE)

  # outputs an interactive bar chart
  output$bar <- renderPlotly({
    fire_data %>%
      filter(disc_pre_year == input$year) %>%
      count(stat_cause_descr) %>%
      arrange(desc(n)) %>%
      ggplot(aes(x = reorder(stat_cause_descr, n), y = n)) +
      geom_col() +
      coord_flip() +
      labs(x = "Cause of Fire", y = "Number of Fires",
           title = "Top Causes of Fire in United States") +
      theme(legend.position = "none")
  })

  # Define server logic required to draw a map
  output$map <- renderLeaflet({
    changing_data <- fire_data  %>%
      filter(stat_cause_descr == input$cause) %>%
      select(stat_cause_descr, longitude, latitude)

    leaflet() %>%
      addTiles() %>%
      setView(lng = -97.7129, lat = 35.0902, zoom = 3.49) %>%
      addCircleMarkers(data = changing_data, lng =  changing_data$longitude,
                       lat = changing_data$latitude, radius = 0.01,
                       color = "red")
  })

  # define a scatterplot to render in the UI
  output$ scatterplot <- renderPlotly({
    data_for_state1 <- us_remove_99  %>%
      filter(State == input$state) %>%
      filter(Year >= input$year_slider[1] & Year <= input$year_slider[2]) %>%
      group_by(Year) %>%
      summarise(AvgTemperature = mean(AvgTemperature))

    data_for_state2 <- us_remove_99  %>%
      filter(State == input$state2) %>%
      filter(Year >= input$year_slider[1] & Year <= input$year_slider[2]) %>%
      group_by(Year) %>%
      summarise(AvgTemperature = mean(AvgTemperature))

    data_for_state3 <- us_remove_99  %>%
      filter(State == input$state3) %>%
      filter(Year >= input$year_slider[1] & Year <= input$year_slider[2]) %>%
      group_by(Year) %>%
      summarise(AvgTemperature = mean(AvgTemperature))

    chart <- ggplot() +
      geom_point(data = data_for_state1,
                 mapping = aes_string(x = "Year", y = "AvgTemperature"),
                 color = "red"
      ) +
      geom_point(data = data_for_state2,
                 mapping = aes_string(x = "Year", y = "AvgTemperature"),
                 color = "blue"
      ) +
      geom_point(data = data_for_state3,
                 mapping = aes_string(x = "Year", y = "AvgTemperature"),
                 color = "green"
      ) +
      labs(x = "Year", y = "AvgTemperature", title = "AvgTemperature of State")
    chart
    intergraph <-  ggplotly(chart)
    intergraph
  })

})
