#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)

page_one <- tabPanel(
    titlePanel("Introduction")
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
