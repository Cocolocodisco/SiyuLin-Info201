library(shiny)
library(markdown)
library(leaflet)
library(tidyverse)
library(shinythemes)
library(plotly)

source("Interactive_Bar_Chart.R")

page_one <- tabPanel(
    titlePanel("Introduction"),
        mainPanel(
            includeMarkdown("intro.md"), 
            imageOutput("image")
        )
)

fire_data <- read.csv("./fire_data_double.csv")
unitedstate <- read.csv("./united_states_double.csv")

# page_bar <- tabPanel(
#   titlePanel("Bar Chart"),
# 
# ) 
map_tab <- tabPanel(
    titlePanel("Interactive Map"),
    sidebarLayout(
        sidebarPanel(
            selectInput("cause",
                        "Initial Cause of Wildfire",
                        c(unique(fire_data$stat_cause_descr))
            )
        ),
        # Show a plot of the generated distribution
        mainPanel(
            leafletOutput("map"), 
            p("This graph shows different wildfires that have happened between the
              years 1992 and 2015 in the United States, including Alaska and Hawaii.
              The dropdown menu on the left lets the user choose an initial cause of
              the wildfire, and the map will display all the wildfires that started from
              that initial cause on the map.")
        )
    )
)

# user can select State, Year, use data from united_states.csv
scatterplot_tab <- tabPanel(
  titlePanel("Interactive Scatterplot"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("year_slider",
                  "Year",
                  min = 1995,
                  max = 2020,
                  value = c(1995, 2020),
                  step = 1
      ),
      selectInput("state",
                  "State",
                  c(unique(unitedstate$State))
      )
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("scatterplot"), 
      p("This graph shows the average temperature of a state in a year. The user
              can select a state and a range of years to see the average temperature of
              that state in those years, and the scatterplot will display the
              average temperature of the state in the selected years in orange.")
    )
  )
)

report_tab <- tabPanel(
    titlePanel("Conclusion"), 
    mainPanel(
        tabsetPanel(
        tabPanel("Takeaways", includeMarkdown("takeaways.md")),
        tabPanel("Findings & More", includeMarkdown("findings.md"))
        )
    )
)

shinyUI(navbarPage(
    theme = shinytheme("united"),
    "Wildfire Data",
    page_one,
    Interactive_Bar_Chart,
    map_tab,
    scatterplot_tab,
    report_tab
))
