# tab_panel_chart1
library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
library("plotly", warn.conflicts = FALSE)
library("leaflet", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)
lint("tab_panel_chart1.R")
wealth_race <- read_csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-AZAHAZA/main/data/dfa-race.csv")

total_size <- fire_data %>%
  select(fire_size) %>%
  summarize(
    fire_size = sum(fire_size, na.rm = TRUE)
  ) %>%
  pull(fire_size)


bar_chart_main_content <- mainPanel(
  plotlyOutput("barchart")
)

x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = select_values,
  selected = fire_data$stat_cause_descr
)

y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = select_values,
  selected = fire_data$X
)

color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "cyan", "Blue" = "blue", "Violet" = "purple3")
)

tab_panel_chart1 <- tabPanel(
  "Chart 1",
  tags$div(class = "chart_type", "Bar Chart"),
  p("This is a bar chart that illustrates the number of fires caused by different causes in the United States."),
  sidebarLayout(
    sidebarPanel(x_input,
                 y_input,
                 color_input),
    bar_chart_main_content,
  ),
  tags$div(
    tags$br(),
    "Our group wants to examine fire distribution among different causes.
      Since the bar chart is effective in showing the
      distribution of categorical data and numerical data,
      it is appropriate to employ the chart in our analysis.
      We also include the interactive select input to allow
      the user to choose which variable to display.
      According to the chart, "
  )
)
