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
    titlePanel("Interactive Map")
)

report_tab <- tabPanel(
    titlePanel("Findings, Discussion, Conclusions"),
        mainPanel( 
           includeMarkdown("findings.md")
        )
)

shinyUI(navbarPage(
    "Wildfire Data & Summary",
    page_one,
    map_tab,
    report_tab
))
