# Interactive_Bar_Chart
library(shiny)
library(lintr)
library("tidyverse", warn.conflicts = FALSE)
library("plotly", warn.conflicts = FALSE)
library("leaflet", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)
library("dplyr", warn.conflicts = FALSE)

#Read the dataset
fire_data <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/source/wildfireproject/fire_data_double.csv")

#Sums up the fire sizes
total_size <- fire_data %>%
  select(fire_size) %>%
  summarize(
    fire_size = sum(fire_size, na.rm = TRUE)
  ) %>%
  pull(fire_size)

#Sums up the fire magnitudes
total_magnitude <- fire_data %>%
  select(fire_mag) %>%
  summarize(
    fire_mag = sum(fire_mag, na.rm = TRUE)
  ) %>%
  pull(fire_mag)



#Arrange the variables
proportion <- fire_data %>%
  select(stat_cause_descr, fire_mag, fire_size) %>%
  rename(cause = stat_cause_descr) %>%
  group_by(cause) %>%
  summarize(
    size = sum(fire_size, na.rm = TRUE),
    magnitude = sum(fire_mag, na.rm = TRUE),
    
#   mutate(
#     proportion_size = fire_size / total_size,
#      proportion_magnitude = fire_mag / total_magnitude
    ) 

#Puts all the variables into one 
select_values <- colnames(proportion)

#Plot the bar chart
bar_chart_main_content <- mainPanel(
  plotlyOutput("barchart")
)

#Insert variables into the X-axis of bar chart
x_input <- selectInput(
  "x_var",
  label = "X Variable",
  choices = select_values,
  selected = "cause"
)

#Insert variables into the Y-axis of bar chart
y_input <- selectInput(
  "y_var",
  label = "Y Variable",
  choices = select_values,
  selected = "size"
)

#Add function to change color of the bar chart
color_input <- selectInput(
  "color",
  label = "Color",
  choices = list("Red" = "red", "cyan", "Blue" = "blue", "Violet" = "purple3")
)

#Render the Bar Chart
Interactive_Bar_Chart <- tabPanel(
  titlePanel("Bar Chart"),
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
      the user to choose which variable to display."
  ),
)

