library(shiny)
library(markdown)
library(leaflet)
library(tidyverse)

page_one <- tabPanel(
    titlePanel("Introduction")
)

fire_data <- read.csv("./fire_data_double.csv")

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
            leafletOutput("map")
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
    map_tab,
    report_tab
))
