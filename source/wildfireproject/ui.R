library(shiny)
library(markdown)
library(leaflet)
library(tidyverse)
source(".Interactive_Bar_Chart.R")

page_one <- tabPanel(
    titlePanel("Introduction"),
        mainPanel(
            includeMarkdown("intro.md")
        )
)

fire_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/source/wildfireproject/fire_data_double.csv")

barchart_tab <- tabPanel(
  titlePanel("Bar Chart"),
  mainPanel(
    leafletOutput("Interative_Bar_Chart"), 
    p("This graph shows different wildfires that have different causes")
  )
)


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

report_tab <- tabPanel(
    titlePanel("Findings & More"),
        mainPanel( 
           includeMarkdown("findings.md")
        )
)

shinyUI(navbarPage(
    "Wildfire Data",
    page_one,
    barchart_tab,
    map_tab,
    report_tab
))
